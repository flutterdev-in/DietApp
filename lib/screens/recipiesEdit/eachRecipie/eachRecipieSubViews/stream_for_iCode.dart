import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipiesEdit/models/food_id_model_for_edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:getwidget/getwidget.dart';

class StreamForIcode extends StatelessWidget {
  StreamForIcode({Key? key}) : super(key: key);
  var fID;
  var widget;
  StreamForIcode.name({required this.fID, this.widget = "name"});
  StreamForIcode.img150({required this.fID, this.widget = "img150"});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("FoodData")
          .doc(fID)
          .snapshots(),
      builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData && snapshot.data!.exists) {
          Map<String, dynamic> fData =
              snapshot.data!.data() as Map<String, dynamic>;
          FoodModelForEachIngEdit.fromMap(fData);
          if (widget == "name") {
            return Text(FoodModelForEachIngEdit().commonName);
          } else {
            return GFAvatar(
                backgroundColor: Colors.blueGrey[700],
                child: GFImageOverlay(
                  shape: BoxShape.circle,
                  image: NetworkImage(FoodModelForEachIngEdit().img150),
                  width: double.infinity,
                  height: double.infinity,
                ));
          }
        } else {
          return Text("");
        }
      },
    );
  }
}
