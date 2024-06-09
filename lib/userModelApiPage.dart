import 'package:birlesmisprojeler/model/userModel.dart';
import 'package:birlesmisprojeler/service/userService.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class userMobilApiPage extends StatefulWidget {
  const userMobilApiPage({super.key});

  @override
  State<userMobilApiPage> createState() => _userMobilApiPageState();
}

class _userMobilApiPageState extends State<userMobilApiPage> {
  final userServices = userService();
  List<UserModelData?> users = [];

  @override
  void initState() {
    super.initState();
    userServices.fetchUsers().then((value) {
      if (value != null && value.data != null) {
        setState(() {
          users = value.data!;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api Deneme Testi'),
      ),
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(users[index]!.firstName! + users[index]!.lastName!),
              subtitle: Text(users[index]!.email!),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(users[index]!.avatar!),
              ),
            );
          }),
    );
  }
}
