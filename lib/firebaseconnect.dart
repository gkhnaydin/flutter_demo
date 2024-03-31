import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class firebaseconnect extends StatelessWidget {
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
  State<Iskelet> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Iskelet> {
  TextEditingController nameInput = TextEditingController();
  TextEditingController surnameInput = TextEditingController();
  TextEditingController ageInput = TextEditingController();
  TextEditingController birthdateInput = TextEditingController();
  String name = "", surname = "", age = "", birthdate = "";

  add() {
    setState(() {
      name = nameInput.text;
      surname = surnameInput.text;
      age = ageInput.text;
      birthdate = birthdateInput.text;

      FirebaseFirestore.instance.collection("Yazilar").doc(name).set({
        'name': name,
        'surname': surname,
        'age': age,
        'birthdate': birthdate
      }).whenComplete(() => print('veri firabase yazildi.'));
    });
  }

  update() {
    setState(() {
      name = nameInput.text;
      surname = surnameInput.text;
      age = ageInput.text;
      birthdate = birthdateInput.text;

      FirebaseFirestore.instance.collection("Yazilar").doc(name).update({
        'name': name,
        'surname': surname,
        'age': age,
        'birthdate': birthdate
      }).whenComplete(() => print('veri firabase güncellendi.'));
    });
  }

  delete() {
    setState(() {
      name = nameInput.text;
      surname = surnameInput.text;
      age = ageInput.text;
      birthdate = birthdateInput.text;

      FirebaseFirestore.instance.collection("Yazilar").doc(name).delete();
    });
  }

  dataCall() {
    name = nameInput.text;
    FirebaseFirestore.instance.collection("Yazilar").get().then((value) {
      setState(() {
        print(value.docs);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
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
                    ElevatedButton(onPressed: dataCall, child: Text('Getir')),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
