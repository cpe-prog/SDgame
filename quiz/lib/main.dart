import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login.dart';

Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      title: "Programming Quiz",
      home: FutureBuilder(future: _fbApp, 
      builder: ((context, snapshot) {
        if(snapshot.hasError){
          return const Text("Something went's wrong!");
        }
        else if(snapshot.hasData){
          return const splash();
        }
        else {
          return const Center(child: CircularProgressIndicator(),);
        }


      })),
    );
  }
}

// ignore: camel_case_types
class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();


}

// ignore: camel_case_types
class _splashState extends State<splash> {


@override
void initState(){
  super.initState();
  Timer(const Duration(seconds: 3),(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context)=> const login(),
    ));
  });
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Image.asset(
        'asset/icon.png'
      ),),
    );
  }
}