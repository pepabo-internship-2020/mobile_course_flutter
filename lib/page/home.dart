import 'package:flutter/material.dart';
import 'package:mobile_course_flutter/material_provider.dart';
import 'package:mobile_course_flutter/page/user_detail.dart';
import 'package:mobile_course_flutter/store/user_store.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final provider = context.read<SuzuriMaterialProvider>();
      provider.loadMaterials();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SuzuriMaterialProvider>();
    final materials = provider.materials;
    return Scaffold(
      appBar: AppBar(
        title: Text("ShunT"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            print(index);
            if (index == materials.length) {
              provider.loadMaterials();
              return Center(child: CircularProgressIndicator());
            } else if (materials.length < index) {
              return null;
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ChangeNotifierProvider<UserStore>(
                        create: (BuildContext context) =>
                            UserStore(userId: materials[index].user.id),
                        child: UserDetail(),
                      ),
                    ),
                  );
                },
                child: Image.network(materials[index].textureUrl),
              );
            }
          },
          itemCount: materials.length + 1,
        ),
      ),
    );
  }
}
