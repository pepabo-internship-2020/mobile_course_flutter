import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final token = DotEnv().env['API_TOKEN'];
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(token),
        ),
      ),
    );
  }
}
