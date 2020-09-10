import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_course_flutter/model/product.dart';
import 'package:mobile_course_flutter/page/user_detail.dart';
import 'package:mobile_course_flutter/product_store.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class MaterialList extends StatefulWidget {
  final String searchText;

  const MaterialList({Key key, this.searchText}) : super(key: key);

  @override
  _MaterialListState createState() => _MaterialListState(searchText);
}

class _MaterialListState extends State<MaterialList> {
  final String searchText;

  _MaterialListState(this.searchText);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = context.read<ProductStore>();
      final uri =
          Uri.https('suzuri.jp', '/api/v1/products/search', {'q': searchText});
      final token = DotEnv().env['API_TOKEN'];
      final client = http.Client();
      final response = await client.get(
        uri,
        headers: {HttpHeaders.authorizationHeader: 'Bearer $token'},
      );
      final decoded = json.decode(response.body);
      final List<Product> searchData = decoded['products']
          .map<Product>((json) => Product.fromMap(json))
          .toList();
      provider.products = searchData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ProductStore>();
    return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: provider.products.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => UserDetail(),
                  ));
            },
            child: Image.network(
                provider.products[index].prints[0].material.textureUrl)));
  }
}
