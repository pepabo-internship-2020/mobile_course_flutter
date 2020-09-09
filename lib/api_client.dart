import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  static final baseUrl = 'https://suzuri.jp/api/v1';
  static final token = DotEnv().env['API_TOKEN'];

  static Future<Map<String, dynamic>> getMap({@required String path}) async {
    final client = http.Client();
    final url = baseUrl + path;

    final response = await client
        .get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});

    if (response.statusCode == 200) {
      return json.decode(response.body) as Map<String, dynamic>;
    } else {
      throw 'http error';
    }
  }
}
