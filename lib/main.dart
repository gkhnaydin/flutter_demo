import 'package:birlesmisprojeler/mainpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: splash_screen(),
  ));
}

class splash_screen extends StatefulWidget {
  splash_screenState createState() {
    return splash_screenState();
  }
}

class splash_screenState extends State<splash_screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1), () {
      print("splash screen çalıştı");
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => mainpage(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/splash_screen.png"),
                fit: BoxFit.cover)),
      ),
    );
  }
}
