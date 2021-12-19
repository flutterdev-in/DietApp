import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class EmployeeModel {
  String? docId;
  String? name;
  String? address;

  EmployeeModel({
    this.docId,
    this.name,
    this.address,
  });

  Future<Map> getCat() async {
    DocumentSnapshot userDocSnap = await FirebaseFirestore.instance
        .collection('users')
        .doc(GetStorage().read('uid'))
        .get();
    return userDocSnap.data() as Map ;
  }
}
