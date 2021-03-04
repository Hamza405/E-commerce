import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_c/model/user.dart';

class FireStoreUser {
  final CollectionReference _collectionReference = FirebaseFirestore.instance.collection('Users');
 
  Future<void> addUserToFireStore(UserModel userModel)async{
    return await _collectionReference.doc(userModel.userId).set(userModel.toJson());
  }
  Future<DocumentSnapshot> getCUser(String id) async {
    return await _collectionReference.doc(id).get();
  }
}