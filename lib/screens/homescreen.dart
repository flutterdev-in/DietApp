import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietapp_v002/firestore/firestore_search.dart';
import 'package:dietapp_v002/firestore/firestore_search_copy.dart';
import 'package:dietapp_v002/screens/recipies_screen/recipies_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                child: CachedNetworkImage(
                  imageUrl:
                      "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Icon.png?alt=media&token=4a20e7b0-e60d-4430-a5fe-a04494f037e6",
                  fit: BoxFit.fill,
                ),
              ),
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
                  Get.to(() => const FirestoreSearch2());
                })
          ],
        ),
        body: const HomeGridWidgets(),
      ),
    );
  }
}

class HomeGridWidgets extends StatelessWidget {
  const HomeGridWidgets({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: const Text("Food Search"),
          subtitle: const Text("Search your favorite food"),
          trailing: const Icon(Icons.search),
          onTap: () {
            Get.to(() => const FirestoreSearch());
          },
        ),
        ListTile(
          leading: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/recipe%20image.jpg?alt=media&token=6765c45e-a14e-4646-82b9-d12c90294496"),
          title: const Text("Recipies"),
          subtitle: const Text('2000+ indian recipies nutrition data'),
          trailing: const Icon(Icons.hourglass_top),
          onTap: () {
            Get.to(() => const RecipiesMainScreen());
          },
        ),
        ListTile(
          leading: Image.network(
            "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/nutrition%20values.png?alt=media&token=69ef5ab0-b494-4038-ab4d-16c4e73c9028",
            fit: BoxFit.fill,
          ),
          title: const Text("Ingredients"),
          subtitle:
              const Text("500+ ingredients nutrition info.  Ref : ICMR, NIN"),
          trailing: const Icon(Icons.hourglass_top),
          onTap: () {
            Get.to(() => const FirestoreSearch2());
          },
        ),
        ListTile(
          leading: Image.network(
              "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/translate.jfif?alt=media&token=2d49232f-ae50-42f6-bb51-af6bf12c1206"),
          title: const Text("Food names"),
          subtitle: const Text("500+ food names in all indian laguages"),
          trailing: const Icon(Icons.hourglass_disabled),
        ),
      ],
    );
  }
}
