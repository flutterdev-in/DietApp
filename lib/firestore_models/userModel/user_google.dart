import 'package:cloud_firestore/cloud_firestore.dart';

class UserGoogle {
  var UID;
  var googleDisplayName;
  var googleEmail;
  var googlePhotoURL;
  var googleEmailVerified;
  var googleIsAnonymous;
  var googlePhoneNumber;
  var googleCreationTime;
  var googleLastSignInTime;

  UserGoogle({
    this.UID,
    this.googleDisplayName,
    this.googleEmail,
    this.googlePhotoURL,
    this.googleEmailVerified,
    this.googleIsAnonymous,
    this.googlePhoneNumber,
    this.googleCreationTime,
    this.googleLastSignInTime,
  });

  Map<String, dynamic> toMap() {
    return {
      "docID": UID,
      "UID": UID,
      "googleData": {
        "googleUID": UID,
        "googleDisplayName": googleDisplayName,
        "googleEmail": googleEmail,
        "googlePhotoURL": googlePhotoURL,
        "googleEmailVerified": googleEmailVerified,
        "googleIsAnonymous": googleIsAnonymous,
        "googlePhoneNumber": googlePhoneNumber,
        "googleCreationTime": googleCreationTime,
        "googleLastSignInTime": googleLastSignInTime,
      },
    };
  }

  factory UserGoogle.fromMap(Map map) {
    return UserGoogle(
      UID: map["UID"],
      googleDisplayName: map["googleData"]["googleDisplayName"],
      googleEmail: map["googleData"]["googleEmail"],
      googlePhotoURL: map["googleData"]["googlePhotoURL"],
      googleEmailVerified: map["googleData"]["googleEmailVerified"],
      googleIsAnonymous: map["googleData"]["googleIsAnonymous"],
      googlePhoneNumber: map["googleData"]["googlePhoneNumber"],
      googleCreationTime: map["googleData"]["googleCreationTime"],
      googleLastSignInTime: map["googleData"]["googleLastSignInTime"],
    );
  }
}
