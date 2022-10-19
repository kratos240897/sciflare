import 'package:flutter/foundation.dart';
import 'package:get/instance_manager.dart';
import 'package:sciflare/data/models/user.dart';
import 'package:sciflare/helpers/endpoints.dart';
import 'package:sciflare/service/api_service.dart';

class AppRepo {
  final _apiService = Get.find<ApiService>();
  Future<List<User>> getUsers() async {
    try {
      final res = await _apiService.getRequest(Endpoints.USERS, {});
      final List<User> users = [];
      for (var element in (res.data as List<dynamic>)) {
        final user = User.fromJson(element);
        users.add(user);
      }
      return users;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.error(e);
    }
  }

  Future<User> addUser(Map<String, String> query) async {
    try {
      final res = await _apiService.postRequest(Endpoints.USERS, query);
      final user = User.fromJson(res.data);
      return user;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Future.error(e);
    }
  }
}
