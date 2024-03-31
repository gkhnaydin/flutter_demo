import 'package:flutter/material.dart';

class emptyblogapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Uygulama Çerçevesi', home: Iskele());
  }
}

class Iskele extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Boş Uygulama Çerçevesi")),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  String blogyazisi = "Deneme blog yazısıdır.Lütfen dikkate almayınız.";

  yaziGoster() {
    setState(() {
      if (1 == 1) {
        blogyazisi = "Mart kapıdan baktırır kazma kürek yaktırır.";
      } else if (2 == 2) {
        blogyazisi = "Mart kapıdan baktırır kazma kürek yaktırır.";
      } else {
        blogyazisi = "Mart kapıdan baktırır kazma kürek yaktırır.";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(blogyazisi),
            ElevatedButton(
              onPressed: yaziGoster,
              child: Text('Mart Yazisi'),
            ),
            ElevatedButton(
              onPressed: yaziGoster,
              child: Text('Nisan Yazisi'),
            ),
            ElevatedButton(
              onPressed: yaziGoster,
              child: Text('Mayıs Yazisi'),
            ),
          ],
        ),
      ),
    );
  }
}
