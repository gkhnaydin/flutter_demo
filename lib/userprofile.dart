import 'package:birlesmisprojeler/mainpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:birlesmisprojeler/blogyazisi.dart';

class userprofile extends StatefulWidget {
  String name = "", pass = "";

  userprofile({required this.name, required this.pass});
  ProfilPageWidgetState createState() {
    return ProfilPageWidgetState();
  }
}

class ProfilPageWidgetState extends State<userprofile> {
  singOut() {
    FirebaseAuth.instance.signOut().then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => Iskelet(),
          ),
          (route) => true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          FloatingActionButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Blogyazisi(),
                  ),
                  (route) =>
                      true); //appbar varsa geri otomatik olarak geri btn koyar.
            },
            child: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        child: AllUserInfo(),
      ),
    );
    /*return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ${widget.name} ${widget.pass}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Login Page"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Log Out"),
                )
              ],
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Blogyazisi(),
                    ),
                    (route) =>
                        true); //appbar varsa geri otomatik olarak geri btn koyar.
              },
              child: Icon(Icons.add),
            )
           AllUserInfo(context.widget.key),
          ],
        ),
      ),
    );*/
  }
}

class AllUserInfo extends StatelessWidget {
  Query userBlogs = FirebaseFirestore.instance
      .collection('Yazilar')
      .where('useruid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: userBlogs.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data =
                document.data()! as Map<String, dynamic>;
            return ListTile(
              title: Text(
                  data['name'] + ' ' + data['surname'] + ' ' + data['age']),
              subtitle: Text(data['birthdate']),
            );
          }).toList(),
        );
      },
    );
  }
}
