import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEachRecipieIngredients extends StatelessWidget {
  EditEachRecipieIngredients({Key? key}) : super(key: key);
  var rDataForIng = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var rIDf = Get.arguments;
    var rPdata = FirebaseFirestore.instance
        .collection('FoodData')
        .doc(rIDf)
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
            // final List _list = snapshot.data!.docs;
            // Map<String, dynamic> _rPdata =
            //     _list[0].data() as Map<String, dynamic>;
            // //var rPdataP = _rPdata.keys.toList();
            // var rList0 = _rPdata.values.toList();

            // for (var i in rList0) {
            //   rPLmap.addAll(i);
            //   i.entries.map((e) => rList.add(e.key)).toList();
            //   rList.sort();
            // }
            var datafromQuery = EachIngModel().datafromQuery(snapshot);
            List rList = datafromQuery[0];
            Map rPLmap = datafromQuery[1];

            return ListView.builder(
                padding: EdgeInsets.all(5),
                itemCount: rList.length,
                itemBuilder: (context, rPindex) {
                  var ing = rPLmap[rList[rPindex]];

                  if (ing is! Map) {
                    return Text(
                      ing.toString(),
                      textScaleFactor: 1.3,
                      style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold),
                    );
                  }
                  if (ing is Map) {
                    EachIngModel ingModel = EachIngModel.fromMap(ing);
                    var iCodeName = ingModel.iCode;
                    var iCode = ingModel.iCode;
                    void getIcode() async {
                      await FirebaseFirestore.instance
                          .collection("FoodData")
                          .doc(ingModel.iCode)
                          .get()
                          .then((DocumentSnapshot documentSnapshot) {
                        if (documentSnapshot.exists) {
                          var doc = documentSnapshot.data() as Map;
                          iCodeName = doc["names"]["Common_name"];
                        }
                      });
                    }

                    getIcode();
                    var aSpace = ingModel.amount == "" ? "" : " ";
                    var uSpace = ingModel.unit == "" ? "" : " ";
                    var pNotes = ingModel.notes;
                    var nwUnit =
                        ingModel.NwUnit == null ? "(...)" : ingModel.NwUnit;
                    return ListTile(
                      
                      isThreeLine: true,
                      title: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              "${ingModel.NwAmt} ${nwUnit} || ",
                              textScaleFactor: 1.2,
                            ),
                            StreamBuilder<DocumentSnapshot>(
                              stream: FirebaseFirestore.instance
                                  .collection("FoodData")
                                  .doc(ingModel.iCode)
                                  .snapshots(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot>
                                      documentSnapshot) {
                                if (documentSnapshot.hasError) {
                                  return const Text('Error');
                                }

                                if (documentSnapshot.hasData &&
                                    !documentSnapshot.data!.exists) {
                                  return const Text("No records found");
                                }

                                if (documentSnapshot.hasData &&
                                    documentSnapshot.data!.exists) {
                                  Map<String, dynamic> data =
                                      documentSnapshot.data!.data()
                                          as Map<String, dynamic>;
                                  var nm = data["names"]["Common_name"];
                                  return Text(
                                    nm == "" ? "(???)" : nm,
                                    textScaleFactor: 1.2,
                                  );
                                }

                                return Text("Loading..");
                              },
                            ),
                          ],
                        ),
                      ),

                      // Text(
                      //   "${ingModel.NwAmt} ${nwUnit} | ${iCodeName}",
                      //   textScaleFactor: 1.3,
                      // )),
                      subtitle: SingleChildScrollView(
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
                    return Text("Data missing");
                  }
                });
          } else {
            return Text("Data ");
          }
        });
  }
}
