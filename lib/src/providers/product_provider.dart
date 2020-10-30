import 'package:crud_operations/src/models/product.dart';
import 'package:crud_operations/src/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class ProductProvider with ChangeNotifier{
  final firestoreService = FirestoreService();

  String _pName;
  String _pPrice;
  String _pCount;
  String _pId;
  
  var uuid = Uuid();
  String get pName => _pName;
  String get pPrice => _pPrice;
  String get pCount => _pCount;
  
  Stream<List<Product>> get products => firestoreService.getProducts();

  set changePName(String  pName){
    _pName = pName;
    notifyListeners();
  }
  set changePPrice(String  pPrice){
    _pPrice = pPrice;
    notifyListeners();
  }
  set changePCount(String  pCount){
    _pCount = pCount;
    notifyListeners();
  }

  loadAll(Product product){
    if(product!=null){
      _pName = product.pName;
      _pPrice = product.pPrice;
      _pCount = product.pCount;
      _pId = product.pId;
    }else{
      _pName = null;
      _pPrice = null;
      _pCount = null;
      _pId = null;
    }
  }
  saveEntry(){
    if(_pId==null){
      var newProduct = Product(pName: _pName,pPrice: _pPrice,pCount: _pCount,pId: uuid.v1());
      firestoreService.setProduct(newProduct); 
    }else{
      var updateProduct =  Product(pName: _pName,pPrice: _pPrice,pCount: _pCount,pId: _pId);
      firestoreService.setProduct(updateProduct);
    }
  }
  removeEntry(String pId){
    firestoreService.removeProduct(pId);
  }
}