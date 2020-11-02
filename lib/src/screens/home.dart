import 'package:crud_operations/src/models/product.dart';
import 'package:crud_operations/src/providers/product_provider.dart';
import 'package:crud_operations/src/screens/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("My Products"),),
      body: StreamBuilder<List<Product>>(
        stream: productProvider.products,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context,index){
              return ListTile(
                trailing: Icon(Icons.edit,),
                title: Text(snapshot.data[index].pName),
                subtitle: Text("Price: ₹ "+snapshot.data[index].pPrice),
                leading: Text(snapshot.data[index].pCount),
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context)=> ProductPage(product: snapshot.data[index],)));
                },
              );
            });
        }
      ),
      floatingActionButton: FloatingActionButton(onPressed:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context )=>ProductPage()));
      } ,
      child: Icon(Icons.add),),
    );
  }
}