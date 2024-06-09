import 'dart:convert';
import 'package:birlesmisprojeler/model/loadData.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<LoadData> fetchCall() async {
  var response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

  if (response.statusCode == 200) {
    return LoadData.fromJson(json.decode(response.body));
  } else {
    throw Exception('Hata oluştu!');
  }
}

class getJsonData extends StatefulWidget {
  @override
  State<getJsonData> createState() => getJsonDataState();
}

class getJsonDataState extends State<getJsonData> {
  late Future<LoadData> futureApiCall;
  @override
  void initState() {
    super.initState();
    futureApiCall = fetchCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<LoadData>(
      future: futureApiCall,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: Text(
                "userId: ${snapshot.data?.userId} title: ${snapshot.data?.title}"),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        } else {
          /*return Center(
            child: Text('Veriler yüklenemedi!'),
          );*/
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ));
  }
}
