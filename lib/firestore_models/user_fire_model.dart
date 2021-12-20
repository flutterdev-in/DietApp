// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.googleData,
        this.uid,
        this.docId,
    });

    UserGoogleData? googleData;
    String? uid;
    String? docId;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        googleData: UserGoogleData.fromJson(json["googleData"]),
        uid: json["UID"],
        docId: json["docID"],
    );

    Map<String, dynamic> toJson() => {
        "googleData": googleData!.toJson(),
        "UID": uid,
        "docID": docId,
    };
}

class UserGoogleData {
    UserGoogleData({
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

    var googleUID ;
    var googleDisplayName;
    var googleEmail;
    var googlePhotoURL ;
    var googleEmailVerified;
    var googleIsAnonymous;
    var googlePhoneNumber;
    var googleCreationTime;
    var googleLastSignInTime;

    factory UserGoogleData.fromJson(Map<String, dynamic> json) => UserGoogleData(
        googleUID: json["googleUID"],
        googleDisplayName: json["googleDisplayName"],
        googleEmail: json["googleEmail"],
        googlePhotoURL: json["googlePhotoURL"],
        googleEmailVerified: json["googleEmailVerified"],
        googleIsAnonymous: json["googleIsAnonymous"],
        googlePhoneNumber: json["googlePhoneNumber"],
        googleCreationTime: json["googleCreationTime"],
        googleLastSignInTime: json["googleLastSignInTime"],
    );

    Map<String, dynamic> toJson() => {
        "googleUID": googleUID,
        "googleDisplayName": googleDisplayName,
        "googleEmail": googleEmail,
        "googlePhotoURL": googlePhotoURL,
        "googleEmailVerified": googleEmailVerified,
        "googleIsAnonymous": googleIsAnonymous,
        "googlePhoneNumber": googlePhoneNumber,
        "googleCreationTime": googleCreationTime,
        "googleLastSignInTime": googleLastSignInTime,
    };
}





// import 'dart:convert';

// UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

// String welcomeToJson(UserModel data) => json.encode(data.toJson());

// class UserModel {
//     UserModel({
//         this.googleData,
//     });

//     UserGoogleData? googleData ;

//     factory UserModel.fromJson(var json) => UserModel(
//         googleData: UserGoogleData.fromJson(json["google_data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "google_data": googleData!.toJson(),
//     };
// }

// class UserGoogleData {
//     UserGoogleData({
//         this.googleUid,
//         this.googleDisplayName,
//         this.googleEmail,
//         this.googlePhotoURL,
//         this.googleEmailVerified,
//         this.googleIsAnonymous,
//         this.googlePhoneNumber,
//         this.googleCreationTime,
//         this.googleLastSignInTime,
//     });

//     var googleUid ;
//     var googleDisplayName;
//     var googleEmail;
//     var googlePhotoURL ;
//     var googleEmailVerified;
//     var googleIsAnonymous;
//     var googlePhoneNumber;
//     var googleCreationTime;
//     var googleLastSignInTime;

//     factory UserGoogleData.fromJson(Map<String, dynamic> json) => UserGoogleData(
//         googleUid: json["google_uid"],
//         googleDisplayName: json["google_displayName"],
//         googleEmail: json["google_email"],
//         googlePhotoURL: json["google_photoURL"],
//         googleEmailVerified: json["google_emailVerified"],
//         googleIsAnonymous: json["google_isAnonymous"],
//         googlePhoneNumber: json["google_phoneNumber"],
//         googleCreationTime: json["google_creationTime"],
//         googleLastSignInTime: json["google_lastSignInTime"],
//     );

//     Map<String, dynamic> toJson() => {
//         "google_uid": googleUid,
//         "google_displayName": googleDisplayName,
//         "google_email": googleEmail,
//         "google_photoURL": googlePhotoURL,
//         "google_emailVerified": googleEmailVerified,
//         "google_isAnonymous": googleIsAnonymous,
//         "google_phoneNumber": googlePhoneNumber,
//         "google_creationTime": googleCreationTime,
//         "google_lastSignInTime": googleLastSignInTime,
//     };
// }
