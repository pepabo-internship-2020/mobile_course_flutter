import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'model/product.dart';
import 'model/user.dart';

class SuzuriApiClient {
  final baseUrl = 'https://suzuri.jp/api/v1';
  final token = DotEnv().env['API_TOKEN'];
  final client = http.Client();

  Future<User> getUser({@required int userId}) async {
    final path = '/users/$userId';
    final map = await _getResponseMap(path: path);
    return User.fromMap(map['user']);
  }

  Future<List<Product>> getProductList({@required int userId}) async {
    final path = '/products?userId=$userId';
    final map = await _getResponseMap(path: path);
    return map['products']
        .map<Product>((item) => Product.fromMap(item))
        .toList();
  }

  Future<Map<String, dynamic>> _getResponseMap({@required String path}) async {
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
