import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/functions/1fm_ing_data_model_for_gms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';

class NoWaterCoding extends StatelessWidget {
  const NoWaterCoding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List listNum = Iterable.generate(132).toList();

    print(listNum);
    Rx<String> rxDocID = "RN".obs;
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
              List listNum = Iterable.generate(1850).toList();

              for (num i in listNum) {
                String fID = "RN$i";

                await FirebaseFirestore.instance
                    .collection("FoodData")
                    .doc(fID)
                    .collection("ingData")
                    .doc("ingData")
                    .get()
                    .then((docSnap) async {
                  if (docSnap.exists) {
                    Map ingData = docSnap.data() as Map;
                    IngDataModelForGms ig =
                        IngDataModelForGms().ingDataModelForGms(ingData);
                    if (ig.waterGms == 0) {
                      Map<String, Object?> updateMap = {
                        "recipieGms": {
                          "grossIngGms": ig.netGms!.toInt(),
                          "grossRecipieGms": ig.grossGms!,
                          "grossWaterGms": ig.waterGms!,
                          "netWaterGms": 0,
                          "netRecipieGms": ig.netGms!.toInt(),
                          "reducedWaterGms": 0,
                        },
                        "waterWork": 3,
                        "waterRemarks": "Water not used in this recipie"
                      };
                      await FirebaseFirestore.instance
                          .collection("FoodData")
                          .doc(fID)
                          .update(updateMap);
                      rxDocID.value = fID;
                    }
                  }
                });
              }
            },
            child: Text("update water recipies"),
          ),
        ],
      )),
    ));
  }
}
