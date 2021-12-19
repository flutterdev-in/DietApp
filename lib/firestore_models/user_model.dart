import 'package:cloud_firestore/cloud_firestore.dart';

class UserGoogle {
  String? google_uid;
  String? google_displayName;
  String? google_email;
  String? google_photoURL;
  bool? google_emailVerified;
  bool? google_isAnonymous;
  var google_phoneNumber;
  var google_creationTime;
  var google_lastSignInTime;

  UserGoogle({
    this.google_uid = "",
    this.google_displayName = "",
    this.google_email = "",
    this.google_photoURL = "",
    this.google_emailVerified = false,
    this.google_isAnonymous = true,
    this.google_phoneNumber,
    this.google_creationTime,
    this.google_lastSignInTime,
  });

  Map<String,dynamic> toMap() {
    return {
      "google_data": {
        "google_uid": google_uid,
        "google_displayName": google_displayName,
        "google_email": google_email,
        "google_photoURL": google_photoURL,
        "google_emailVerified": google_emailVerified,
        "google_isAnonymous": google_isAnonymous,
        "google_phoneNumber": google_phoneNumber,
        "google_creationTime": google_creationTime,
        "google_lastSignInTime": google_lastSignInTime,
      }
    };
  }

  factory UserGoogle.fromMap(DocumentSnapshot map) {
    return UserGoogle(
      google_uid: map["google_data"]["google_uid"],
      google_displayName: map["google_data"]["google_uid"],
      google_email: map["google_data"]["google_uid"],
      google_photoURL: map["google_data"]["google_uid"],
      google_emailVerified: map["google_data"]["google_uid"],
      google_isAnonymous: map["google_data"]["google_uid"],
      google_phoneNumber: map["google_data"]["google_uid"],
      google_creationTime: map["google_data"]["google_uid"],
      google_lastSignInTime: map["google_data"]["google_uid"],
    );
  }
}
