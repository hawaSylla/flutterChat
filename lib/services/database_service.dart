import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  late final String? uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");

  final CollectionReference groupCollection =
      FirebaseFirestore.instance.collection("groups");

  Future updateUserData(String email) async {
    return await userCollection.doc(uid).set({
      "fullName": "",
      "email": email,
      "groups": [],
      "profilePic": "",
      "uid": uid,
    });
  }
}
