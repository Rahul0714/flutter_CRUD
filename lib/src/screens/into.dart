import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import 'home.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
          title:"Welcome",
          body:"Welcome to the BuyHere app, here you'll get whatever you need!!",
          image: Center(
            child: Image.asset("images/welcome.jpeg"),
          )
        ),
        PageViewModel(
          title:"Home Delivery",
          body:"This app will provide Home delivery of product you purchased!",
           image: Center(
             child: Image.asset("images/delivery.jpeg"),
           )
        ),
        PageViewModel(
          title:"Payments",
          body:"Many Options of Pay for the Product you buy, pay online or pay when you get delivery!!",
           image: Center(
             child: Image.asset("images/onlinepay.jpeg"),
           )
        ),
        
      ], 
    onDone: (){
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomePage()));
    },
    onSkip:(){
    },
    showSkipButton: true,
    skip: const Icon(Icons.skip_next),
    next: const Icon(Icons.arrow_forward_ios),
    done: Text("Done",),
    );
  }
}