import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Fire {
  var userDocRef = FirebaseFirestore.instance
      .collection('users')
      .doc(GetStorage().read("uid"))
      .get();

     

  kk() {
    return userDocRef.then((value)async =>print(value.data()));
  }

  k() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(GetStorage().read("uid"))
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      print(documentSnapshot.data());
    });
  }

  Stream userDocStream = FirebaseFirestore.instance
      .collection('users')
      .doc(GetStorage().read("uid"))
      .snapshots();

  userDocData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(GetStorage().read("uid"))
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      Map k = documentSnapshot.data() as Map;
    });
  }

  CollectionReference userColRef =
      FirebaseFirestore.instance.collection('users');

  Stream userColStream =
      FirebaseFirestore.instance.collection('users').snapshots();



      
}
