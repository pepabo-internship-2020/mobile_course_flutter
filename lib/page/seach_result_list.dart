import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mobile_course_flutter/model/product.dart';
import 'package:mobile_course_flutter/page/user_detail.dart';
import 'package:mobile_course_flutter/search_result_store.dart';
import 'package:mobile_course_flutter/store/user_store.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class SearchResultList extends StatefulWidget {
  final String searchText;

  const SearchResultList({Key key, this.searchText}) : super(key: key);

  @override
  _SearchResultListState createState() => _SearchResultListState(searchText);
}

class _SearchResultListState extends State<SearchResultList> {
  final String searchText;

  _SearchResultListState(this.searchText);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final searchResultStore = context.read<SearchResultStore>();
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
      searchResultStore.products = searchData;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final searchResultStore = context.watch<SearchResultStore>();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: searchResultStore.products.length,
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  ChangeNotifierProvider<UserStore>(
                create: (BuildContext context) => UserStore(
                    userId: searchResultStore
                        .products[index].prints[0].material.user.id),
                child: UserDetail(),
              ),
            ),
          );
        },
        child: Image.network(
            searchResultStore.products[index].prints[0].material.textureUrl),
      ),
    );
  }
}
