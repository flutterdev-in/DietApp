// To parse this JSON data, do
//
//     final eachIng = eachIngFromMap(jsonString);

// import 'dart:convert';

// import 'package:flutter/cupertino.dart';

// EachIng eachIngFromMap(String str) => EachIng.fromMap(json.decode(str));

// String eachIngToMap(EachIng data) => json.encode(data.toMap());

class EachIng {
  var webAmount;
  var webUnit;
  var webName;
  var webNotes;
  var newUnit;
  var newName;
  var fID;
  var newAmount;
  var totalGms;
  var gmsPerUnit;
  EachIng({
    this.webAmount,
    this.webUnit,
    this.webName,
    this.webNotes,
    this.newUnit,
    this.newName,
    this.fID,
    this.newAmount,
    this.totalGms,
    this.gmsPerUnit,
  });
  factory EachIng.fromMap(Map eachIngMap) {
    return EachIng(
      webAmount: eachIngMap["webAmount"],
      webUnit: eachIngMap["webUnit"],
      webName: eachIngMap["webName"],
      webNotes: eachIngMap["webNotes"],
      newUnit: eachIngMap["newUnit"],
      newName: eachIngMap["newName"],
      fID: eachIngMap["fID"],
      newAmount: eachIngMap["newAmount"],
      totalGms: eachIngMap["totalGms"],
      gmsPerUnit: eachIngMap["gmsPerUnit"],
    );
  }

  Map<String, dynamic> toMap() => {
        "webAmount": webAmount,
        "webUnit": webUnit,
        "webName": webName,
        "webNotes": webNotes,
        "newUnit": newUnit,
        "newName": newName,
        "fID": fID,
        "newAmount": newAmount,
        "totalGms": totalGms,
        "gmsPerUnit": gmsPerUnit,
      };
}
