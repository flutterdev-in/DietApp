import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/functions/1fm_ing_data_model_for_gms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';

class IsRecipie extends StatelessWidget {
  const IsRecipie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Rx<String> rxDocID = "RN".obs;
    Rx<String> rxDocID = "RV".obs;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(),
      body: Center(
          child: Column(
        children: [
          SizedBox(height: 100),
          Obx(() => Text(
                "${rxDocID.value} success",
                textScaleFactor: 1.5,
              )),
          SizedBox(height: 50),
          GFButton(
            onPressed: () async {
              // List listNum = Iterable.generate(132).toList();
              List listNum = Iterable.generate(1850).toList();

              for (num i in listNum) {
                // String fID = "RN$i";
                String fID = "RV$i";
                await FirebaseFirestore.instance
                    .collection("FoodData")
                    .doc(fID)
                    .get()
                    .then((docSnap) async {
                  if (docSnap.exists) {
                    await FirebaseFirestore.instance
                        .collection("FoodData")
                        .doc(fID)
                        .update({"isRecipie": true});
                    rxDocID.value = fID;
                  }
                });
              }
            },
            child: Text("update isRecipie Field"),
          ),
        ],
      )),
    ));
  }
}
