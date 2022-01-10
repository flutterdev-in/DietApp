import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_model.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_edit.dart/search_edit.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_screen/serach_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_updated1_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each.dart';

import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each_copy.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class FoodSearchForCopy extends StatefulWidget {
  const FoodSearchForCopy({Key? key}) : super(key: key);

  @override
  _FoodSearchForCopyState createState() => _FoodSearchForCopyState();
}

class _FoodSearchForCopyState extends State<FoodSearchForCopy> {
  var docID0 = Get.arguments[0];
  var foodName0 = Get.arguments[1];
  var name = ".a";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Card(
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search), hintText: "Type food name.."),
              onChanged: (val) async {
                await Duration(milliseconds: 500);
                setState(() {
                  name = val.toLowerCase();
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("FoodData")
              .where("searchFields", arrayContains: name)
              .where("updation", isEqualTo: 1)
              .limit(10)
              .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      Map data = snapshot.data!.docs[index].data() as Map;
                      var foodName = data['names']['Common_name'].toString();
                      var hindi = data['names']['Hindi'].toString();
                      var telugu = data['names']['Telugu'].toString();
                      var imgURl = data['imgURL']['img150'].toString();
                      var docID = data['fID'].toString();
                      String subTitle = "";
                      var measureData = {};

                      bool isMeasure = data.containsKey('measureData');

                      if (isMeasure) {
                        measureData = data['measureData'];
                        var sortedKeys = measureData.keys.toList()..sort();

                        for (String k in sortedKeys) {
                          if (k.contains("measure")) {
                            subTitle = subTitle + measureData[k].toString();
                          }
                          if (!k.contains("measure")) {
                            subTitle = subTitle +
                                "(" +
                                measureData[k].toString() +
                                "),";
                          }

                          //else{subTitle = subTitle  +"("+measureData[k.toString()]+"),";}
                        }
                      }

                      return GFListTile(
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.all(2),
                        onTap: () {
                          Get.to(NINmeasuresEditForm2(),
                              arguments: [docID0, foodName0, measureData]);
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
                        titleText: foodName,
                        icon: Text(docID),
                        subTitle: SingleChildScrollView(
                          child: Text("H : $hindi, T : $telugu\n$subTitle"),
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    });
          },
        ),

        // PaginateFirestore(
        //   query: FirebaseFirestore.instance
        //       .collection("FoodData")
        //       .where("searchFields", arrayContains: name)
        //       .orderBy("fID", descending: true),
        //   itemBuilderType: PaginateBuilderType.listView,
        //   itemBuilder: (index, context, snapshot) {
        //     final data = snapshot.data() as Map;
        //     var foodName = data['names']['Common_name'].toString();
        //     var hindi = data['names']['Hindi'].toString();
        //     var telugu = data['names']['Telugu'].toString();
        //     var imgURl = data['imgURL']['img150'].toString();
        //     var docID = data['fID'].toString();
        //     String subTitle = "";
        //     var measureData = {};
        //     bool isMeasure = data.containsKey("measureData");
        //     if (isMeasure) {
        //       measureData = data['measureData'];
        //       var sortedKeys = measureData.keys.toList()..sort();

        //       for (String k in sortedKeys) {
        //         if (k.contains("measure")) {
        //           subTitle = subTitle + measureData[k].toString();
        //         }
        //         if (!k.contains("measure")) {
        //           subTitle = subTitle + "(" + measureData[k].toString() + "),";
        //         }

        //         //else{subTitle = subTitle  +"("+measureData[k.toString()]+"),";}
        //       }
        //     }

        //     return GFListTile(
        //       padding: EdgeInsets.all(2),
        //       margin: EdgeInsets.all(2),
        //       onTap: () {
        //         Get.to(
        //             isMeasure ? NINmeasuresEditForm1() : NINmeasuresEditForm(),
        //             arguments: [docID, foodName, measureData]);
        //       },
        //       color: Colors.white,
        //       avatar: GFAvatar(
        //         //shape: GFAvatarShape.circle,

        //         child: CachedNetworkImage(
        //           fit: BoxFit.cover,
        //           placeholder: (context, url) => const GFLoader(
        //             type: GFLoaderType.ios,
        //           ),
        //           imageUrl: imgURl,
        //           width: double.infinity,
        //           height: double.infinity,
        //           errorWidget: (context, url, error) {
        //             return const GFLoader(
        //               type: GFLoaderType.ios,
        //             );
        //           },
        //         ),
        //       ),
        //       titleText: foodName,
        //       subTitle: SingleChildScrollView(
        //         child: Text("H : $hindi, T : $telugu\n$subTitle"),
        //         scrollDirection: Axis.horizontal,
        //       ),
        //     );
        //   },
        //   isLive: true,
        //   itemsPerPage: 10,
        // ),
      ),
    );
  }
}
