import 'dart:convert';

class SearchData {
  final List prints;

  SearchData({this.prints});

  factory SearchData.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SearchData(
      prints: map['prints'],
    );
  }

  factory SearchData.fromJson(String source) =>
      SearchData.fromMap(json.decode(source));
}
