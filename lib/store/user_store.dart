import 'package:flutter/material.dart';
import '../model/user.dart';

class UserStore extends ChangeNotifier {
  final int userId;

  UserStore({this.userId});
}
