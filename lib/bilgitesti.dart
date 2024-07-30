import 'dart:collection';

import 'package:bilgi_testi/constants.dart';
import 'package:bilgi_testi/soru.dart';
import 'package:bilgi_testi/test_veri.dart';
import 'package:flutter/material.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: SoruSayfasi(),
            ))));
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  TestVeri testVeri = TestVeri();

  addFail() {
    setState(() {
      if (testVeri.getSoruYaniti() == false) {
        secimler.add(dogruIcon);
      } else {
        secimler.add(yanlisIcon);
      }

      if (testVeri.getSoruIndex() == (testVeri.getSoruBoyut() - 1)) {
        _showMyDialog();
      } else {
        testVeri.sonrakiSoru();
      }
    });
  }

  addSucces() {
    setState(() {
      if (testVeri.getSoruYaniti() == true) {
        secimler.add(dogruIcon);
      } else {
        secimler.add(yanlisIcon);
      }

      if (testVeri.getSoruIndex() == (testVeri.getSoruBoyut() - 1)) {
        _showMyDialog();
      } else {
        testVeri.sonrakiSoru();
      }
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('BRAVO TESTİ BİTİRDİNİZ'),
          content: const SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Son soruya geldiniz!'),
                Text('Tekrar başa dönmek istiyor musunuz?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Hayır'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Evet'),
              onPressed: () {
                setState(() {
                  testVeri.indexClear();
                  secimler.clear();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                testVeri.getSoruMetni(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          children: secimler,
          spacing: 5,
          runSpacing: 5,
        ),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: ElevatedButton(
                          /*padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.red[400],*/
                          child: Icon(
                            Icons.thumb_down,
                            color: Colors.red[400],
                            size: 30.0,
                          ),
                          onPressed: () {
                            addFail();
                          },
                        ))),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 6),
                    child: ElevatedButton(
                      /*padding: EdgeInsets.all(12),
                          textColor: Colors.white,
                          color: Colors.green[400],*/
                      child: Icon(
                        Icons.thumb_up,
                        size: 30.0,
                        color: Colors.green[400],
                      ),
                      onPressed: () {
                        addSucces();
                      },
                    ),
                  ),
                ),
              ])),
        )
      ],
    );
  }
}
