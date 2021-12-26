import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietapp_v002/screens/recipiesEdit/edit_each_recipie.dart';
import 'package:dietapp_v002/screens/recipiesEdit/recipies_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';

class RecipiesListViewForEdit extends StatefulWidget {
  const RecipiesListViewForEdit({Key? key}) : super(key: key);

  @override
  _RecipiesListViewForEditState createState() =>
      _RecipiesListViewForEditState();
}

class _RecipiesListViewForEditState extends State<RecipiesListViewForEdit> {
  @override
  Widget build(BuildContext context) {
    Map recipiesMap = RecipiesList().recipiesMap;

    var tileColor = Colors.blue;

    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          //padding: EdgeInsets.all(1),
          itemCount: 50,
          itemBuilder: (BuildContext context, int index) {
            var isTileTap = false;
            String docID = recipiesMap.keys.elementAt(index);
            String img = recipiesMap[docID]["img150"];
            String title = recipiesMap[docID]["Common_name"];
            var isTap = false;

            return GFListTile(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              onTap: () {
                Get.to(EditEachRecipie(), arguments: docID);
              },
              color: isTap ? Colors.black12 : Colors.white,
              avatar: GFAvatar(
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  child: CachedNetworkImage(
                    placeholder: (context, url) => const GFLoader(
                      type: GFLoaderType.ios,
                    ),
                    imageUrl: img,
                    width: double.infinity,
                    height: double.infinity,
                    errorWidget: (context, url, error) {
                      return const GFLoader(
                        type: GFLoaderType.ios,
                      );
                    },
                  ),
                ),
              ),
              titleText: title,
            );

            // ListTile(
            //   title: Text("$index"),
            // );

            //   ListTile(
            //     //selectedTileColor: Colors.black,
            // tileColor: isTileTap ? Colors.black : Colors.black12,
            // onTap: () {
            //   setState(() {
            //     isTileTap = true;
            //   });
            // },
            // title: Text(img),
            // // leading: Icon(Icons.food_bank),
            // leading: GFAvatar(
            //   backgroundColor: Colors.black12,
            //   shape: GFAvatarShape.standard,
            //   child: GFImageOverlay(
            //     shape: BoxShape.rectangle,
            //     boxFit: BoxFit.fitWidth,
            //     image: NetworkImage(img),
            //   ),
            // ),
            //GFImageOverlay(shape: BoxShape.circle,boxFit: BoxFit.fill,image: NetworkImage(recipiesMap[key]["img150"].toString()),),
            // leading: CachedNetworkImage(
            //   placeholder: (context, url) => const GFLoader(
            //     type: GFLoaderType.ios,
            //   ),
            //   imageUrl: img,
            //   errorWidget: (context, url, error) => Icon(
            //     Icons.error,
            //     color: Colors.red,
            //   ),
            // ),
            // );
          }),
    );
  }
}
