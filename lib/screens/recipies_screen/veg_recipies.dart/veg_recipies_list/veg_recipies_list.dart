import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VegRecipiesList extends StatefulWidget {
  @override
  _VegRecipiesListState createState() => _VegRecipiesListState();
}

class _VegRecipiesListState extends State<VegRecipiesList> {
  //String rField = Get.arguments.toString();
  final rData = FirebaseFirestore.instance
      .collection('rData')
      .where(Get.arguments.toString(), isEqualTo: true)
      //.orderBy('rID')
      //.where("iID", isLessThan: 100)
      //.where("Protine", isGreaterThan: 50)
      //.where("Protine", isGreaterThan: 50)
      //
      //.orderBy("Protine", descending: true)
      .limit(20)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Recipies"),
          toolbarHeight: 40,
        ),
        body: StreamBuilder<QuerySnapshot>(
            stream: rData,
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }
              if (snapshot.hasData) {
                final List list = snapshot.data!.docs;
                return ListView.builder(
                    itemCount: snapshot.data!.size,
                    itemBuilder: (context, i) {
                      Map<String, dynamic> rD =
                          list[i].data() as Map<String, dynamic>;
                      //Map<String, dynamic> rDN = rD["rNutriData"];

                      num nE;
                      if (rD["Net Energy"] is num) {
                        nE = rD["Net Energy"].round();
                      } else {
                        nE = 0;
                      }

                      num nP;
                      if (rD["Protine"] is num) {
                        nP = rD["Protine"].round();
                      } else {
                        nP = 0;
                      }
                      try {
                        return ListTile(
                          title: Text(rD["rName"].toString()),
                          subtitle: Text(
                              "Net Energy ${nE}kcal, Protine ${nP}g #Per Serving"),
                          leading: CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                                  color: Colors.purple,
                                ),
                            imageUrl:
                                //"https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2Fsweets.jpg?alt=media&token=50fe0edb-7714-4f03-8e09-5ecd07049436",
                                rD["rImg150"].toString(),
                          ),
                          onTap: () {
                            Get.to(() => VegRecipeEach(), arguments: rD);
                          },
                        );
                      } catch (e) {
                        return ListTile(
                          title: Text("Error $e occured please report"),
                        );
                      }
                    });
              }
              return Text('Loading....');
            }));
  }
}
