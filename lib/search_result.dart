
import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/page/seach_result_list.dart';
import 'package:mobile_course_flutter/search_result_store.dart';
import 'package:provider/provider.dart';

class SearchResult extends StatelessWidget {
  final String searchText;

  const SearchResult({Key key, this.searchText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suzuri Art List'),
      ),
      body: ChangeNotifierProvider(
        create: (BuildContext context) => SearchResultStore(),
        child: SearchResultList(searchText: searchText),
      ),
    );
  }
}

