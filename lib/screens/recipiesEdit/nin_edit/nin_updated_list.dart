import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_edit.dart/search_edit.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_edit.dart/search_edit_for_updatr.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_updated1_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_updated_list_reversed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class NINnotUpdatedList1 extends StatelessWidget {
  const NINnotUpdatedList1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Updated list"), actions: [
        ElevatedButton(
          onPressed: () {
            Get.to(UpdatedListReversed());
          },
          child: Text(
            "Reverse List",
            textScaleFactor: 1.3,
          ),
        )
      ]),
      body: PaginateFirestore(
        query: FirebaseFirestore.instance
            .collection("FoodData")
            .where("updation", isEqualTo: 1)
            .orderBy("fID", descending: true),
        itemBuilderType: PaginateBuilderType.listView,
        itemBuilder: (index, context, snapshot) {
          final data = snapshot.data() as Map;
          var foodName = data['names']['Common_name'].toString();
          var hindi = data['names']['Hindi'].toString();
          var telugu = data['names']['Telugu'].toString();
          var imgURl = data['imgURL']['img150'].toString();
          var docID = data['fID'].toString();
          var measureData = data['measureData'];
          var uid = data["updationRemarks"].substring(0, 2);
          var sortedKeys = measureData.keys.toList()..sort();
          String subTitle = "";
          for (String k in sortedKeys) {
            if (k.contains("measure")) {
              subTitle = subTitle + measureData[k].toString();
            }
            if (!k.contains("measure")) {
              subTitle = subTitle + "(" + measureData[k].toString() + "),";
            }

            //else{subTitle = subTitle  +"("+measureData[k.toString()]+"),";}
          }

          return GFListTile(
            padding: EdgeInsets.all(2),
            margin: EdgeInsets.all(2),
            onTap: () {
              Get.to(NINmeasuresEditForm2(),
                  arguments: [docID, foodName, measureData]);
            },
            color: Colors.white,
            avatar: GFAvatar(
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
            title: Row(
              children: [
                Text(
                  foodName,
                  textScaleFactor: 1.4,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(uid)
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            subTitle: SingleChildScrollView(
              child: Text("$subTitle\n$docID"),
              scrollDirection: Axis.horizontal,
            ),
          );
        },
        isLive: true,
        itemsPerPage: 10,
      ),
    );
  }
}
