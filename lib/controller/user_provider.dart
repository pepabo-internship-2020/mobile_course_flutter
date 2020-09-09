import 'package:flutter/material.dart';
import '../model/user.dart';

class UserProvider extends ChangeNotifier {
  final int userId;

  UserProvider({this.userId});
}
