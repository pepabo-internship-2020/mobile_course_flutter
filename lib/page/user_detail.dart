import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/store/user_store.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class UserDetail extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    var userStore = context.watch<UserStore>();

    if (userStore.user == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(userStore.user.name),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, _) => Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(userStore.user.avatarUrl),
                      ),
                      Column(
                        children: [
                          Text(userStore.user.name),
                          // Text(userStore.user.displayName),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              childCount: 1,
            ),
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                    onTap: () => _launchURL(userStore.products[index].url),
                    child: Image.network(
                        userStore.products[index].sampleImageUrl)),
                childCount: userStore.products.length),
          )
        ],
      ),
    );
  }
}
