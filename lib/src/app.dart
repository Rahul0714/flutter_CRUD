import 'package:crud_operations/src/providers/product_provider.dart';
import 'package:crud_operations/src/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
          create: (BuildContext context)=>ProductProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          accentColor: Colors.red,
          primaryColor: Colors.black,
          textTheme: GoogleFonts.patrickHandScTextTheme()),
      ),
    );
  }
}
