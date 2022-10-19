import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:sciflare/helpers/constants.dart';

class ApiService {
  final dio = Dio()..options = BaseOptions(
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json'
    },
    baseUrl: Constants.BASE_URL);

  ApiService() {
    addInterceptor();
  }

  void addInterceptor() {
    dio.interceptors.add(LoggyDioInterceptor());
  }

  Future<Response> getRequest(
      String endpoint, Map<String, String> query) async {
    try {
      final res = dio.get(endpoint, queryParameters: query);
      return res;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.error(e);
    }
  }

  Future<Response> postRequest(String endpoint, Map<String, String> query) async {
    try {
      final res = dio.post(endpoint, data: jsonEncode(query));
      return res;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.error(e);
    }
  }
}
