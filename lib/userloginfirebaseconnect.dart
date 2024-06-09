import 'dart:js_interop';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:birlesmisprojeler/userprofile.dart';

class userloginfirebaseconnect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Connect Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Iskelet(title: 'Firebase Connect Demo Home Page'),
    );
  }
}

class Iskelet extends StatefulWidget {
  const Iskelet({super.key, required this.title});
  final String title;

  @override
  IskeletState createState() => IskeletState();
}

class IskeletState extends State<Iskelet> {
  TextEditingController emailInput = TextEditingController();
  TextEditingController passwordInput = TextEditingController();
  String email = "", password = "";

  getWarningMessage(String message) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Uyarı"),
            content: Text(message),
            actions: [
              new TextButton(
                child: Text("Kapat"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  Future<void> saveUser() async {
    if (passwordInput.text.length <= 5) {
      return getWarningMessage("En az 6 karakterli şifre oluşturunuz!");
    }
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailInput.text, password: passwordInput.text)
        .then((kullanici) {
      FirebaseFirestore.instance
          .collection("KullaniciBilgileri")
          .doc(emailInput.text)
          .set({
        "KUllaniciEposta": emailInput.text,
        "KullaniciSifre": passwordInput.text,
        "Info": kullanici.hashCode
      });
    }).whenComplete(
      () {
        emailInput.clear();
        passwordInput.clear();
        getWarningMessage("İşlem gerçekleşti!");
      },
    );
  }

  deleteUser() {
    if (emailInput.text.isEmpty) {
      return getWarningMessage("Kullanıcı bilgisi boş olamaz!");
    }
  }

  Future<void> loginUser() async {
    if (emailInput.text.isEmpty) {
      return getWarningMessage("Kullanıcı bilgisi boş olamaz!");
    }
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailInput.text, password: passwordInput.text)
        .then((value) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => userprofile(
                name: value.user?.displayName ?? '',
                pass: value.user?.email ?? ''),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /*appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),*/
        body: Container(
      margin: EdgeInsets.all(75),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: emailInput,
              decoration: InputDecoration(hintText: 'eMail'),
            ),
            TextFormField(
              controller: passwordInput,
              decoration: InputDecoration(hintText: 'Password'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(onPressed: saveUser, child: Text('Kaydol')),
                ElevatedButton(onPressed: loginUser, child: Text('Giriş Yap')),
                ElevatedButton(
                    onPressed: deleteUser, child: Text('Kullanıcı Sil')),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
