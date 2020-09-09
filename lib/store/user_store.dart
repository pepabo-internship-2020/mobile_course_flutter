import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/api_client.dart';
import '../model/product.dart';
import '../model/user.dart';

class UserStore extends ChangeNotifier {
  final int userId;
  User user;
  List<Product> products;

  UserStore({this.userId}) {
    print('constructor called');
    _fetchUser();
    _fetchUserProducts();
  }

  Future<User> _fetchUser() async {
    final map = await ApiClient.getMap(path: '/users/$userId');
    try {
      user = User.fromMap(map['user']);
    } catch (e) {
      print(e);
      // cannot find user;
    }

    print(user.toJson());
  }

  Future<List<Product>> _fetchUserProducts() async {
    final map = await ApiClient.getMap(path: '/products?userId=$userId');
    try {
      products = map['products']
          .map<Product>((item) => Product.fromMap(item))
          .toList();
    } catch (e) {
      print(e);
      // cannot find user;
    }

    print(products.toString());
  }
}
