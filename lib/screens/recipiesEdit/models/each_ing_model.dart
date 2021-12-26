import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/firestore_models/firestore_instances.dart';
import 'package:flutter/cupertino.dart';

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

  datafromQuery(AsyncSnapshot<QuerySnapshot> snapshot) {
    if (snapshot.hasData) {
      final List _list = snapshot.data!.docs;
      Map<String, dynamic> oldIngMap = _list[0].data() as Map<String, dynamic>;
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
  var docID, oldIngMap, eachIngMap, iCode, iCodeName,servingData,isNIN;

  ForEditIng(
      {this.docID,
      this.eachIngMap,
      this.iCode,
      this.iCodeName,
      this.oldIngMap,
      this.servingData,
      this.isNIN,
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
    );
  }
}
