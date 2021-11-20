import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabViewIngredients extends StatelessWidget {
  TabViewIngredients({Key? key}) : super(key: key);
  var rDataForIng = Get.arguments;

  @override
  Widget build(BuildContext context) {
    var rIDf = rDataForIng["rID"];
    var rPdata = FirebaseFirestore.instance
        .collection('rData')
        .doc(rIDf)
        .collection("rPdata")
        .limit(2)
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
            final List _list = snapshot.data!.docs;
            Map<String, dynamic> _rPdata =
                _list[0].data() as Map<String, dynamic>;
            //var rPdataP = _rPdata.keys.toList();
            var rList0 = _rPdata.values.toList();

            List rList = [];
            Map rPLmap = {};
            for (var i in rList0) {
              rPLmap.addAll(i);
              i.entries.map((e) => rList.add(e.key)).toList();
              rList.sort();
            }

            return ListView.builder(
                itemCount: rList.length,
                itemBuilder: (context, rPindex) {
                  if (rPLmap[rList[rPindex]] is! Map) {
                    return Text(
                      rPLmap[rList[rPindex]].toString(),
                      textScaleFactor: 1.3,
                      style: TextStyle(
                          color: Colors.green[900],
                          fontWeight: FontWeight.bold),
                    );
                  }
                  if (rPLmap[rList[rPindex]] is Map) {
                    var pAmount = rPLmap[rList[rPindex]]["amount"];
                    var pUnit = rPLmap[rList[rPindex]]["unit"];
                    var pName = rPLmap[rList[rPindex]]["name"];
                    var pNotes = rPLmap[rList[rPindex]]["notes"];
                    var aSpace;
                    var uSpace;
                    if (pAmount == "") {
                      aSpace = "";
                    } else {
                      aSpace = " ";
                    }
                    if (pUnit == "") {
                      uSpace = "";
                    } else {
                      uSpace = " ";
                    }
                    return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          height: 30,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                "$pAmount$aSpace$pUnit$uSpace$pName $pNotes",
                                textScaleFactor: 1.3,
                              ),
                            ],
                          ),
                        ));
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
