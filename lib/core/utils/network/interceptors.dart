import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:sprintf/sprintf.dart';

import '../log_utils.dart';
import 'exception/error_status.dart';

///Header management interceptor
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers["Accept"] = "application/json";
    super.onRequest(options, handler);
  }
}

///Log interceptor settings
class LoggingInterceptor extends Interceptor {
  DateTime? startTime;
  DateTime? endTime;

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    startTime = DateTime.now();
    Log.d("----------Request Start---------");
    Log.i(" path :${options.path}");

    ///print full path request
    if (options.queryParameters.isEmpty) {
      if (options.path.contains(options.baseUrl)) {
        Log.i("RequestUrl:${options.path}");
      } else {
        Log.i("RequestUrl:${options.baseUrl}${options.path}");
      }
    } else {
      ///If queryParameters is not empty, splice into a complete URl
      Log.i(
          "RequestUrl:${options.baseUrl}${options.path}?${Transformer.urlEncodeMap(options.queryParameters)}");
    }

    Log.w("RequestMethod:${options.method}");
    Log.w("RequestHeaders:${options.headers}");
    Log.w("RequestContentType:${options.contentType}");
    Log.w("RequestDataOptions:"
        "${options.data is FormData ? '${(options.data as FormData).fields}\n${(options.data as FormData).files}' : options.data.toString()}");
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    endTime = DateTime.now();
    //Request duration
    int duration = endTime!.difference(startTime!).inMilliseconds;
    Log.i("----------End Request $duration millisecond---------");
    super.onResponse(response, handler);
  }
}

//parsing data
class AdapterInterceptor extends Interceptor {
  static const String mSG = "msg";
  static const String sLASH = "\"";
  static const String mESSAGE = "message";
  static const String eRROR = "validateError";

  static const String dEFAULT = "\"NOT_FOUND\"";
  static const String notFound = "Some Thing Wrong Happened";

  static const String fAILUREFORMAT = "{\"code\":%d,\"message\":\"%s\"}";
  static const String sUCCESSFORMAT =
      "{\"code\":0,\"data\":%s,\"message\":\"\"}";

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    Response mResponse = adapterData(response);
    return super.onResponse(mResponse, handler);
  }

  @override
  onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response != null) {
      adapterData(err.response!);
    }
    return super.onError(err, handler);
  }

  Response adapterData(Response response) {
    String result;
    String content = response.data == null ? "" : response.data.toString();
    if (response.statusCode == ErrorStatus.sUCCESS) {
      if (content.isEmpty) {
        // Server returned 200 but with empty body - treat as error
        result = sprintf(fAILUREFORMAT, [ErrorStatus.sERVERERROR, "لم يتم الاتصال بالسيرفر بشكل صحيح. يرجى المحاولة لاحقًا"]);
        response.statusCode = ErrorStatus.sUCCESS;
      } else {
        result = sprintf(sUCCESSFORMAT, [content]);
        response.statusCode = ErrorStatus.sUCCESS;
      }
    } else if (response.statusCode == ErrorStatus.notToken) {
      result = sprintf(fAILUREFORMAT, [response.statusCode, "No Token"]);
      response.statusCode = ErrorStatus.sUCCESS;
    } else {
      // Try to extract a server-provided message if available
      String serverMessage = notFound;
      try {
        if (content.isNotEmpty) {
          final decoded = jsonDecode(content);
          if (decoded is Map && decoded.containsKey(mESSAGE)) {
            serverMessage = decoded[mESSAGE]?.toString() ?? serverMessage;
          } else if (decoded is Map && decoded.containsKey(mSG)) {
            serverMessage = decoded[mSG]?.toString() ?? serverMessage;
          }
        }
      } catch (_) {
        // ignore json parse errors and keep default message
      }

      result = sprintf(fAILUREFORMAT, [response.statusCode, serverMessage]);
      response.statusCode = ErrorStatus.sUCCESS;
    }
    // Safely log response data
    try {
      Log.d("ResponseCode:${response.statusCode}");
      Log.d("response:${jsonDecode(response.data)}");
    } catch (e) {
      Log.d("ResponseCode:${response.statusCode}");
      Log.d("response:${response.data}");
    }
    Log.json(result);
    response.data = result;
    return response;
  }
}
