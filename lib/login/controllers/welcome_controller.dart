import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/firestore_models/user_fire_model.dart';
import 'package:dietapp_v002/firestore_models/user_model.dart';
import 'package:dietapp_v002/firestore_user.dart';
import 'package:dietapp_v002/login/controllers/home_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class WelcomeController extends GetxController {
  HomeController homeController = Get.find();
  late User user;
  @override
  void onInit() async {
    user = Get.arguments;
    GetStorage().write("uid", user.uid);

    var userGoogle = UserGoogleeData(
      googleUid: user.uid,
      googleDisplayName: user.displayName,
      googleEmail: user.email,
      googlePhotoURL: user.photoURL,
      googleEmailVerified: user.emailVerified,
      googleIsAnonymous: user.isAnonymous,
      googlePhoneNumber: user.phoneNumber,
      googleCreationTime: user.metadata.creationTime,
      googleLastSignInTime: user.metadata.lastSignInTime,
    ).toJson();

    print(userGoogle);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) async {
      if (documentSnapshot.exists) {
        
      } else {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .set({"uid": user.uid});
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .update(userGoogle);
      }
    });
    super.onInit();
  }

  void logout() async {
    await GoogleSignIn().disconnect();
    await FirebaseAuth.instance.signOut();
  }
}
