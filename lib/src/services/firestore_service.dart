import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_operations/src/models/product.dart';

class FirestoreService{
  FirebaseFirestore _db = FirebaseFirestore.instance;
  
  //get entries
  Stream<List<Product>> getProducts(){
    return _db                                  //from our firestore instance
    .collection('products')                     //from collection
    .snapshots()                                //get snapshots
    .map((snapshot) => snapshot.docs            //map through each snapshot get docs
    .map((doc)=> Product.fromJson(doc.data()))  //map through each doc get data into dart object
    .toList());                                 //get a list
  }

  Future<void> setProduct(Product product){
    var options = SetOptions(merge:true);

    return _db
    .collection("products")
    .doc(product.pId)
    .set(product.toMap(),options);
  }

  Future<void> removeProduct(String pId){
    return _db
    .collection("products")
    .doc(pId)
    .delete();
  }
}