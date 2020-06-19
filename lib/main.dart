import 'package:flutter/material.dart';
import 'package:quizzler/helper/funtions.dart';
import 'package:quizzler/views/home_page.dart';
import 'package:quizzler/views/sign_in.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoggedIn=false;

  @override
  void initState() {
   checkUserLoggedInStatus();
    super.initState();
  }

  checkUserLoggedInStatus()async{
    HelperFuntions.getUserLoggedInDetails().then((val){
      setState(() {
        isLoggedIn=val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QuizMaker',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: (isLoggedIn ?? false) ? Home() : SignIn(),
    );
  }
}

