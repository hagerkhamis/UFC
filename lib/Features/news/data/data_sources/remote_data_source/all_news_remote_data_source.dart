import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gyms/core/utils/functions/setup_service_locator.dart';

import '../../../../../../core/utils/network/api/network_api.dart';
import '../../../../../../core/utils/network/network_request.dart';
import '../../../../../../core/utils/network/network_utils.dart';
import '../../models/news.dart';
import '../../models/my_news_model.dart';

typedef AllNewsResponse = Either<String, AllNewsList>;

abstract class AllNewsRemoteDataSource {
  Future<AllNewsResponse> fetchAllNews(String userId);
}

class AllNewsRemoteDataSourceImpl extends AllNewsRemoteDataSource {
  @override
  Future<AllNewsResponse> fetchAllNews(String userId) async {
    try {
      AllNewsResponse allNewsResponse = left("");
      var body = {"page": "1", "per_page": "100", "mem_id": userId};
      
      await getIt<NetworkRequest>().requestFutureData<MyNewsModel>(
        Method.post,
        params: body,
        options: Options(contentType: Headers.formUrlEncodedContentType),
        url: NewApi.doServerGetNewsList,
        newBaseUrl: NewApi.baseUrl,
        onSuccess: (data) {
          // successful HTTP but server returned either no list or error code
          if (data.status == 200 && data.data != null && data.data!.isNotEmpty) {
            allNewsResponse = right(data.data!);
          } else if (data.status == 200 && (data.data == null || data.data!.isEmpty)) {
            allNewsResponse = left('لا توجد أخبار حالياً');
          } else {
            allNewsResponse = left(data.message ?? 'حدث خطأ في تحميل الأخبار');
          }
        },
        onError: (code, msg) {
          // adapter/network provided human message already
          allNewsResponse = left(msg);
        },
      );
      return allNewsResponse;
    } catch (e, st) {
      // caught unexpected exception (parsing/network/etc)
      // returning as failure so caller won't stay in loading state
      return left('حدث خطأ غير متوقع: ${e.toString()}');
    }
  }
}
