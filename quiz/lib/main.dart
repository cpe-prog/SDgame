import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  final Future<Firebase> _fbApp = firebase.initializeApp();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.cyan),
      title: "Programming Quiz",
      home: FutureBuilder(future: _fbApp, 
      builder: ((context, snapshot) {
        if(snapshot.hasError){
          return Text("Something went's wrong!");
        }
        else if(snapshot.hasData){
          return splash()
        }
        else {
          return Center(child: CircularProgressIndicator(),);
        }


      })),
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
  Widget build(BuildContext context) {
    return Container();
  }
}