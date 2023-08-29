import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {

  var isLoading = false.obs;
  // Login
  Future<UserCredential?> loginMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  // Sign Up
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;

    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }

    return userCredential;
  }

  // Storing data to firestore
  storeuserData({name, email, password}) async {
    DocumentReference store =
        await firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({
      'id': currentUser!.uid,
      'name': name,
      'email': email,
      'password': password,
      'imageUrl': '',
    });
  }

  // Sign Out
  signoutMethod(context) async {
    try{
      await auth.signOut();
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
