import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_snack/view/home.dart';
import 'package:news_snack/view/spalsh.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplash=true;
LoadHome(){
  Future.delayed(Duration(seconds: 3),() {
    setState(() {
      showingSplash=false;
    });
  });
}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    LoadHome();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News snack',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: showingSplash?SplashScreen():HomeScreen(quarry:''),
    );
  }
}

