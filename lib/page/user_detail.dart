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
    final userStore = context.watch<UserStore>();

    if (userStore.user == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            snap: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: userStore.user.displayName != null
                  ? Text(userStore.user.displayName)
                  : Text(userStore.user.name),
              background: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(userStore.user.avatarUrl),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            delegate: SliverChildBuilderDelegate(
                (context, index) => GestureDetector(
                    onTap: () =>
                        _launchURL(userStore.products[index].sampleUrl),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Image.network(
                            userStore.products[index].sampleImageUrl,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                              userStore.products[index].title,
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ),
                        ],
                      ),
                    )),
                childCount: userStore.products.length),
          )
        ],
      ),
    );
  }
}
