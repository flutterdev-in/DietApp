import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/controllers/arguments_controller.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/eachRecipieSubViews/eachIngViews/edit_each_ing.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/eachRecipieSubViews/stream_for_iCode.dart';
import 'package:dietapp_v002/screens/recipiesEdit/.edit_each_ing_of_recipie.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_new_model.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/food_id_model_for_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';

// Mother -- each_recipie_ing_view.dart

class StreamListViewIngs extends StatelessWidget {
  StreamListViewIngs({Key? key}) : super(key: key);
  ArgumentsController argumentsController = Get.find();
  @override
  Widget build(BuildContext context) {
    Stream ingData = FirebaseFirestore.instance
        .collection("FoodData")
        .doc(argumentsController.docID.value)
        .collection("ingData")
        .doc("draftIngData")
        .snapshots();

    return StreamBuilder(
        stream: ingData,
        builder: (BuildContext context, AsyncSnapshot docSnap) {
          if (docSnap.hasError) {
            return ListTile(leading: Icon(Icons.error));
          }
          if (docSnap.hasData && !docSnap.data!.exists) {
            return const ListTile(leading: Icon(Icons.error));
          }
          if (docSnap.hasData && docSnap.data!.exists) {
            Map<String, dynamic> oldIngData =
                docSnap.data!.data() as Map<String, dynamic>;
            argumentsController.ingsData.value = oldIngData;
            List oldIngDataKeys = oldIngData.keys.toList()..sort();
            return ListView.builder(
                itemCount: oldIngData.length,
                itemBuilder: (BuildContext context, int index) {
                  String indexKey = oldIngDataKeys[index];
                  var eachIngMap = oldIngData[indexKey];

                  if (eachIngMap is! Map) {
                    return GFListTile(
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          eachIngMap.toString(),
                          textScaleFactor: 1.6,
                          style: TextStyle(
                              color: Colors.green[900],
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    );
                  } else {
                    EachIng eachIngModel = EachIng.fromMap(eachIngMap);
                    print(eachIngModel.fID);
                    // argumentsController.foodModelFromFire(eachIngMap["fID"]);
                    // print("Hi");
                    return GFListTile(
                      onTap: () async {
                        await FirebaseFirestore.instance
                            .collection("FoodData")
                            .doc(eachIngMap["fID"])
                            .get()
                            .then((DocumentSnapshot<Map<String, dynamic>>
                                documentSnapshot) {
                          print("object");
                          var fMap = documentSnapshot.data() as Map;
                          print(fMap["nutriData"].toString());
                          FoodModelForEachIngEdit.fromMap(fMap);
                        });

                        Get.to(EditEachIng(), arguments: indexKey);
                      },
                      padding: EdgeInsets.all(2),
                      margin: EdgeInsets.all(2),
                      avatar: StreamForIcode.img150(fID: EachIng().fID),
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: StreamForIcode.name(fID: EachIng().fID),
                        // Text(FoodModelForEachIngEdit().commonName,
                        // textScaleFactor: 1.1,
                        // style: TextStyle(
                        //   color: Colors.brown,
                        // )),
                      ),
                      subTitle: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text("",
                            textScaleFactor: 1.1,
                            style: TextStyle(
                              color: Colors.brown,
                            )),
                      ),
                    );
                  }
                });
          }
          return Text("data");
        });
  }
}
