import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietapp_v002/firestore/firestore_search_copy.dart';
import 'package:dietapp_v002/login/controllers/welcome_controller.dart';
import 'package:dietapp_v002/screens/drawer/mainView/main_drawer.dart';
import 'package:dietapp_v002/screens/drawer/mainView/main_profile_container.dart';
import 'package:dietapp_v002/screens/recipiesEdit/recipies_listview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

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
              // Container(
              //   width: 40,
              //   height: 40,
              //   child: CachedNetworkImage(
              //     imageUrl:
              //         "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Icon.png?alt=media&token=4a20e7b0-e60d-4430-a5fe-a04494f037e6",
              //     fit: BoxFit.fill,
              //   ),
              // ),
              const Text('DietApp'),
            ],
          ),
          //titleTextStyle: TextStyle(fontStyle: FontStyle.italic),
          //toolbarHeight: 40,
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
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Search and get accurate nutrition info of your favorite food from",
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              "2000+ Recipies",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              "&",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              "500+ ICMR-NIN Foods",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 100,
            ),
            ListTile(
              tileColor: Colors.lightBlue[50],
              title: Text(
                "Edit Recipies",
                textScaleFactor: 1.5,
              ),
              leading: Icon(
                Icons.food_bank,
                size: 35,
                color: Colors.green,
              ),
              trailing: Icon(Icons.edit),
              onTap: () {
                Get.to(RecipiesListViewForEdit());
              },
            ),
         
            
          ],
        ),
      ),
    );
  }
}
