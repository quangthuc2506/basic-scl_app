import 'dart:convert';

import 'package:get/get.dart';
import 'package:getx_api/model/model.dart';
import 'package:http/http.dart' as http;

class getData extends GetxController {
  getData() {
    getUserData();
  }
  static var users = [].obs;
  static getUserData() async {
    try {
      final url =
          Uri.parse("https://620c9e47b573632593927e51.mockapi.io/users");
      final respone = await http.get(url);

      if (200 == respone.statusCode) {
        var us = usersListModelFromJson(respone.body);
        users.clear();
        for( var u in us){
          users.add(u);
        }
        
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
