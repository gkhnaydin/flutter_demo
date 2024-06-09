import 'package:flutter/material.dart';

class todoapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "TO-DO Uygulamasi Sayfa Baslik",
      home: Iskelet(),
    );
  }
}

class Iskelet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO-DO uygulamasi"),
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
  TextEditingController inputContr = TextEditingController();

  List alisverisList = [];

  addItemList() {
    setState(() {
      alisverisList.add(inputContr.text);
      clearInputControl();
    });
  }

  deleteItem() {
    setState(() {
      alisverisList.remove(inputContr.text);
      clearInputControl();
    });
  }

  removeItemLastAdded() {
    setState(() {
      alisverisList.removeLast();
      clearInputControl();
    });
  }

  clearItems() {
    setState(() {
      alisverisList.clear();
      clearInputControl();
    });
  }

  clearInputControl() {
    inputContr.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(100.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ListView.builder(
                  itemCount: alisverisList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      subtitle: Text("Alis veris listesi"),
                      title: Text(alisverisList[index]),
                      hoverColor: Color.fromARGB(24, 112, 114, 4),
                      trailing: const Icon(Icons.chevron_right),
                      leading: const Icon(Icons.chevron_left),
                      tileColor: Colors.amberAccent,
                      onTap: () {
                        print("tıklandı.");
                      },
                    );
                  }),
            ),
            Flexible(
              child: ListView.separated(
                itemCount: alisverisList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: Text("Alis veris listesi"),
                    title: Text(alisverisList[index]),
                    hoverColor: Color.fromARGB(24, 112, 114, 4),
                    trailing: const Icon(Icons.chevron_right),
                    leading: const Icon(Icons.chevron_left),
                    tileColor: Colors.grey.shade50,
                    onTap: () {
                      print("tıklandı.");
                    },
                  );
                },
                separatorBuilder: (context, index) {
                  return Divider();
                },
              ),
            ),
            TextField(
              controller: inputContr,
              onSubmitted: (value) => addItemList,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: addItemList,
                  child: Text('Ekle'),
                ),
                ElevatedButton(
                  onPressed: deleteItem,
                  child: Text('Sil'),
                ),
                ElevatedButton(
                  onPressed: removeItemLastAdded,
                  child: Text('Son Ekleneni Sil'),
                ),
                ElevatedButton(
                  onPressed: clearItems,
                  child: Text('Temizle'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
