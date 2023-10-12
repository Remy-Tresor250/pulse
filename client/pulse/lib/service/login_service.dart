import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginService extends ChangeNotifier {
  String? username;
  String? password;

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login() async {
    late final Map<String, dynamic> result;

    await _dio.post(
      "${dotenv.get("API_URL", fallback: "API_URL_NOT_FOUND")}/auth/sign-in",
      data: jsonEncode({
        "username": username,
        "password": password
      }),
    ).then((res) {
      result = res.data;
    }).catchError((error) {
      throw Exception(error);
    });

    return result;
  }

}