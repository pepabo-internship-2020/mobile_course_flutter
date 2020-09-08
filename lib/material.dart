import 'dart:convert';

class SuzuriMaterial {
  final int id;
  final String textureUrl;
  final String title;
  final String description;
  final int price;
  final bool violation;

  SuzuriMaterial({
    this.id,
    this.textureUrl,
    this.title,
    this.description,
    this.price,
    this.violation,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'textureUrl': textureUrl,
      'title': title,
      'description': description,
      'price': price,
      'violation': violation,
    };
  }

  factory SuzuriMaterial.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return SuzuriMaterial(
      id: map['id'],
      textureUrl: map['textureUrl'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      violation: map['violation'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SuzuriMaterial.fromJson(String source) =>
      SuzuriMaterial.fromMap(json.decode(source));
}