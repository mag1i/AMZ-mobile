import 'package:afz/pay.dart';
import 'package:afz/successfull.dart';
import 'package:afz/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'client info.dart';
import 'esign.dart';
import 'loadingscreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AFZ',
      theme: ThemeData(

     //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  AnimatedSplashScreen(
        splash:
              Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/logo.png'), // Use NetworkImage for web images
                    fit: BoxFit.fitHeight ,
                  ),
                ),),

          //Text('AHMED', style: TextStyle(color: Colors.white, fontSize: 30),),]
          //child:Text('\n\n\nAHMED', style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),)
         nextScreen: payment(),
        duration: 3000,
        splashTransition: SplashTransition.fadeTransition,
        //backgroundColor: Color.fromRGBO(84, 114, 230, 1),
      ),
    );
  }
}


