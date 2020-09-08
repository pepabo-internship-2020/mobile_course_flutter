import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/material.dart';

class SuzuriMaterialProvider extends ChangeNotifier {
  List<SuzuriMaterial> _materials = [];

  List<SuzuriMaterial> get materials => _materials;

  set materials(List<SuzuriMaterial> materials) {
    _materials = materials;
    notifyListeners();
  }
}
