import 'dart:convert';

import 'package:mobile_course_flutter/model/print.dart';

class Product {
  final int id;
  final String title;
  final String sampleImageUrl;

  final String sampleUrl;
  final List<Print> prints;

  Product({this.id, this.title, this.sampleImageUrl, this.sampleUrl, this.prints});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'sampleImageUrl': sampleImageUrl,
      'sampleUrl': sampleUrl,
      'print': prints,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Product(
      id: map['id'],
      title: map['title'],
      sampleImageUrl: map['sampleImageUrl'],
      sampleUrl: map['sampleUrl'],
      prints: (map['prints'] as List).map<Print>((value) => Print.fromMap(value)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Product.fromJson(String source) =>
      Product.fromMap(json.decode(source));
}
