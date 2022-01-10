import 'package:cached_network_image/cached_network_image.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/controllers/arguments_controller.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/eachRecipieSubViews/eachIngViews/edit_each_ing.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/each_recipie_ing_view.dart';
import 'package:dietapp_v002/screens/recipiesEdit/edit_each_recipie.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/recipies_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/.editeach_recipie_ingredients.dart';
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
  ArgumentsController argumentsController = Get.put(ArgumentsController());
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
            String docID0 = recipiesMap.keys.elementAt(index);
            String img = recipiesMap[docID0]["img150"];
            String docID = recipiesMap[docID0]["fID"];
            argumentsController.docID.value = docID;
            String title = recipiesMap[docID0]["Common_name"];
            var isTap = false;

            return GFListTile(
              padding: EdgeInsets.all(2),
              margin: EdgeInsets.all(2),
              onTap: () {
                Get.to(EachRecipieIngView(), arguments: docID);
              },
              //color: isTap ? Colors.black12 : Colors.white,
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
          }),
    );
  }
}
