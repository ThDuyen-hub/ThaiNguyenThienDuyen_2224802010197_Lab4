import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CRUDService {
  User? user = FirebaseAuth.instance.currentUser;

  //Thêm mới danh bạ 
  Future addNewContact(String name, String phone) async {
    Map<String, dynamic> data = {"name": name, "phone": phone};
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .add(data);
    } catch (e) {
      print(e.toString());
    }
  }

  //Đọc danh bạ
  Stream<QuerySnapshot> getContacts() {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .collection("contacts")
        .snapshots();
  }

  //Cập nhật danh bạ
  Future updateContact(String name, String phone, String docID) async {
    Map<String, dynamic> data = {"name": name, "phone": phone};
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .update(data);
    } catch (e) {
      print(e.toString());
    }
  }

  //Xóa danh bạ
  Future deleteContact(String docID) async {
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(user!.uid)
          .collection("contacts")
          .doc(docID)
          .delete();
    } catch (e) {
      print(e.toString());
    }
  }
}