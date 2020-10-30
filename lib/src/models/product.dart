import 'package:flutter/cupertino.dart';

class Product {
  final String pId;
  final String pName;
  final String pPrice;
  final String pCount;

  Product({@required this.pId,this.pName, this.pPrice, this.pCount,});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        pId: json['pId'],
        pName: json['pName'],
        pPrice: json['pPrice'],
        pCount: json['pCount'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'pId' : pId,
      'pName' : pName,
      'pPrice' : pPrice,
      'pCount' : pCount,
    };
  }
}
