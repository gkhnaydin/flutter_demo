import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:birlesmisprojeler/anasayfa.dart';

class Blogyazisi extends StatefulWidget {
  @override
  State<Blogyazisi> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Blogyazisi> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController surnameInput = TextEditingController();
  TextEditingController ageInput = TextEditingController();
  TextEditingController birthdateInput = TextEditingController();
  String name = "", surname = "", age = "", birthdate = "";

  FirebaseAuth auth = FirebaseAuth.instance;

  add() {
    setState(() {
      name = nameInput.text;
      surname = surnameInput.text;
      age = ageInput.text;
      birthdate = birthdateInput.text;

      FirebaseFirestore.instance.collection("Yazilar").doc(name).set({
        'useruid': auth.currentUser!.uid,
        'name': name,
        'surname': surname,
        'age': age,
        'birthdate': birthdate
      }).whenComplete(() => print('veri firabase yazildi.'));
    });
    clearInput();
  }

  update() {
    setState(() {
      name = nameInput.text;
      surname = surnameInput.text;
      age = ageInput.text;
      birthdate = birthdateInput.text;

      FirebaseFirestore.instance.collection("Yazilar").doc(name).update({
        'useruid': auth.currentUser!.uid,
        'name': name,
        'surname': surname,
        'age': age,
        'birthdate': birthdate
      }).whenComplete(() => print('veri firabase güncellendi.'));
    });
    clearInput();
  }

  delete() {
    setState(() {
      name = nameInput.text;
      surname = surnameInput.text;
      age = ageInput.text;
      birthdate = birthdateInput.text;

      FirebaseFirestore.instance.collection("Yazilar").doc(name).delete();
    });
    clearInput();
  }

  getListUsers() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => Anasayfa(),
        ),
        (route) => true); //appbar varsa geri otomatik olarak geri btn koyar.
    clearInput();
  }

  clearInput() {
    nameInput.clear();
    surnameInput.clear();
    ageInput.clear();
    birthdateInput.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Profil Sayfası"),
        ),
        body: Container(
          margin: EdgeInsets.all(75),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: nameInput,
                  decoration: InputDecoration(hintText: 'name'),
                ),
                TextFormField(
                  controller: surnameInput,
                  decoration: InputDecoration(hintText: 'surname'),
                ),
                TextFormField(
                  controller: ageInput,
                  decoration: InputDecoration(hintText: 'age'),
                ),
                TextFormField(
                  controller: birthdateInput,
                  decoration: InputDecoration(hintText: 'birthdate'),
                ),
                Divider(
                  indent: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(onPressed: add, child: Text('Add')),
                    ElevatedButton(onPressed: update, child: Text('Update')),
                    ElevatedButton(onPressed: delete, child: Text('Delete')),
                    ElevatedButton(
                        onPressed: getListUsers, child: Text('Getir')),
                  ],
                ),
                ListTile(
                  title: Text(name),
                  subtitle: Text(surname),
                )
              ],
            ),
          ),
        ));
  }
}
