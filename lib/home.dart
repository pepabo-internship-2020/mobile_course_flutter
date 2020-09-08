import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final url = 'https://suzuri.jp/api/v1/materials';
      final token = DotEnv().env['API_TOKEN'];
      final client = http.Client();
      final response =
          await client.get(url, headers: {'Authorization': 'Bearer $token'});
      final decoded = json.decode(response.body);
      print(decoded);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
