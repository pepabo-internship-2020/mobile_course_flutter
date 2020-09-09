import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_course_flutter/material.dart';
import 'package:mobile_course_flutter/material_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = context.read<SuzuriMaterialProvider>();
      final url = 'https://suzuri.jp/api/v1/materials';
      final token = DotEnv().env['API_TOKEN'];
      final client = http.Client();
      final response = await client.get(url,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      final decoded = json.decode(response.body);

      final List<SuzuriMaterial> materials = decoded['materials']
          .map<SuzuriMaterial>((json) => SuzuriMaterial.fromMap(json))
          .toList();

      provider.materials = materials;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SuzuriMaterialProvider>();
    final materials = provider.materials;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                ),
          itemBuilder: (context, index) =>
              Image.network(materials[index].textureUrl),
          itemCount: materials.length,
        ),
      ),
    );
  }
}
