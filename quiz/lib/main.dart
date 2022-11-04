import 'dart:async';
import 'dart:ffi';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  final Future<Firebase> _fbApp = Firebase.initializeApp() as Future<Firebase>;


   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      title: "GECOMTECH QUIZ GAME",
      home: FutureBuilder(
        future: _fbApp,
        builder:(context, snapshot){
          if(snapshot.hasError){
              return Text("Something Went's Wrong");
          }
          else if(snapshot.hasData){
            return splash();
          }
          else {
            return Center(child: CircularProgressIndicator(),);
          }
        }
      ),
    );
  }
}

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();

}

class _splashState extends State<splash> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context)=> login(),
      ));
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      body: Center(child: Image.asset(
        'assets/icon.png'
      )),

    )
  }
}