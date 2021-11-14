import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipies_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var vegGridList = [
  {
    "rField": "All",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2FVegetarian.jpg?alt=media&token=fe26e6a1-4847-47b6-be48-35d1462d6038"
  },
  {
    "rField": "Breakfast",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2FBreakfast.jpg?alt=media&token=da361c99-ec48-4ebb-8429-acf00cd289f8"
  },
  {
    "rField": "Main Course",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2Fmain%20course.jpg?alt=media&token=5a8128a6-86be-4243-a837-6205d9a763e9"
  },
  {
    "rField": "Sweets",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2Fsweets.jpg?alt=media&token=50fe0edb-7714-4f03-8e09-5ecd07049436"
  },
  {
    "rField": "Desserts",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2FDesserts.jpg?alt=media&token=6996837d-391b-4990-845d-db79b7565e24"
  },
  {
    "rField": "Indian Street Food",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2Fstreet%20food.jpg?alt=media&token=c0b70e00-7c56-47fb-bf55-9053e241b01d"
  },
  {
    "rField": "World",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2Fworld%20cusine.jpg?alt=media&token=627a4377-5716-48d7-8c84-4c6221cec4f9"
  },
  {
    "rField": "South Indian",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2FSouth%20Indian.jpg?alt=media&token=b2dda211-9ae7-446c-8d06-484300ddbcde"
  },
  {
    "rField": "North Indian",
    "rImgURL":
        "https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2FNorth%20indian.jpg?alt=media&token=b75acd19-2f0f-43d5-84df-646bb391b668"
  },
];

class VegRecipies extends StatelessWidget {
  const VegRecipies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Veg Recipies"),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 2),
        itemCount: vegGridList.length,
        itemBuilder: (BuildContext context, int index) {
          //String? rFied = vegGridList[index]["rField"];
          //var rImgURl = vegGridList[index]["rImgURl"];

          return InkWell(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: CachedNetworkImage(
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    imageUrl: vegGridList[index]["rImgURL"].toString(),
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    vegGridList[index]["rField"].toString(),
                    textScaleFactor: 1.7,
                  ),
                ),
              ],
            ),
            onTap: () {
              Get.to(() => VegRecipiesList(),
                  arguments: vegGridList[index]["rField"]);
            },
          );
        },
      ),
    );
  }
}
