import 'dart:convert';

class SearchData {
  final String textureUrl;

  SearchData({this.textureUrl});

  factory SearchData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchData(
      textureUrl: map['textureUrl'],
    );
  }

  factory SearchData.fromJson(String source) =>
      SearchData.fromMap(json.decode(source));
}
