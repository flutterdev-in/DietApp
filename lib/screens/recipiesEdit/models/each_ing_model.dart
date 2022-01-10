import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/firestore_models/firestore_instances.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EachIngModel {
  var NwAmt, NwUnit, NwName, QtyInGms, amount, iCode, name, unit, notes;
  EachIngModel({
    this.NwAmt,
    this.NwName,
    this.NwUnit,
    this.QtyInGms,
    this.amount,
    this.iCode,
    this.name,
    this.unit,
    this.notes,
  });

  Map<String, dynamic> toMapp() {
    return {
      "NwAmt": NwAmt,
      "NwName": NwName,
      "QtyInGms": QtyInGms,
      "amount": amount,
      "iCode": iCode,
      "name": name,
      "unit": unit,
      "notes": notes,
      "NwUnit": NwUnit,
    };
  }

  factory EachIngModel.fromMap(Map ing) {
    return EachIngModel(
      NwAmt: ing["NwAmt"],
      NwName: ing["NwName"],
      QtyInGms: ing["QtyInGms"],
      amount: ing["amount"],
      iCode: ing["iCode"],
      name: ing["name"],
      unit: ing["unit"],
      notes: ing["notes"],
      NwUnit: ing["NwUnit"],
    );
  }

  datafromQuery(AsyncSnapshot<DocumentSnapshot> documentSnapshot) {
    if (documentSnapshot.hasData &&
                              documentSnapshot.data!.exists) {
      //final List _list = documentSnapshot.data!.docs;

      
      Map<String, dynamic> oldIngMap = documentSnapshot.data!.data() as Map<String, dynamic>;
      //var rPdataP = _rPdata.keys.toList();
      var rList0 = oldIngMap.values.toList();

      List rList = [];
      Map rPLmap = {};
      for (var i in rList0) {
        rPLmap.addAll(i);
        i.entries.map((e) => rList.add(e.key)).toList();
        rList.sort();
      }
      var ingListMap = [oldIngMap, rList, rPLmap];
      return ingListMap;
    }
  }

  updatedIngMaptoFire(docID, oldIngMap, newIngMap) {}

  iCodeName(iCode) async {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection("FoodData")
          .doc(iCode)
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot> documentSnapshot) {
        if (documentSnapshot.hasError) {
          return const Text('Error');
        }

        if (documentSnapshot.hasData && !documentSnapshot.data!.exists) {
          return const Text("No records found");
        }

        if (documentSnapshot.hasData && documentSnapshot.data!.exists) {
          Map<String, dynamic> data =
              documentSnapshot.data!.data() as Map<String, dynamic>;
          return Text(data["names"]["Common_name"]);
        }

        return Text("Loading..");
      },
    );
  }
}

class ForEditIng {
  var docID,
      oldIngMap,
      eachIngMap,
      iCode,
      iCodeName,
      servingData,
      isNIN,
      realValues,
      oldValues,
      oldImg;

  ForEditIng({
    this.docID,
    this.eachIngMap,
    this.iCode,
    this.iCodeName,
    this.oldIngMap,
    this.servingData,
    this.isNIN,
    this.realValues,
    this.oldValues,
    this.oldImg,
  });

  factory ForEditIng.fromList(List argList) {
    return ForEditIng(
      docID: argList[0],
      oldIngMap: argList[1],
      eachIngMap: argList[2],
      iCode: argList[3],
      iCodeName: argList[4],
      servingData: argList[5],
      isNIN: argList[6],
      realValues: argList[7],
      oldValues: argList[8],
      oldImg: argList[9],
    );
  }

  List listBowls(Map servingData) {
    List listBowl = [];
    if (servingData.containsKey("indexes")) {
      for (int i in [1, 2, 3, 4, 5, 6, 7]) {
        for (var j in servingData["indexes"].keys) {
          if (servingData["indexes"][j] == i) {
            listBowl.add(j);
          }
        }
      }
    } else if (servingData.containsKey("servingItem")) {
      listBowl.add(servingData["servingItem"]);
    } else {
      listBowl.addAll([
        "gms",
      ]);
    }
    return listBowl;
  }
}

class ForEditingController extends GetxController {
  var nm = "".obs;
  var foodIcode = "".obs;
}
