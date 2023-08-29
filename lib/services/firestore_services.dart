import 'package:emart_app/consts/consts.dart';

class FirestoreServices {
  static getUser(uid) {
    return firestore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  static getProducts(category) {
    return firestore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
  }
}