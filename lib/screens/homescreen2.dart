import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/fireStorage/get_URLs.dart';
import 'package:dietapp_v002/firestore/firestore_search_copy.dart';
import 'package:dietapp_v002/login/controllers/welcome_controller.dart';
import 'package:dietapp_v002/screens/drawer/mainView/main_drawer.dart';
import 'package:dietapp_v002/screens/drawer/mainView/main_profile_container.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/screens/0_tobe_updated_list%20copy.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_screen/new_0uodated_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_screen/serach_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_not_updated_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_updated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class HomeScreen2 extends GetView<WelcomeController> {
  HomeScreen2({Key? key}) : super(key: key);
  WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerScrimColor: Colors.black87,
        drawer: MainDrawer(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(78, 153, 136, 1),
          title: Row(
            children: [
              const Text('DietApp'),
            ],
          ),
          actions: [
            InkWell(
                child: SizedBox(
                  child: Icon(Icons.search),
                  width: 100,
                ),
                onTap: () {
                  Get.toNamed("/firestoreSearch2");
                })
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "V0.4",
              textScaleFactor: 1.3,
            ),
            Text(
              "Search and get accurate nutrition info of your favorite food from",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            ListTile(
              title: Text(
                "Edit recipies ingredients",
                textScaleFactor: 1.5,
              ),
              tileColor: Colors.yellow,
              onTap: () {
                Get.to(NINnotUpdatedList11());
              },
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
              tileColor: Colors.lightBlue[50],
              title: Text(
                "Search for update",
                textScaleFactor: 1.5,
              ),
              leading: Icon(
                Icons.food_bank,
                size: 35,
                color: Colors.green,
              ),
              trailing: Icon(Icons.edit),
              onTap: () {
                Get.to(SearchForUpdate());
              },
            ),
            SizedBox(
              height: 20,
            ),
            ListTile(
              tileColor: Colors.lightBlue[50],
              title: Text(
                "Edit Measurements",
                textScaleFactor: 1.5,
              ),
              leading: Icon(
                Icons.food_bank,
                size: 35,
                color: Colors.green,
              ),
              trailing: Icon(Icons.edit),
              onTap: () {
                Get.to(NINnotUpdatedList());
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
