import 'package:flutter/material.dart';

class mesajlasmaapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mesajlaşma Uygulaması v2",
      home: Iskelet(),
    );
  }
}

class Iskelet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mesajlaşma Uygulama v2"),
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  AnaEkranState createState() {
    return AnaEkranState();
  }
}

class AnaEkranState extends State<AnaEkran> {
  TextEditingController input = TextEditingController();
  List<MesajBalonu> mesajListesi = [];

  listeyeEkle(String message) {
    setState(() {
      MesajBalonu obj = MesajBalonu(message);
      mesajListesi.insert(0, obj);
      clearInput();
    });
  }

  clearInput() {
    input.clear();
  }

  Widget MetinGirisAlani() {
    return Container(
      margin: EdgeInsets.all(50),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              controller: input,
              onSubmitted: listeyeEkle,
            ),
          ),
          IconButton(
            onPressed: () => listeyeEkle(input.text),
            icon: Icon(Icons.send),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(50),
      child: Column(
        children: [
          Flexible(
              child: ListView.builder(
                  reverse: true,
                  itemCount: mesajListesi.length,
                  itemBuilder: (context, indeks) {
                    return mesajListesi[indeks];
                  })),
          Divider(
            thickness: 1,
          ),
          MetinGirisAlani(),
        ],
      ),
    );
  }
}

String isim = "Kullanici1";

class MesajBalonu extends StatelessWidget {
  String mesaj = "";

  MesajBalonu(String tt) {
    this.mesaj = tt;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(
              isim[0],
            ),
          ),
          Column(
            children: [
              Text(isim),
              Text(mesaj),
            ],
          ),
        ],
      ),
    );
  }
}
