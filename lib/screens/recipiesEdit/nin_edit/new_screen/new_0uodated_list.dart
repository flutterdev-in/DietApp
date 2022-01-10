import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/.firestore_search_copy.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_edit.dart/search_edit.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/new_screen/serach_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_measures_edit_form.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_nil_updated_list.dart';
import 'package:dietapp_v002/screens/recipiesEdit/nin_edit/nin_updated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

class New0UpdatedList extends StatelessWidget {
  New0UpdatedList({Key? key}) : super(key: key);
  //var gc = Get.put(SearchForEditController());

  @override
  Widget build(BuildContext context) {
    //var name = gc.name.value;
    var name = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Measures"),
        actions: [
          GFButton(
            onPressed: () {
              Get.to(FoodSearchForEditMeasure());
            },
            text: "Search",
            textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            focusColor: Colors.green,
          )
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              GFButton(
                onPressed: () {
                  Get.to(NINnotUpdatedList1());
                },
                text: "Updated list",
              ),
              GFButton(
                onPressed: () {
                  Get.to(NINnotUpdatedList05());
                },
                text: "Doubt list",
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
          ),
          Expanded(
            child: PaginateFirestore(
              query: FirebaseFirestore.instance
                  .collection("FoodData")
                  .where("searchFields", arrayContains: name)
                  .where("updation", isEqualTo: 0),
              //.orderBy("names.Common_name", descending: true),
              itemBuilderType: PaginateBuilderType.listView,
              itemBuilder: (index, context, snapshot) {
                final data = snapshot.data() as Map;
                var foodName = data['names']['Common_name'].toString();
                var hindi = data['names']['Hindi'].toString();
                var telugu = data['names']['Telugu'].toString();
                var imgURl = data['imgURL']['img150'].toString();
                var docID = data['fID'].toString();
                var measureData = {};
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
                  title: Text(
                    foodName,
                    textScaleFactor: 1.4,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  icon: Text(docID),
                  //: "H : $hindi, T : $telugu",
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
