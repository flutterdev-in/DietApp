import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/models/fire_user_models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserProfileModel {
  // String photoURLf = "photoURL";
  // String userIDf = "photoURL";
  // String displayName = "displayName";
  // String nativeLanguagef = "nativeLanguage";

  var photoURL;
  var userID;
  var displayName;
  var nativeLanguage;
  var bioData;

  UserProfileModel({
    this.photoURL,
    this.userID = "",
    this.displayName,
    this.nativeLanguage = "English",
    this.bioData = "",
  });

  Map<String, dynamic> toMap() {
    return {
      "userID": userID,
      "profileData": {
        "userID": userID,
        "photoURL": photoURL,
        "displayName": displayName,
        "nativeLanguage": nativeLanguage,
        "bioData":bioData,
      },
    };
  }

  factory UserProfileModel.fromMap(Map map) {
    return UserProfileModel(
      userID: map["userID"],
      photoURL: map["profileData"]["photoURL"],
      displayName: map["profileData"]["displayName"],
      nativeLanguage: map["profileData"]["nativeLanguage"],
      bioData:map["profileData"]["bioData"],
    );
  }

  Future userProfileStream() async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      return documentSnapshot;
    });
  }
}

class UserIdValidator {
  Future<bool> isUserIdExists(user) async {
    var isit = await FirebaseFirestore.instance
        .collection('users')
        .where("userID", isEqualTo: "@$user")
        .limit(1)
        .get()
        .then((QuerySnapshot querySnapshot) {
      if (querySnapshot.docs.length == 1) {
        return true;
      } else {
        return false;
      }
    });
    return isit;
  }
}
