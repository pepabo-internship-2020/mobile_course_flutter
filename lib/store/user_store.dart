import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/api_client.dart';
import '../model/product.dart';
import '../model/user.dart';

class UserStore extends ChangeNotifier {
  final int userId;
  User user;
  List<Product> products = [];

  UserStore({this.userId}) {
    print('constructor called');
    _fetchUser();
    _fetchUserProducts();
  }

  Future<void> _fetchUser() async {
    try {
      final map = await ApiClient.getMap(path: '/users/$userId');
      user = User.fromMap(map['user']);
    } catch (e) {
      print(e);
      // cannot find user;
    }
    notifyListeners();
    print(user.toJson());
  }

  Future<void> _fetchUserProducts() async {
    try {
      final map = await ApiClient.getMap(path: '/products?userId=$userId');
      products = map['products']
          .map<Product>((item) => Product.fromMap(item))
          .toList();
      notifyListeners();
    } catch (e) {
      print(e);
      // cannot find user;
    }
    print(products.toString());
  }
}
