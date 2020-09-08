import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_course_flutter/main_app.dart';

void main() async {
  await DotEnv().load('.env');
  runApp(MainApp());
}
