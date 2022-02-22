import 'package:flutter/material.dart';
import 'package:getx_api/model/model.dart';
import 'package:getx_api/profile_page_screen/post_item.dart';

class ProfilePageScreen extends StatelessWidget {
  ProfilePageScreen({Key? key, this.user}) : super(key: key);
  User? user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        child: getAppBar(user!),
        preferredSize: Size.fromHeight(160),
      ),
      body: getBody(size),
    );
  }

  Widget getBody(Size size) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_a_photo),
                label: Text("New post")),
          ),
          PostItem(user: user),
          
        ],
      ),
    );
  }

  Widget getAppBar(User user) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.lightGreen,
      flexibleSpace: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.black)),
              child: Center(
                  child: Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: NetworkImage(user.avatar!), fit: BoxFit.cover)),
              )),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              user.name!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
