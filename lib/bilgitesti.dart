import 'dart:collection';

import 'package:bilgi_testi/constants.dart';
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
  List<String> sorular = [
    'Titanic gelmiş geçmiş en büyük gemidir',
    'Dünyadaki tavuk sayısı insan sayısından fazladır',
    'Kelebeklerin ömrü bir gündür',
    'Dünya düzdür',
    'Kaju fıstığı aslında bir meyvenin sapıdır',
    'Fatih Sultan Mehmet hiç patates yememiştir',
    'Fransızlar 80 demek için, 4 * 20 der'
  ];

  List<bool> cevaplar = [false, true, false, false, true, true, true];

  int soruIndex = 0;

  addFail() {
    setState(() {
      if (cevaplar[soruIndex] == false) {
        secimler.add(dogruIcon);
      } else {
        secimler.add(yanlisIcon);
      }

      if (soruIndex == 6) {
        soruIndex = 0;
        secimler.clear();
      }
      soruIndex++;
    });
  }

  addSucces() {
    setState(() {
      if (cevaplar[soruIndex] == true) {
        secimler.add(dogruIcon);
      } else {
        secimler.add(yanlisIcon);
      }

      if (soruIndex == 6) {
        soruIndex = 0;
        secimler.clear();
      }
      soruIndex++;
    });
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
                sorular[soruIndex],
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
