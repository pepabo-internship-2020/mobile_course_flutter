import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/model/product.dart';

class SearchResultStore extends ChangeNotifier {
   List<Product> _products = [];

   List<Product> get products => _products;

   set products(List<Product> products) {
    _products = products;
    notifyListeners();
  }
}