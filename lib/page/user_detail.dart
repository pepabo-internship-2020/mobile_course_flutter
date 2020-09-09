import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/model/user.dart';
import 'package:mobile_course_flutter/store/user_store.dart';
import 'package:provider/provider.dart';

class UserDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userStore = context.watch<UserStore>();
    User user;
    if (userStore.user != null) {
      user = userStore.user;
    }
    var products = userStore.products;
    return Scaffold(
      appBar: AppBar(
        title: Text(user != null ? user.name : ''),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) =>
              Image.network(userStore.products[index].sampleImageUrl),
          itemCount: userStore.products.length,
        ),
      ),
    );
  }
}
