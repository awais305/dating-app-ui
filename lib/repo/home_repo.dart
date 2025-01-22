import 'dart:io';

import 'package:dating_app_ui/models/users_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'logger.dart';

class HomeRepo {
  Future<UsersModel> fetchUsers(int pageCount) async {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: 'https://randomuser.me/api',
        connectTimeout: Duration(milliseconds: 5000),
        receiveTimeout: Duration(milliseconds: 5000),
      ),
    )..interceptors.add(Logger());

    try {
      var response = await dio.get('/?page=$pageCount&results=10');

      UsersModel users = UsersModel.fromJson(response.data);
      debugPrint(users.toJson().toString());
      return users;
    } on SocketException catch (_) {
      throw SocketException('Check Internet Connection');
    } on DioException catch (e) {
      throw DioException(
          error: e.error, message: e.message, requestOptions: RequestOptions());
    } catch (e) {
      throw Exception('e.toString()');
    }
  }
}
