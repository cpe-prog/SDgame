import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:firebase_core/firebase_core.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class login extends StatefulWidget {
  const login({ Key? key }) : super (key: key);
  
  @override
  State<login> createState{} => _loginState();

}

  class _loginState extends StatefulWidget {
    @override
    Widget build(BuildContext context ) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("login"),
          centerTitle: true,
        ),
      body: FutureBuilder(
        future: FirebaseFirestore.instance.collection('point').get(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset(""),
                  ),
                ),
              ),  
               Container(
                width: 250,
                height: 50,

                child: ElevatedButton(
                child: Text("START"),
                onPressed: {}async(
                  checkinternetconnection()
                ),
                ),
              ),
                SizedBox(height: 130,)

            ]),
          );

        }
      ),
      );
    }

  void checkinternetconnection() async{
    var result = await Connectivity().checkConnectivity();
    if(result == ConnectivityResult.none){
      _showDialog("NO internet", "You're connected over mobile data");
    }
    else if(result == ConnectivityResult.mobile){
      _showDialog(" internet", "You're connected over mobile data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => accurll()));
    }
    else if(result == ConnectivityResult.wifi){
      _showDialog("internet", "You're connected over mobile data");
      Navigator.push(context, MaterialPageRoute(builder: (_) => accurll()));
    }
  }
  _showDialog(title, text){

    showDialog(
      context: context,
      builder: context){

        return AlertDialog(
          title: text(title),
          content: text(text),
          actions: <Widget>[
            hintbutton(onPressed:(){
              Navigator.of(context).pop();
            },
            child: text('ok')
            )
          ],
        );

      }

  }

  }

  