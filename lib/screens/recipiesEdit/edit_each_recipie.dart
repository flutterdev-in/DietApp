import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/editeach_recipie_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditEachRecipie extends StatefulWidget {
  const EditEachRecipie({Key? key}) : super(key: key);

  @override
  _EditEachRecipieState createState() => _EditEachRecipieState();
}

class _EditEachRecipieState extends State<EditEachRecipie> {
  String docID = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("FoodData")
              .doc(docID)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<DocumentSnapshot> documentSnapshot) {
            if (documentSnapshot.hasError) {
              return const Text('Error');
            }

            if (documentSnapshot.hasData && !documentSnapshot.data!.exists) {
              return const Text("No records found");
            }

            if (documentSnapshot.hasData && documentSnapshot.data!.exists) {
              Map<String, dynamic> data =
                  documentSnapshot.data!.data() as Map<String, dynamic>;
              return EditEachRecipieIngredients();
            }

            return ListTile(
              tileColor: Colors.black87,
              title: Text(
                "Loading",
                textScaleFactor: 1.2,
                style: TextStyle(color: Colors.white),
              ),
              leading: Icon(
                Icons.autorenew,
              ),
              subtitle: Text(
                "Please wait",
                style: TextStyle(color: Colors.white),
              ),
            );
          }),
    );
  }
}
