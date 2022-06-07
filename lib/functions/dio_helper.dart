import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper{

  static Dio? dio;

  static init(){
    dio = Dio();
  }


  static Future<Response<dynamic>?> postData({
    @required String? url,
    @required Map<String, dynamic>? data
  }) async {
    dio!.options.headers={
      "Content-Type":"application/json",
    };
    return await dio?.post(
      url!,
      data: data,
    );
  }





}

