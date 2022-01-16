import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/functions/01_measures_function.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/functions/1fm_ing_data_model_for_gms.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/models/0_food_id_model_for_edit.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editWaterMeasures/screens/each_recipie_ingredients.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_platform_interface/webview_flutter_platform_interface.dart';

// Previous Screen -- recipies_listview.dart
class EachRecipieIngVie extends StatelessWidget {
  EachRecipieIngVie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map fMapiMap = Get.arguments;
    FoodModel fm = FoodModel.fromMap(fMapiMap["fData"]);
    IngDataModelForGms ig =
        IngDataModelForGms().ingDataModelForGms(fMapiMap["ingData"]);
    int h = ig.waterGms! ~/ 100 + 1;
    List lh = Iterable.generate(h).toList();
    List lt = Iterable.generate(10).toList();
    List ld = Iterable.generate(10).toList();

    Rx<int> rxLh = 0.obs;
    Rx<int> rxLt = 0.obs;
    Rx<int> rxLd = 0.obs;

    String uid = FirebaseAuth.instance.currentUser!.uid;
    String uid3 = uid.substring(0, 3);
    ////
    Widget topWidget() {
      Map igd = fMapiMap["ingData"];
      return Container(
          height: 100,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                child: Container(
                  height: 100,
                  width: Get.width - 100,
                  color: Colors.black87,
                  padding: EdgeInsets.fromLTRB(10, 15, 5, 0),
                  child: Text(
                    "${fm.commonName},\n (${fm.fID})",
                    textScaleFactor: 1.5,
                    //textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white),
                    // overflow: TextOverflow.ellipsis,
                  ),
                ),
                onTap: () async {
                  await Get.to(IngDataTexts(), arguments: igd);
                },
              ),
              InkWell(
                child: Container(
                  color: Colors.black87,
                  width: 100,
                  child: Image.network(
                    fm.img500!,
                    fit: BoxFit.fill,
                  ),
                ),
                onTap: () {
                  Get.to(RecipieWebPage(), arguments: fm.recipieURL);
                },
                onDoubleTap: () {
                  Get.to(RecipieWebPage(), arguments: fm.recipieURL);
                },
              ),
            ],
          ));
    }

    ////
    Widget cupertinoRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 150,
            width: Get.width * 3.5 / 10,
            child: CupertinoPicker(
                scrollController: FixedExtentScrollController(initialItem: 0),
                diameterRatio: 1000,
                itemExtent: 60,
                onSelectedItemChanged: (index) {
                  rxLh.value = lh[index];
                },
                children: lh
                    .map((e) => Center(
                            child: Text(
                          "${e}00",
                          textScaleFactor: 1.05,
                        )))
                    .toList()),
          ),
          SizedBox(
            height: 150,
            width: Get.width * 3 / 10,
            child: CupertinoPicker(
                looping: true,
                scrollController: FixedExtentScrollController(initialItem: 0),
                diameterRatio: 1000,
                itemExtent: 60,
                onSelectedItemChanged: (index) {
                  rxLt.value = lt[index];
                },
                children: lt
                    .map((e) => Center(
                            child: Text(
                          "${e}0",
                          textScaleFactor: 1.05,
                        )))
                    .toList()),
          ),
          Container(
            height: 150,
            width: Get.width * 2.5 / 10,
            child: CupertinoPicker(
                looping: true,
                scrollController: FixedExtentScrollController(initialItem: 0),
                diameterRatio: 1000,
                itemExtent: 60,
                onSelectedItemChanged: (index) {
                  rxLd.value = ld[index];
                },
                children: ld.map((e) {
                  return Center(
                      child: Text(
                    e.toString(),
                    textScaleFactor: 1.05,
                  ));
                }).toList()),
          ),
        ],
      );
    }

    Widget table() {
      return Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Table(columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(0.7),
          2: FlexColumnWidth(0.7)
        }, children: [
          TableRow(children: [
            Text(
              "Total Recipie weight",
              textScaleFactor: 1.1,
            ),
            Text(
              "${ig.grossGms!.round()} g",
              textScaleFactor: 1.1,
            ),
            Text(
              "100 %",
              textScaleFactor: 1.1,
            )
          ]),
          TableRow(children: [
            Text(
              "Other ingredients weight",
              textScaleFactor: 1.1,
            ),
            Text(
              "${ig.netGms!.round()} g",
              textScaleFactor: 1.1,
            ),
            Text(
              "${(ig.netGms! * 100 / ig.grossGms!).round()} %",
              textScaleFactor: 1.1,
            )
          ]),
          TableRow(children: [
            Text("Gross water weight",
                textScaleFactor: 1.1,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${ig.waterGms!.round()} g",
                textScaleFactor: 1.1,
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text("${(ig.waterGms! * 100 / ig.grossGms!).round()} %",
                textScaleFactor: 1.1,
                style: TextStyle(fontWeight: FontWeight.bold))
          ]),
        ]),
      );
    }

    Widget waterWidget() {
      return ig.waterGms == 0
          ? Container(
              height: 40,
              color: Colors.black87,
              child: Center(
                child: Text("Water not used in this recipie",
                    textScaleFactor: 1.25,
                    style: TextStyle(color: Colors.white)),
              ))
          : Container(
              height: 70,
              color: Colors.black87,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total water discarded / evaporated",
                        textScaleFactor: 1.4,
                        style: TextStyle(color: Colors.white)),
                    Obx(() {
                      int reducedWater =
                          rxLh.value * 100 + rxLt.value * 10 + rxLd.value;
                      num percent = (reducedWater / ig.waterGms!) * 100;
                      return Text(
                          "= $reducedWater g ( ${percent.toStringAsFixed(0)} %)",
                          textScaleFactor: 1.4,
                          style: TextStyle(color: Colors.white));
                    }),
                  ],
                ),
              ),
            );
    }

    Widget wrongButton() {
      return ElevatedButton(
          onPressed: () async {
            await FirebaseFirestore.instance
                .collection("FoodData")
                .doc(fm.fID)
                .update({"waterWork": 8, "waterRemarks": uid3});
            Get.back();
            Get.snackbar(
              "Moved to Wrong list",
              "",
              duration: Duration(seconds: 1),
            );
          },
          child: Text("Wrong"),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(80, 60),
              primary: Colors.brown[600],
              elevation: 20,
              textStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)));
    }

    Widget doubtButton() {
      return ElevatedButton(
          onPressed: () async {
            await FirebaseFirestore.instance
                .collection("FoodData")
                .doc(fm.fID)
                .update({"waterWork": 5, "waterRemarks": uid3});
            Get.back();
            Get.snackbar(
              "Moved to doubt list",
              "",
              duration: Duration(seconds: 1),
            );
          },
          child: Text("Doubt"),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(80, 60),
              primary: Colors.blueGrey[600],
              elevation: 20,
              textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)));
    }

    Widget submitButton() {
      return ElevatedButton(
          onPressed: () async {
            Map<String, Object> updateMap = {};
            if (ig.waterGms == 0) {
              updateMap = {
                "recipieGms": {
                  "grossIngGms": ig.netGms!.toInt(),
                  "grossRecipieGms": ig.grossGms!,
                  "grossWaterGms": ig.waterGms!,
                  "netWaterGms": 0,
                  "netRecipieGms": ig.netGms!.toInt(),
                  "reducedWaterGms": 0,
                },
                "waterWork": 10,
                "waterRemarks": uid3
              };
            } else {
              num reducedWaterGms =
                  rxLh.value * 100 + rxLt.value * 10 + rxLd.value;

              num netWaterGms = ig.waterGms! - reducedWaterGms;
              num netRecipieGms = ig.netGms! + netWaterGms;
              updateMap = {
                "recipieGms": {
                  "grossIngGms": ig.netGms!.toInt(),
                  "grossRecipieGms": ig.grossGms!.toInt(),
                  "grossWaterGms": ig.waterGms!.toInt(),
                  "netWaterGms": netWaterGms.toInt(),
                  "netRecipieGms": netRecipieGms.toInt(),
                  "reducedWaterGms": reducedWaterGms.toInt(),
                },
                "waterWork": 10,
                "waterRemarks": uid3
              };
            }

            await FirebaseFirestore.instance
                .collection("FoodData")
                .doc(fm.fID)
                .update(updateMap);
            Get.back();
            Get.snackbar(
              "Details saved",
              "Moved to submitted list",
              duration: Duration(seconds: 1),
            );
          },
          child: Text("Submit"),
          style: ElevatedButton.styleFrom(
              fixedSize: Size(110, 60),
              primary: Colors.green[800],
              elevation: 20,
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)));
    }

    Widget buttons() {
      return Container(
          margin: EdgeInsets.all(9),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 40,
                height: 60,
              ),
              wrongButton(),
              doubtButton(),
              submitButton()
            ],
          ));
    }

    Widget waterIngs() {
      return ListView.builder(
          padding: EdgeInsets.fromLTRB(12, 2, 10, 2),
          shrinkWrap: true,
          itemCount: ig.listWaterIngs!.length,
          itemBuilder: (context, index) {
            return Text(
              "${ig.listWaterIngs![index]}",
              textScaleFactor: 1.3,
            );
          });
    }

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: Colors.blue),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
                buttons(),
                Container(
                  child: topWidget(),
                  color: Colors.amber,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    child: table(),
                    color: Colors.black12,
                  ),
                ),
                waterIngs(),
                SizedBox(
                  height: 10,
                ),
                waterWidget(),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 5,
                ),
                ig.waterGms == 0 ? SizedBox() : cupertinoRow(),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class RecipieWebPage extends StatelessWidget {
  const RecipieWebPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String? recipieURL = Get.arguments;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: BackButton(color: Colors.blue),
        ),
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: recipieURL,
        ),
      ),
    );
  }
}
