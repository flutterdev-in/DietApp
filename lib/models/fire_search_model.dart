

import 'package:cloud_firestore/cloud_firestore.dart';

class DataModel {
  final String? name;
  final String? rID;
  final String? rImg150;
  final String? netEnergy;

  DataModel({this.name, this.rID, this.rImg150, this.netEnergy});

  //Create a method to convert QuerySnapshot from Cloud Firestore to a list of objects of this DataModel
  //This function in essential to the working of FirestoreSearchScaffold

  List<DataModel> dataListFromSnapshot(QuerySnapshot querySnapshot) {
    return querySnapshot.docs.map((snapshot) {
      final Map<String, dynamic> dataMap =
          snapshot.data() as Map<String, dynamic>;

      return DataModel(
          name: dataMap['rName'],
          rID: dataMap['rID'],
          rImg150: dataMap['rImg150'],
          netEnergy: dataMap['Net Energy']);
    }).toList();
  }
}