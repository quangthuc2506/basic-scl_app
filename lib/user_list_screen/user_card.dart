import 'package:flutter/material.dart';
import 'package:getx_api/model/model.dart';
import 'package:getx_api/profile_page_screen/profile_page_screen.dart';

class UserCard extends StatelessWidget {
  UserCard({ Key? key,this.user }) : super(key: key);
  User? user;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfilePageScreen(user: user,)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          leading: Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.black)),
              child: Center(
                  child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: NetworkImage(user!.avatar!), fit: BoxFit.cover)),
              )),
            ),
          title: Text(user!.name!,style: TextStyle(fontWeight: FontWeight.bold),),
          
        ),
      ),
    );
  }
}