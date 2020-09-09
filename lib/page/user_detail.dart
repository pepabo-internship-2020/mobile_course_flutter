import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/store/user_store.dart';
import 'package:provider/provider.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userStore = context.watch<UserStore>();
    return Scaffold(
      appBar: AppBar(
        title: Text('aaa'),
      ),
      body: Center(
        child: Text('遷移'),
      ),
    );
  }
}
