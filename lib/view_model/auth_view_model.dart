import 'package:e_c/model/user.dart';
import 'package:e_c/serves/firestoe_user.dart';
import 'package:e_c/util/local_storge.dart';
import 'package:e_c/view/control_view.dart';
import 'package:e_c/view/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthViewModel extends GetxController{
  GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final LocalStorageData localStorageData = Get.find();

  String email, password, name;

  Rx<User> _user = Rx<User>();

  String get user => _user.value?.email;

  @override
  void onInit(){
    super.onInit();
    _user.bindStream(_firebaseAuth.authStateChanges());
  }

  void googleSignInMethod() async {
  final GoogleSignInAccount googleUser = await googleSignIn.signIn();
  GoogleSignInAuthentication googleSignInAuthentication =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      idToken: googleSignInAuthentication.idToken,
      accessToken: googleSignInAuthentication.accessToken,
    );

    await _firebaseAuth.signInWithCredential(credential).then((user) {
      saveUser(user);
      Get.offAll(ControlView());
    });
  }

  // void facebookSignInMethod() async {
  //   final AccessToken result = await FacebookAuth.instance.login();

  //   final FacebookAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(result.token);

  //   await _auth.signInWithCredential(facebookAuthCredential).then((user) {
  //     saveUser(user);
  //   });
  // }

  void signIn() async {
    try{
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password).then((value) async {
        await FireStoreUser().getCUser(value.user.uid).then((value) {
          setUser(UserModel.fromJson(value.data()));
        });

        Get.offAll(ControlView());
      } );
    }catch(e){
      Get.snackbar('Error', e);
    }
  }

  void signUp() async{
    try{
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password).then((user) async {
        Get.offAll(ControlView());
        
        UserModel usermodel = UserModel(
          userId: user.user.uid,
          email: user.user.email,
          name: name,
          pic: ''
        );

        await FireStoreUser().addUserToFireStore(usermodel);
        

        });
      
    }catch(e){
      Get.snackbar('Error', e);
    }
  }
    void saveUser(UserCredential user) async {
      UserModel model = UserModel(
      userId: user.user.uid,
      email: user.user.email,
      name: name == null ? user.user.displayName : name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(model);
    setUser(model);
  }

  void setUser(UserModel model) async {
    await localStorageData.setUserData(model);
  }
}


