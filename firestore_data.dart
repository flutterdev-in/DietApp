import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RecipiesHomeScreen extends StatefulWidget {
  @override
  _RecipiesHomeScreenState createState() => _RecipiesHomeScreenState();
}

class _RecipiesHomeScreenState extends State<RecipiesHomeScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('RecipiesData').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipies"),
          toolbarHeight: 40,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: _usersStream,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              if (snapshot.hasData) {
                final list = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: 30,
                    itemBuilder: (context, i) {
                      var rN = list[i]['rNutriData'];
                      var nE;
                      if (list[i]['rNutriData']["Net Energy"] is double) {
                        nE = list[i]['rNutriData']["Net Energy"].round();
                      } else {
                        nE = 0;
                      }

                      var nP;
                      if (list[i]['rNutriData']["Protine"] is double) {
                        nP = list[i]['rNutriData']["Protine"].round();
                      } else {
                        nP = 0;
                      }
                      return ListTile(
                        title: Text(list[i]["rName"]),
                        subtitle: Text(
                            "Net Energy ${nE}kcal, Protine ${nP}g #Per Serving"),
                        leading: Image.network(list[i]["rImgURL500"]),
                      );
                    });
              }
              return Text('Loading....');
            }));
  }
}
