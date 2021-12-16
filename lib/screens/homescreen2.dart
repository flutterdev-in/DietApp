import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietapp_v002/firestore/firestore_search_copy.dart';
import 'package:dietapp_v002/login/controllers/welcome_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen2 extends GetView<WelcomeController> {
  HomeScreen2({Key? key}) : super(key: key);
  WelcomeController welcomeController = Get.put(WelcomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawerScrimColor: Colors.black87,
        drawer: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'User Profile',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            SizedBox(
              height: 16,
            ),
            CircleAvatar(
              radius: 70,
              backgroundImage: NetworkImage(controller.user.photoURL!),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Display Name : ${controller.user.displayName}',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              controller.user.email!,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: 120),
              child: ElevatedButton(
                child: Text(
                  "Logout",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                onPressed: () {
                  controller.logout();
                },
              ),
            ),
          ],
        ),
        appBar: AppBar(
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
          ],
        ),
      ),
    );
  }
}
