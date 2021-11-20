import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/screens/recipies_screen/veg_recipies.dart/veg_recipies_list/veg_recipie_each/veg_recipie_each.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirestoreSearch extends StatefulWidget {
  const FirestoreSearch({Key? key}) : super(key: key);

  @override
  _FirestoreSearchState createState() => _FirestoreSearchState();
}

class _FirestoreSearchState extends State<FirestoreSearch> {
  String name = "c";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Card(
            child: TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: "Search Recipies.."),
              onChanged: (val) {
                setState(() {
                  name = val;
                });
              },
            ),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: (name != "c" && name != null)
              ? FirebaseFirestore.instance
                  .collection("rData")
                  .where("rNameSubStrings", arrayContains: name)
                  .limit(10)
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection("rData")
                  .where("rNameSubStrings", arrayContains: name)
                  .limit(10)
                  .snapshots(),
          builder: (context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot data = snapshot.data!.docs[index];
                      return Container(
                        padding: EdgeInsets.only(
                          top: 7,
                        ),
                        child: ListTile(
                          title: Text(data['rName']),
                          subtitle: Text(
                            "Protine ${double.parse((data['Protine']).toStringAsFixed(2))} gms",
                            style: TextStyle(color: Colors.brown[700]),
                          ),
                          leading: CachedNetworkImage(
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(
                              color: Colors.purple,
                            ),
                            imageUrl:
                                //"https://firebasestorage.googleapis.com/v0/b/dietapp-in.appspot.com/o/DietApp%20Assets%2Fsweets.jpg?alt=media&token=50fe0edb-7714-4f03-8e09-5ecd07049436",
                                data["rImg150"].toString(),
                          ),
                          onTap: () {
                            Get.to(() => VegRecipeEach(), arguments: data);
                          },
                        ),
                      );
                    });
          },
        ),
      ),
    );
  }
}
