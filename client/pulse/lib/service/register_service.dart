
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegisterService extends ChangeNotifier {
  String? firstName;
  String? lastName;
  String? country;
  String? city;
  String? email;
  String? phone;
  String? password;

  final Dio _dio = Dio();

  Future<Map<String, dynamic>> register () async {
    late final Map<String, dynamic> result;

    try{
      await _dio.post(
        "${dotenv.get("API_URL", fallback: "API_URL_NOT_FOUND")}/auth/sign-up",
        data: jsonEncode({
          "firstName": firstName,
          "lastName": lastName,
          "location": "$country, $city",
          "email": email,
          "phone": phone,
          "password": password
        })
      ).then((res) => result = res.data).catchError((error) => throw Exception(error));
    } catch (error) {
      throw Exception(error);
    }

    return result;
  }

}