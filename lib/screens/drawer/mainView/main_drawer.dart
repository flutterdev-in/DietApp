import 'package:dietapp_v002/login/controllers/welcome_controller.dart';
import 'package:dietapp_v002/screens/drawer/mainView/main_profile_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerMainProfileContainer(),
          Divider(
            color: Colors.black,
          ),
          SizedBox(height: Get.height * 0.6),
          ListTile(
            tileColor: Colors.black26,
            trailing: Icon(Icons.settings),
            title: Text(
              "Settings",
              textScaleFactor: 1.2,
            ),
            onTap: () {},
          ),
          SizedBox(
            height: 1.3,
          ),
          ListTile(
              tileColor: Colors.black26,
              trailing: Icon(Icons.logout_outlined),
              title: Text(
                "Logout",
                textScaleFactor: 1.2,
              ),
              onTap: () {
                Get.find<WelcomeController>().logout();
              }),
        ],
      ),
    );
  }
}
