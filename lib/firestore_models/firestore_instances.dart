import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class FirestoreInstance {
  CollectionReference userCollectionReference =
      FirebaseFirestore.instance.collection("users");
  DocumentReference userDocumentReference = FirebaseFirestore.instance
      .collection("users")
      .doc(GetStorage().read("uid"));
}
