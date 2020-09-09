import 'dart:convert';

class SearchData {
  final String title;

  SearchData({this.title});

  factory SearchData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchData(
      title: map['title'],
    );
  }

  factory SearchData.fromJson(String source) =>
      SearchData.fromMap(json.decode(source));
}
