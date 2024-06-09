import 'dart:convert';
import 'package:birlesmisprojeler/model/userModel.dart';
import 'package:http/http.dart' as http;

// ignore: camel_case_types
class userService {
  final String url = 'https://reqres.in/api/users?page=2';

  Future<UserModel?> fetchUsers() async {
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonBody = UserModel.fromJson(json.decode(response.body));
      return jsonBody;
    } else {
      print('Hata oluştu : ${response.statusCode}');
    }
  }
}
