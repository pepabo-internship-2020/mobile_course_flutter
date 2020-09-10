import 'dart:convert';

class Product {
  final int id;
  final String title;
  final String sampleImageUrl;
  final String sampleUrl;

  Product({this.id, this.title, this.sampleImageUrl, this.sampleUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'sampleImageUrl': sampleImageUrl,
      'sampleUrl': sampleUrl,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      id: map['id'],
      title: map['title'],
      sampleImageUrl: map['sampleImageUrl'],
      sampleUrl: map['sampleUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
