import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/food_id_model_for_edit.dart';
import 'package:get/get.dart';

class ArgumentsController extends GetxController {
  var docID = ''.obs;
  var ingsData = {}.obs;


  foodModelFromFire(String fID) async {
    await FirebaseFirestore.instance
        .collection("FoodData")
        .doc(fID)
        .get()
        .then((DocumentSnapshot<Map<String, dynamic>> documentSnapshot) {
      print("object");
      var fMap = documentSnapshot.data() as Map;
      FoodModelForEachIngEdit.fromMap(fMap);
    });
  }
}
