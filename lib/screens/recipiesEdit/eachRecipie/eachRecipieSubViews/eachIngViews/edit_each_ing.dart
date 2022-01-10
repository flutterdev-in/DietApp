import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/controllers/arguments_controller.dart';
import 'package:dietapp_v002/screens/recipiesEdit/eachRecipie/eachRecipieSubViews/stream_for_iCode.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_new_model.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/food_id_model_for_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEachIng extends StatefulWidget {
  EditEachIng({Key? key}) : super(key: key);

  @override
  State<EditEachIng> createState() => _EditEachIngState();
}

class _EditEachIngState extends State<EditEachIng> {
  var argumentsController = Get.putAsync(()async=>await ArgumentsController());
  var indexKey = Get.arguments;
  
  @override
  void initState() {
    print(FoodModelForEachIngEdit().commonName);
    // var ingsMap = argumentsController.ingsData.value;

    // Map thisKeyMap = ingsMap[indexKey];
    // EachIng.fromMap(thisKeyMap);
    // print(EachIng().newName);
    // argumentsController.foodModelFromFire(thisKeyMap["fID"]);
    // print(FoodModelForEachIngEdit().commonName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          ListTile(
            title:
                Text("Original : ${EachIng().webAmount} ${EachIng().webUnit}"),
            subtitle: Text("${EachIng().webName} ${EachIng().webNotes}"),
          ),
          ListTile(
            title:
                Text("Current : ${EachIng().newAmount} ${EachIng().newUnit}"),
            subtitle: Text(FoodModelForEachIngEdit().commonName),
          ),
        ],
      ),
    );
  }
}
