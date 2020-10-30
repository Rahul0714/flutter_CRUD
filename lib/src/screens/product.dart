import 'package:crud_operations/src/models/product.dart';
import 'package:crud_operations/src/providers/product_provider.dart';
//import 'package:crud_operations/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  final Product product;
  ProductPage({this.product});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  final _pNameController = TextEditingController();
  final _pPriceController = TextEditingController();
  final _pCountController = TextEditingController();
 
  @override
  void dispose() {
    _pNameController.dispose();
    _pPriceController.dispose();
    _pCountController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final productProvider = Provider.of<ProductProvider>(context,listen: false);
    if(widget.product!=null){
      _pNameController.text = widget.product.pName;
      _pPriceController.text = widget.product.pPrice;
      _pCountController.text = widget.product.pCount;

      productProvider.loadAll(widget.product);
    }else{
      productProvider.loadAll(null);
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("My Products")),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Name :",
                border: InputBorder.none,
              ),
              onChanged: (String pNvalue)=> productProvider.changePName = pNvalue,
              controller: _pNameController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Price :",
                border: InputBorder.none,
              ),
              onChanged: (String pPvalue)=> productProvider.changePPrice = pPvalue,
              controller: _pPriceController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Qty :",
                border: InputBorder.none,
              ),
              onChanged: (String pCvalue)=> productProvider.changePCount = pCvalue,
              controller: _pCountController,
            ),
            RaisedButton(onPressed: () {
              productProvider.saveEntry();
              Navigator.of(context).pop();
            },
            child:Text("Save"),
            ),
            (widget.product!=null)?RaisedButton(onPressed: () {
              productProvider.removeEntry(widget.product.pId);
              Navigator.of(context).pop();
            },
            child:Text("Delete"),
            ):Container(),
          ],
        ),
      ),
    );
  }
}
