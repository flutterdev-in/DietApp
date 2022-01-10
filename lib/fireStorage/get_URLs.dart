import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dietapp_v002/fireStorage/rlist.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class GetFireImages {
  List listNames = ["D031","G008","T005"];
  // Rlist().ninList;
  Future<void> downloadAndUploadURL() async {

    for (String docID in listNames) {
      try {
        String downloadURL = await firebase_storage.FirebaseStorage.instance
            .ref('/FoodData images/NINimages/${docID}.jpg')
            .getDownloadURL();

        await FirebaseFirestore.instance
            .collection("FoodData")
            .doc(docID)
            .update({"imgURL.img500": downloadURL});
        print(docID);
      } catch (e) {
        print("Error uploading $docID");
      }

      //print("done");
    }
  }
}
