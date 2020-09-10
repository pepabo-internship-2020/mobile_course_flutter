
import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/material_list.dart';
import 'package:mobile_course_flutter/product_store.dart';
import 'package:provider/provider.dart';

class SearchMaterialsList extends StatelessWidget {
  final String searchText;

  const SearchMaterialsList({Key key, this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('text'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => ProductStore(),
        child: MaterialList(searchText: searchText),
      ),
    );
  }
}

