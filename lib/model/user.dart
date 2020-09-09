import 'dart:convert';

class User {
  final int id;
  final String name;
  final String displayName;
  final String avatarUrl;

  User({this.id, this.name, this.displayName, this.avatarUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'displayName': displayName,
      'avatarUrl': avatarUrl,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return User(
      id: map['id'],
      name: map['name'],
      displayName: map['displayName'],
      avatarUrl: map['avatarUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
