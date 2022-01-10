import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:getwidget/getwidget.dart';

class NINmeasuresEditForm extends StatefulWidget {
  const NINmeasuresEditForm({Key? key}) : super(key: key);

  @override
  _NINmeasuresEditFormState createState() => _NINmeasuresEditFormState();
}

class _NINmeasuresEditFormState extends State<NINmeasuresEditForm> {
  final _formKey = GlobalKey<FormBuilderState>();
  int listLength = 12;
  var foodName = Get.arguments[1];
  double w = Get.width;
  String uid = FirebaseAuth.instance.currentUser!.uid;
  
  @override
  Widget build(BuildContext context) {
    String uid3 = uid.substring(0, 3);
    return SafeArea(
      child: Scaffold(
        body: FormBuilder(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(w * 1 / 20),
            children: [
              Row(
                children: [
                  SizedBox(
                      width: w * 5.5 / 10,
                      child: Text(
                        "Name",
                        textScaleFactor: 1.5,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.brown),
                      )),
                  Container(width: w * 1 / 20, color: Colors.black),
                  SizedBox(
                    width: w * 3 / 10,
                    child: Text(
                      "Value in gms",
                      textScaleFactor: 1.4,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.brown),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: listLength,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: w,
                    child: Row(
                      children: [
                        SizedBox(
                            width: w * 5.5 / 10,
                            child: FormBuilderTextField(
                              style: TextStyle(fontSize: 20),
                              decoration: InputDecoration(
                                //prefixText: "$index",
                                fillColor: Colors.black54,
                                hoverColor: Colors.black45,
                              ),
                              name: "${index}measure",
                            )),
                        SizedBox(
                          width: w * 1 / 20,
                        ),
                        SizedBox(
                            width: w * 3 / 10,
                            child: FormBuilderTextField(
                              valueTransformer: (value) {
                                if (value != null && value != "") {
                                  return double.parse(value);
                                } else {
                                  return value;
                                }
                              },
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp('[0-9.]'))
                              ],
                              style: TextStyle(fontSize: 20),
                              keyboardType: TextInputType.number,
                              name: "${index}valueInGms",
                            )),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(foodName),
          actions: [
            GFButton(
              onPressed: () async {
                _formKey.currentState!.save();
                if (_formKey.currentState!.validate()) {
                  Map map0 = _formKey.currentState!.value;
                  Map map = {...map0};
                  map.removeWhere((key, value) =>
                      key == null || value == null || value == "" || key == "");
                  bool isMapEmpty = map.isEmpty;
                  //dynamic currentTime = DateFormat.jm().format(DateTime.now());
                  await FirebaseFirestore.instance
                      .collection("FoodData")
                      .doc(Get.arguments[0])
                      .update({
                    "measureData": map,
                    "updation": isMapEmpty ? 0.5 : 1,
                    "updationRemarks": uid3
                  });
                  Get.back();
                  Get.snackbar(
                    "Profile details saved",
                    "",
                    duration: Duration(seconds: 1),
                  );
                  //Get.back();
                } else {
                  Get.snackbar(
                      "Something went wrong", "Profile details not saved",
                      duration: Duration(seconds: 1));
                }
              },
              text: "Update",
              textStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              focusColor: Colors.green,
              highlightColor: Colors.green,
              color: Colors.black38,
            ),
          ],
        ),
      ),
    );
  }
}
