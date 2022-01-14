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
    Map measureVariables = MeasuresF().measureGet(fm.measureData!);
    List measureKeys = measureVariables["measureList"];
    Map measureMap = measureVariables["measureMap"];
    List rangeList = measureVariables["rangeList"];
    List<num> listValues = [
      0.1,
      0.25,
      0.5,
      0.75,
      1,
      1.25,
      1.5,
      1.75,
      2,
      2.25,
      2.5,
      2.75,
      3,
      3.25,
      3.5,
      3.75,
      4,
      4.5,
      5,
      6,
      7,
      7.5,
      8,
      9,
      10,
      15,
      20,
      25,
      50,
      75,
      100,
      200,
      250,
      300,
      400,
      500,
      600,
      700,
      750,
      800,
      900,
      1000,
      1250,
      1500,
      1750,
      2000,
      2500,
      5000,
      7500,
      10000
    ];
    int initiaIndex = 3;
    var rxKey = "".obs;
    rxKey.value = measureKeys[0];
    var rxValue = listValues[initiaIndex].obs;
    num MeasureMapValue = listValues[initiaIndex] * measureMap[rxKey.value];
    var rxMeasureMapValue = MeasureMapValue.obs;
    Rx<int> rxServe = 1.obs;
    Rx<num> rxReducedWaterGms = 0.0.obs;
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
                  padding: EdgeInsets.fromLTRB(60, 15, 5, 0),
                  child: Text(
                    fm.commonName.toString(),
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
      List<int> listServe = [];

      if (fm.totalYields!.round() == 1 && fm.itemsPerServing!.round() == 1) {
        listServe.addAll([1]);
      } else if (fm.itemsPerServing! == 1) {
        listServe.addAll([fm.totalYields!.round(), 1]);
      } else {
        listServe
            .addAll([fm.totalYields!.round(), fm.itemsPerServing!.round(), 1]);
      }
      String serveName = fm.servingName!;
      return Row(
        children: [
          SizedBox(
            height: 150,
            width: Get.width * 3 / 10,
            child: CupertinoPicker(
                scrollController: FixedExtentScrollController(initialItem: 1),
                diameterRatio: 1000,
                itemExtent: 60,
                onSelectedItemChanged: (index) {
                  rxServe.value = listServe[index];
                },
                children: listServe
                    .map((e) => Center(child: Text("$e $serveName")))
                    .toList()),
          ),
          SizedBox(
            height: 150,
            width: Get.width * 5 / 10,
            child: CupertinoPicker(
                diameterRatio: 1000,
                itemExtent: 60,
                onSelectedItemChanged: (index) {
                  rxKey.value = measureKeys[index];
                },
                children: measureKeys
                    .map((e) => Center(child: Text(e.toString())))
                    .toList()),
          ),
          Container(
            height: 150,
            width: Get.width * 2 / 10,
            child: CupertinoPicker(
                scrollController:
                    FixedExtentScrollController(initialItem: initiaIndex),
                diameterRatio: 1000,
                itemExtent: 60,
                onSelectedItemChanged: (index) {
                  rxValue.value = listValues[index].toDouble();
                },
                children: listValues.map((e) {
                  return Center(child: Text(e.toString()));
                }).toList()),
          ),
        ],
      );
    }

    Widget table() {
      return Table(
        children: [
          TableRow(children: [
            Text(
              "",
              textScaleFactor: 1.2,
            ),
            Text(
              "Net Gms",
              textScaleFactor: 1.1,
            ),
            Text(
              "Water Gms",
              textScaleFactor: 1.1,
            ),
            Text(
              "Gross Gms",
              textScaleFactor: 1.1,
            )
          ]),
          TableRow(children: [
            Text(
              "Percent",
              textScaleFactor: 1.1,
            ),
            Text(
              "${(ig.netGms! * 100 / ig.grossGms!).round()} %",
              textScaleFactor: 1.1,
            ),
            Text(
              "${(ig.waterGms! * 100 / ig.grossGms!).round()} %",
              textScaleFactor: 1.1,
            ),
            Text(
              "100 %",
              textScaleFactor: 1.1,
            ),
          ]),
          TableRow(children: [
            Text(
              "${fm.totalYields!.round()} ${fm.servingName}",
              textScaleFactor: 1.1,
            ),
            Text(
              "${ig.netGms}",
              textScaleFactor: 1.1,
            ),
            Text(
              "${ig.waterGms}",
              textScaleFactor: 1.1,
            ),
            Text(
              "${ig.grossGms}",
              textScaleFactor: 1.1,
            ),
          ]),
          fm.itemsPerServing! == fm.totalYields!
              ? TableRow(children: [Text(""), Text(""), Text(""), Text("")])
              : TableRow(children: [
                  Text(
                    "${fm.itemsPerServing!.round()} ${fm.servingName}",
                    textScaleFactor: 1.1,
                  ),
                  Text(
                    "${(ig.netGms! * fm.itemsPerServing! / fm.totalYields!).round()}",
                    textScaleFactor: 1.1,
                  ),
                  Text(
                    "${(ig.waterGms! * fm.itemsPerServing! / fm.totalYields!).round()}",
                    textScaleFactor: 1.1,
                  ),
                  Text(
                    "${(ig.grossGms! * fm.itemsPerServing! / fm.totalYields!).round()}",
                    textScaleFactor: 1.1,
                  ),
                ]),
          fm.itemsPerServing! == 1
              ? TableRow(children: [Text(""), Text(""), Text(""), Text("")])
              : TableRow(children: [
                  Text("1 ${fm.servingName}"),
                  Text(
                    "${(ig.netGms! / fm.totalYields!).round()}",
                    textScaleFactor: 1.1,
                  ),
                  Text(
                    "${(ig.waterGms! / fm.totalYields!).round()}",
                    textScaleFactor: 1.1,
                  ),
                  Text(
                    "${(ig.grossGms! / fm.totalYields!).round()}",
                    textScaleFactor: 1.1,
                  ),
                ]),
        ],
      );
    }

    Rx<num> rxMin = 1.0.obs;
    Rx<num> rxMax = 1.0.obs;
    Widget minmax() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() {
              rxMin.value = (ig.netGms! *
                  rxServe.value /
                  fm.totalYields! /
                  measureMap[rxKey.value]!);
              rxMax.value = (ig.grossGms! *
                  rxServe.value /
                  fm.totalYields! /
                  measureMap[rxKey.value]!);
              return Row(
                children: [
                  SizedBox(
                    width: 120,
                    child: Text(
                      "Min - ${rxMin.value.toStringAsFixed(1)}",
                      textAlign: TextAlign.start,
                      textScaleFactor: 1.3,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    "Max - ${rxMax.value.toStringAsFixed(1)}",
                    textAlign: TextAlign.start,
                    textScaleFactor: 1.3,
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              );
            }),
            SizedBox(
              child: Obx(() {
                TextEditingController tc = TextEditingController();
                tc.text = rxValue.value.toString();
                tc.selection = TextSelection.fromPosition(
                    TextPosition(offset: tc.text.length));
                return TextField(
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  decoration: InputDecoration(hintText: "Enter"),
                  keyboardType: TextInputType.number,
                  controller: tc,
                  onChanged: (value) {
                    rxValue.value = double.parse(value);
                  },
                );
              }),
              width: 60,
            ),
          ],
        ),
      );
    }

    Widget decidingWidget() {
      rxReducedWaterGms.value =
          (rxServe.value * ig.grossGms! / fm.totalYields!) -
              (rxValue.value * measureMap[rxKey.value]);
      return Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: Get.width * 4.5 / 10,
                child: Text(
                  "  Input ${(rxValue.value * measureMap[rxKey.value]).toStringAsFixed(1)} g",
                  textScaleFactor: 1.2,
                ),
              ),
              SizedBox(
                  // width: Get.width * 5.5 / 2,
                  child: ig.waterGms == 0
                      ? Text(
                          "Water not used this recipie",
                          textScaleFactor: 1.2,
                        )
                      : Text(
                          "${(((rxServe.value * ig.grossGms! / fm.totalYields!) - (rxValue.value * measureMap[rxKey.value])) * 100 / ig.waterGms!).toStringAsFixed(1)} % Water evaporated",
                          textScaleFactor: 1.25,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
            ],
          ));
    }

    Widget decidingGms() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: Get.width * 4.5 / 10,
            child: ig.waterGms == 0
                ? Text(
                    "Final Recipie = ${(ig.netGms!).toStringAsFixed(0)} g",
                    textScaleFactor: 1.2,
                  )
                : Obx(() => Text(
                      "Final Recipie = ${(ig.netGms! + ig.waterGms! + (rxServe.value * ig.grossGms! / fm.totalYields!) - (rxValue.value * measureMap[rxKey.value])).toStringAsFixed(0)} g",
                      textScaleFactor: 1.2,
                    )),
          ),
          SizedBox(
            // width: Get.width * 5.5 / 2,
            child: ig.waterGms == 0
                ? Text(
                    "Final water = 0g",
                    textScaleFactor: 1.2,
                  )
                : Obx(() => Text(
                      "Final Water = ${(ig.waterGms! - (rxServe.value * ig.grossGms! / fm.totalYields!) - (rxValue.value * measureMap[rxKey.value])).toStringAsFixed(0)} g",
                      textScaleFactor: 1.2,
                    )),
          ),
        ],
      );
    }

    Widget waterIngs() {
      return ListView.builder(
          padding: EdgeInsets.fromLTRB(20, 5, 10, 0),
          shrinkWrap: true,
          itemCount: ig.listWaterIngs!.length,
          itemBuilder: (context, index) {
            return Text(
              "${ig.listWaterIngs![index]}",
              textScaleFactor: 1.3,
            );
          });
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
              fixedSize: Size(Get.width * 2.4 / 5, 60),
              primary: Colors.brown[600],
              elevation: 20,
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)));
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
                  (rxServe.value * ig.grossGms! / fm.totalYields!) -
                      (rxValue.value * measureMap[rxKey.value]);
              num netWaterGms = ig.waterGms! - reducedWaterGms;
              num netRecipieGms = ig.netGms! + netWaterGms;
              updateMap = {
                "recipieGms": {
                  "grossIngGms": ig.netGms!.toInt(),
                  "grossRecipieGms": ig.grossGms!,
                  "grossWaterGms": ig.waterGms!,
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
              fixedSize: Size(Get.width * 2.4 / 5, 60),
              primary: Colors.green[800],
              elevation: 20,
              textStyle: TextStyle(fontSize: 22, fontWeight: FontWeight.w500)));
    }

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(children: [
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
                minmax(),
                SizedBox(
                  height: 10,
                ),
                decidingWidget(),
                SizedBox(
                  height: 5,
                ),
                decidingGms(),
                SizedBox(
                  height: 5,
                ),
                cupertinoRow(),
                waterIngs(),
              ]),
              Row(
                children: [doubtButton(), submitButton()],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
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
        body: WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: recipieURL,
        ),
      ),
    );
  }
}
