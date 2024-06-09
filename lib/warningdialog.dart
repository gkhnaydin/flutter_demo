import 'package:flutter/material.dart';

class warningdialog extends StatefulWidget {
  @override
  State<warningdialog> createState() => _warningdialogState();
}

class _warningdialogState extends State<warningdialog> {
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

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
