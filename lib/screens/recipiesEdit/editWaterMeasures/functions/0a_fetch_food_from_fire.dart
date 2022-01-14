import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/models/1_each_ing_new_model.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/models/0_food_id_model_for_edit.dart';

class FetchFoodDocs {
 Future<Map> getFmapImap(fID) async {
    Map fData = {};
    Map ingData = {};
    await FirebaseFirestore.instance
        .collection("FoodData")
        .doc(fID)
        .get()
        .then((docSnap) {
      if (docSnap.exists) {
        Map fMap = docSnap.data() as Map;
        fData.addAll(fMap);
      }
    });

    await FirebaseFirestore.instance
        .collection("FoodData")
        .doc(fID)
        .collection("ingData")
        .doc("draftIngData")
        .get()
        .then((docSnap) {
      if (docSnap.exists) {
        Map iMap = docSnap.data() as Map;
        ingData.addAll(iMap);
      }
    });
    return {"fData": fData, "ingData": ingData};
  }
}
