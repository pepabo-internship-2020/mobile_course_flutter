import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/material.dart';
import 'package:mobile_course_flutter/suzuri_api_client.dart';

class SuzuriMaterialProvider extends ChangeNotifier {
  List<SuzuriMaterial> _materials = [];
  final limit = 20;
  var offset = 0;
  final apiClient = SuzuriApiClient();

  List<SuzuriMaterial> get materials => _materials;

  void loadMaterials() async {
    final List<SuzuriMaterial> extra =
        await apiClient.getMaterialList(offset: offset, limit: limit);
    materials.addAll(extra);
    notifyListeners();
    offset += limit;
  }
}
