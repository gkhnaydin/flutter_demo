//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:birlesmisprojeler/getJsonData.dart';
import 'package:birlesmisprojeler/userModelApiPage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
import 'helloworld.dart';
import 'emptyblogapp.dart';
import 'hesapmakinesi.dart';
import 'todoapp.dart';
import 'mesajlasmaapp.dart';
import 'firebaseconnect.dart';
import 'userloginfirebaseconnect.dart';

/*Future<void> main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCWl3XsikUEnXxZb_uLtDvFY-mDlVlBr7o",
      appId: "1:246729435654:android:6b94332cb70ab811e87187",
      messagingSenderId: "XXX",
      projectId: "fir-test-project-6c806",
    ),
  );*/
  runApp(myApp());
}*/

class mainpage extends StatelessWidget {
  const mainpage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Birleştirilmiş Projeler",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Iskelet(),
    );
  }
}

class Iskelet extends StatefulWidget {
  const Iskelet({super.key});

  IskeletState createState() {
    return IskeletState();
  }
}

class IskeletState extends State<Iskelet> {
  openJsonDataAppReqresIn() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => userMobilApiPage(),
        ));
  }

  openJsonDataApp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => getJsonData(),
        ));
  }

  openEmtpyBlogApp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => emptyblogapp(),
        ));
  }

  openHelloWorldApp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => helloworld(),
        ));
  }

  openHesapMakinesiApp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => hesapmakinesi(),
        ));
  }

  openMesajlasmaApp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => mesajlasmaapp(),
        ));
  }

  openToDoApp() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => todoapp(),
        ));
  }

  openFirebase() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => firebaseconnect(),
        ));
  }

  openFirebaseUserLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => userloginfirebaseconnect(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: openEmtpyBlogApp, child: Text('empty blog app')),
              ElevatedButton(
                  onPressed: openHelloWorldApp, child: Text('hello world app')),
              ElevatedButton(
                  onPressed: openHesapMakinesiApp,
                  child: Text('hesap makinesi app')),
              ElevatedButton(
                  onPressed: openMesajlasmaApp, child: Text('mesajlasma app')),
              ElevatedButton(onPressed: openToDoApp, child: Text('to-to app')),
              ElevatedButton(
                  onPressed: openFirebase, child: Text('firebase connect app')),
              ElevatedButton(
                  onPressed: openFirebaseUserLogin,
                  child: Text('Kullanıcı Girişli firebase connect app')),
              ElevatedButton(
                  onPressed: openJsonDataApp,
                  child: Text('JSON veri çekme app')),
              ElevatedButton(
                  onPressed: openJsonDataAppReqresIn,
                  child: Text('https://reqres.in/ JSON veri çekme app')),
            ],
          ),
        ),
      ),
    );
  }
}
