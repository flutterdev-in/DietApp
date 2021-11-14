import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'nonveg_recipies.dart/nonveg_recipies.dart';

class RecipiesMainScreen extends StatelessWidget {
  const RecipiesMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recipies"),
        toolbarHeight: 45,
      ),
      body: Column(
        children: [
          Column(
            children: [
              InkWell(
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2FVegetarian.jpg?alt=media&token=fe26e6a1-4847-47b6-be48-35d1462d6038",
                  ),
                  onTap: () {
                    Get.to(() => const VegRecipies());
                  }),
              Text(
                "Vegetarian foods",
                textScaleFactor: 2,
                textAlign: TextAlign.start,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [
              InkWell(
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2FNon%20veg.jpg?alt=media&token=b44092e7-911c-4c42-9674-b4d858123706",
                  ),
                  onTap: () {
                    Get.to(() => const NonVegRecipies());
                  }),
              Text(
                "Non Veg foods",
                textScaleFactor: 2,
              )
            ],
          ),
        ],
      ),
    );
  }
}
