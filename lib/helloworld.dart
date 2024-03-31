import 'package:flutter/material.dart';

class helloworld extends StatelessWidget {
  const helloworld({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Boş Uygulama Çerçevesi')),
      body: Container(child: Text('Merhaba Flutter')),
    );
  }
}
