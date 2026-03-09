import 'package:gyms/core/utils/functions/base_one_response.dart';

import 'offers.dart';

class MyOffersModel extends BaseOneResponse {
  const MyOffersModel({
    super.status,
    super.data,
    super.message,
  });

  factory MyOffersModel.fromJson(Map<String, dynamic> json) {
    return MyOffersModel(
      status: json['status'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Offers.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
