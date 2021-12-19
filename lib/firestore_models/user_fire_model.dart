// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

UserModel welcomeFromJson(String str) => UserModel.fromJson(json.decode(str));

String welcomeToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.googleData,
    });

    UserGoogleeData? googleData ;

    factory UserModel.fromJson(var json) => UserModel(
        googleData: UserGoogleeData.fromJson(json["google_data"]),
    );

    Map<String, dynamic> toJson() => {
        "google_data": googleData!.toJson(),
    };
}

class UserGoogleeData {
    UserGoogleeData({
        this.googleUid,
        this.googleDisplayName,
        this.googleEmail,
        this.googlePhotoURL,
        this.googleEmailVerified,
        this.googleIsAnonymous,
        this.googlePhoneNumber,
        this.googleCreationTime,
        this.googleLastSignInTime,
    });

    var googleUid ;
    var googleDisplayName;
    var googleEmail;
    var googlePhotoURL ;
    var googleEmailVerified;
    var googleIsAnonymous;
    var googlePhoneNumber;
    var googleCreationTime;
    var googleLastSignInTime;

    factory UserGoogleeData.fromJson(Map<String, dynamic> json) => UserGoogleeData(
        googleUid: json["google_uid"],
        googleDisplayName: json["google_displayName"],
        googleEmail: json["google_email"],
        googlePhotoURL: json["google_photoURL"],
        googleEmailVerified: json["google_emailVerified"],
        googleIsAnonymous: json["google_isAnonymous"],
        googlePhoneNumber: json["google_phoneNumber"],
        googleCreationTime: json["google_creationTime"],
        googleLastSignInTime: json["google_lastSignInTime"],
    );

    Map<String, dynamic> toJson() => {
        "google_uid": googleUid,
        "google_displayName": googleDisplayName,
        "google_email": googleEmail,
        "google_photoURL": googlePhotoURL,
        "google_emailVerified": googleEmailVerified,
        "google_isAnonymous": googleIsAnonymous,
        "google_phoneNumber": googlePhoneNumber,
        "google_creationTime": googleCreationTime,
        "google_lastSignInTime": googleLastSignInTime,
    };
}
