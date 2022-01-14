import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/.edit_each_ing_of_recipie.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/models/0_food_id_model_for_edit.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/models/1_each_ing_new_model.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/each_ing_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/avatar/gf_avatar.dart';
import 'package:getwidget/components/list_tile/gf_list_tile.dart';
import 'package:getwidget/getwidget.dart';

class IngDataTexts extends StatelessWidget {
  IngDataTexts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map IngData = Get.arguments;
    List keys = IngData.keys.toList()..sort();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: ListView.builder(
            padding: EdgeInsets.all(5),
            itemCount: keys.length,
            itemBuilder: (context, index) {
              var eachIng = IngData[keys[index]];
              if (eachIng is! Map) {
                return Text(
                  eachIng.toString(),
                  textScaleFactor: 1.6,
                  style: TextStyle(
                      color: Colors.green[900], fontWeight: FontWeight.bold),
                );
              }
              if (eachIng is Map) {
                EachIng ig = EachIng.fromMap(eachIng);
                return Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "${ig.fID} : ${ig.newAmount} ${ig.newUnit} ${ig.newName} = ${ig.totalGms} g",
                    textScaleFactor: 1.3,
                  ),
                );
              } else {
                return Text("No data");
              }
            }),
      ),
    );
  }
}
