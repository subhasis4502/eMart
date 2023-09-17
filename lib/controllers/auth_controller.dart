import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  // Login With Google
  Future<UserCredential?> loginWithGoogleMethod({context}) async {
    UserCredential? userCredential;
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      await googleSignIn.signOut();

      final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();

      if(googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken
        );

        try {
          userCredential = await auth.signInWithCredential(credential);
        } on FirebaseAuthException catch(e) {
          VxToast.show(context, msg: e.toString());
        }
      }
    } on FirebaseAuthException catch(e) {
      if(e.code == 'account-exist-with-different-credential') {
        VxToast.show(context, msg: "Account already exist");
      }
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
      'cart_count': '00',
      'wishlist_count': '00',
      'order_count': '00',
    });
  }

  // Sign Out
  signoutMethod(context) async {
    try{
      await auth.signOut();
      VxToast.show(context, msg: "Sign out successfully");
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
