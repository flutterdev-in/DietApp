import 'package:cloud_firestore/cloud_firestore.dart';

class UserGoogle {
  var UID;
  var docID;
  var googleUID;
  var googleDisplayName;
  var googleEmail;
  var googlePhotoURL;
  var googleEmailVerified;
  var googleIsAnonymous;
  var googlePhoneNumber;
  var googleCreationTime;
  var googleLastSignInTime;

  UserGoogle({
    this.docID,
    this.UID,
    this.googleUID,
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
      "docID": docID,
      "UID": UID,
      "googleData": {
        "googleUID": googleUID,
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

  factory UserGoogle.fromMap(DocumentSnapshot map) {
    return UserGoogle(
      docID: map["docID"],
      UID: map["UID"],
      googleUID: map["googleData"]["googleUID"],
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
