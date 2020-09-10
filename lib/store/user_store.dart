import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/suzuri_api_client.dart';
import '../model/product.dart';
import '../model/user.dart';

class UserStore extends ChangeNotifier {
  final int userId;
  User user;
  List<Product> products = [];
  final apiClient = SuzuriApiClient();

  UserStore({@required this.userId}) {
    _fetchUser();
    _fetchUserProducts();
  }

  Future<void> _fetchUser() async {
    try {
      user = await apiClient.getUser(userId: userId);
    } catch (e) {
      print(e);
      // cannot find user;
    }
    notifyListeners();
  }

  Future<void> _fetchUserProducts() async {
    try {
      products = await apiClient.getUserProductList(userId: userId);
      notifyListeners();
    } catch (e) {
      print(e);
      // cannot find user;
    }
  }
}
