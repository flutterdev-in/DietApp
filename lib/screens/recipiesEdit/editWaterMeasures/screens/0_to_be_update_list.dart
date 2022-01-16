import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/functions/0a_fetch_food_from_fire.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/screens/2_doubt_list_and_no_water_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/screens/2_updated_list%20copy%202.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/screens/1_each_recipie_ing_view.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/screens/eachres.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_edit.dart/search_edit.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_edit.dart/search_edit_for_updatr.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_updated1_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_updated_list_reversed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class NINnotUpdatedList11 extends StatelessWidget {
  const NINnotUpdatedList11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update water list"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              GFButton(
                onPressed: () {
                  Get.to(WaterSubmittedList());
                },
                text: "Submitted list",
              ),
              GFButton(
                onPressed: () {
                  Get.to(WaterDoubtAndNoWaterList(), arguments: 5);
                },
                text: "Doubt list",
              ),
              GFButton(
                onPressed: () {
                  Get.to(WaterDoubtAndNoWaterList(), arguments: 8);
                },
                text: "Wrong list",
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          Expanded(
            child: PaginateFirestore(
              query: FirebaseFirestore.instance
                  .collection("FoodData")
                  .where("isRecipie", isEqualTo: true)
                  .where("waterWork", isEqualTo: 0)
                  .orderBy("fID"),
              itemBuilderType: PaginateBuilderType.listView,
              itemBuilder: (index, context, snapshot) {
                final data = snapshot.data() as Map;
                var foodName = data['names']['Common_name'].toString();
                var docID = data['fID'].toString();
                var imgURl = data['imgURL']['img150'].toString();
                return ListTile(
                  onTap: () async {
                    Get.to(EachRecipieIngVie(),
                        arguments: await FetchFoodDocs().getFmapImap(docID));
                  },
                  leading: GFAvatar(
                    //shape: GFAvatarShape.circle,

                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const GFLoader(
                        type: GFLoaderType.ios,
                      ),
                      imageUrl: imgURl,
                      width: double.infinity,
                      height: double.infinity,
                      errorWidget: (context, url, error) {
                        return const GFLoader(
                          type: GFLoaderType.ios,
                        );
                      },
                    ),
                  ),
                  //titleText: foodName,
                  title: SingleChildScrollView(
                    child: Text(
                      foodName,
                      textScaleFactor: 1.4,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    scrollDirection: Axis.horizontal,
                  ),
                  subtitle: Text(docID),
                );
              },
              isLive: true,
              itemsPerPage: 10,
            ),
          ),
        ],
      ),
    );
  }
}
