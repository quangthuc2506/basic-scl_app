import 'package:flutter/material.dart';
import 'package:getx_api/model/model.dart';

Future<void> showMyDialog(context, List<Comment> cmt) async {
  Size size = MediaQuery.of(context).size;
  return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: EdgeInsets.only(left: 0, top: size.height * 0.4),
          child: Container(
            child: Stack(children: [
              Column(
                children: [
                  const Text(
                    "Comments",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Divider(),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                        children: cmt
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          image: const DecorationImage(
                                              image: NetworkImage(
                                                  "https://images.pexels.com/photos/1382731/pexels-photo-1382731.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940"),
                                              fit: BoxFit.cover)),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ngoc Anh",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        Text(e.commentcontent!)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                            .toList()),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  padding:const EdgeInsets.all(5),
                  height: 50,
                  width: size.width,
                  child: TextFormField(
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(10.0)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.blue)),
                        hintText: "add comment",
                        suffixIcon: const Icon(
                          Icons.send,
                          color: Colors.blue,
                        )),
                  ),
                ),
              )
            ]),
          ),
        );
      });
}
