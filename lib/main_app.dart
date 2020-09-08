import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_course_flutter/home.dart';
import 'package:provider/provider.dart';

import 'material_provider.dart';

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: ChangeNotifierProvider<SuzuriMaterialProvider>(
            create: (BuildContext context) => SuzuriMaterialProvider(),
            child: Home()));
  }
}