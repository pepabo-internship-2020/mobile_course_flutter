import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_course_flutter/material.dart';
import 'package:mobile_course_flutter/material_provider.dart';
import 'package:mobile_course_flutter/model/product.dart';
import 'package:mobile_course_flutter/page/user_detail.dart';
import 'package:mobile_course_flutter/search_data.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _getSearchData(String searchText) async {
    final uri =
        Uri.https('suzuri.jp', '/api/v1/products/search', {'q': searchText});
    final token = DotEnv().env['API_TOKEN'];
    final client = http.Client();
    final response = await client.get(
      uri,
      headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
    );
    final decoded = json.decode(response.body);
    print(decoded['products'][0]['prints']);
    final List<Product> searchData = decoded['products']
        .map<Product>((json) => Product.fromMap(json))
        .toList();
    print(searchData[0].prints[0].material);
  }

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
      appBar: AppBar(
        title: Text("ShunT"),
      ),
      body: Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(16, 10, 16, 0),
          child: TextField(
            style: TextStyle(
              fontSize: 17,
            ),
            decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(22.5)),
            ),
            onSubmitted: (text) {
              _getSearchData(text);
            },
          ),
        ),
        Flexible(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => UserDetail(),
                  ),
                );
              },
              child: Image.network(materials[index].textureUrl),
            ),
            itemCount: materials.length,
          ),
        ),
      ]),
    );
  }
}
