import 'package:flutter/material.dart';
import 'package:getx_api/repo/repo.dart';
import 'package:get/get.dart';
import 'package:getx_api/user_list_screen/user_card.dart';

class UserListScreen extends StatelessWidget {
   UserListScreen({Key? key}) : super(key: key);
   getData getdata = getData();
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "User List",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w700, fontSize: 25),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Obx(
          () => ListView(
            padding: EdgeInsets.all(10),
            children: 
              getData.users.map((e) => UserCard(user: e,)).toList()
            ,
          ),
        ),
      ),
    );
  }
}
