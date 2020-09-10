import 'dart:convert';

import 'package:mobile_course_flutter/material.dart';

class Print {
  final int id;
  final String place;
  final SuzuriMaterial material;

  Print({this.material, this.place, this.id});

  factory Print.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Print(
      id: map['id'],
      place: map['place'],
      material: SuzuriMaterial.fromMap(map['material']),
    );
  }

  factory Print.fromJson(String source) => Print.fromMap(json.decode(source));
}
