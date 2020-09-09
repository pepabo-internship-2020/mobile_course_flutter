import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String sampleImageUrl;
  final String url;

  Product({this.id, this.title, this.sampleImageUrl, this.url});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'sampleImageUrl': sampleImageUrl,
      'url': url,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      id: map['id'],
      title: map['title'],
      sampleImageUrl: map['sampleImageUrl'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}