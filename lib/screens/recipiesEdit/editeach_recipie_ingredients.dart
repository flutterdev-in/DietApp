import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/edit_each_ing_of_recipie.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

class EditEachRecipieIngredients extends StatefulWidget {
  EditEachRecipieIngredients({Key? key}) : super(key: key);

  @override
  State<EditEachRecipieIngredients> createState() =>
      _EditEachRecipieIngredientsState();
}

class _EditEachRecipieIngredientsState
    extends State<EditEachRecipieIngredients> {
  //var rDataForIng = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var docID = Get.arguments;
    var rPdata = FirebaseFirestore.instance
        .collection('FoodData')
        .doc(docID)
        .collection("ingData")
        .snapshots();

    return StreamBuilder<QuerySnapshot>(
        stream: rPdata,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Text("Loading");
          }
          if (snapshot.hasData) {
            var datafromQuery = EachIngModel().datafromQuery(snapshot);
            Map oldIngMap = datafromQuery[0];
            List rList = datafromQuery[1];
            Map rPLmap = datafromQuery[2];

            return ListView.builder(
                //padding: EdgeInsets.all(5),
                itemCount: rList.length,
                itemBuilder: (context, rPindex) {
                  var eachIngMap = rPLmap[rList[rPindex]];

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
                      // avatar: GFAvatar(
                      //     backgroundColor: Colors.black12,
                      //     shape: GFAvatarShape.square,
                      //     child: Icon(Icons.food_bank,size: double.infinity,)),
                    );
                  }
                  if (eachIngMap is Map) {
                    EachIngModel ingModel = EachIngModel.fromMap(eachIngMap);

                    var iCode = ingModel.iCode;

                    var aSpace = ingModel.amount == "" ? "" : " ";
                    var uSpace = ingModel.unit == "" ? "" : " ";
                    var pNotes = ingModel.notes;
                    var nwUnit =
                        ingModel.NwUnit == null ? "(null)" : ingModel.NwUnit;

                    return StreamBuilder<DocumentSnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection("FoodData")
                            .doc(ingModel.iCode)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<DocumentSnapshot> documentSnapshot) {
                          if (documentSnapshot.hasError) {
                            return const ListTile(leading: Icon(Icons.error));
                          }

                          if (documentSnapshot.hasData &&
                              !documentSnapshot.data!.exists) {
                            return const ListTile(leading: Icon(Icons.error));
                          }

                          if (documentSnapshot.hasData &&
                              documentSnapshot.data!.exists) {
                            Map<String, dynamic> data = documentSnapshot.data!
                                .data() as Map<String, dynamic>;
                            var img = data["imgURL"]["img150"];
                            var iCodeName = data["names"]["Common_name"];
                            var servingData = data["servingData"];

                            var isNIN =
                                data["fDetails"]["sourceWebsite"] == "ICMR-NIN"
                                    ? true
                                    : false;

                            List forEditIngList = [
                              docID,
                              oldIngMap,
                              eachIngMap,
                              iCode,
                              iCodeName,
                              servingData,
                              isNIN,
                            ];

                            return GFListTile(
                              onTap: () {
                                Get.to(EditEachIngOfRecipie(),arguments: forEditIngList);
                              },
                              padding: EdgeInsets.all(2),
                              margin: EdgeInsets.all(2),
                              avatar: img == null
                                  ? Icon(Icons.error)
                                  : GFAvatar(
                                      backgroundColor: Colors.blueGrey[700],
                                      child: GFImageOverlay(
                                        shape: BoxShape.circle,
                                        image: NetworkImage(img),
                                        width: double.infinity,
                                        height: double.infinity,
                                      )),
                              title: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "${ingModel.NwAmt} ${nwUnit} || $iCodeName",
                                  textScaleFactor: 1.1,
                                ),
                              ),
                              subTitle: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                    "${ingModel.amount}$aSpace${ingModel.unit}$uSpace${ingModel.name} $pNotes \n TotalQty = ${ingModel.QtyInGms} g,  iCode = ${ingModel.iCode}",
                                    textScaleFactor: 1.1,
                                    style: TextStyle(
                                      color: Colors.brown,
                                    )),
                              ),
                            );
                          } else {
                            return const ListTile(leading: Icon(Icons.error));
                          }
                        });
                  } else {
                    return Text("Data ");
                  }
                });
          }
          return ListTile(
            title: Text("Error loading data"),
          );
        });
  }
}
