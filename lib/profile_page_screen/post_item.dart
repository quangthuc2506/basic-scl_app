import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/model/model.dart';
import 'package:getx_api/post_detail/post_detail.dart';

class PostItem extends StatelessWidget {
  User? user;
  PostItem({this.user});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Post> listpost = user!.post!.obs;

    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 20),
      child: Obx(
        () => Column(
            children: listpost
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PostDetail(
                                          post: e,
                                          user: user,
                                          list: listpost,
                                        )));
                          },
                          child: Container(
                              width: (size.width - 60),
                              height: (size.width - 60),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: DecorationImage(
                                      image: NetworkImage(e.image!),
                                      fit: BoxFit.fitWidth))),
                        ),
                        Positioned(
                          bottom: 5,
                          left: 10,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.favorite, color: Colors.pink),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    e.like.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 5,
                          right: 10,
                          child: Row(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.comment, color: Colors.white),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    e.comment!.length.toString(),
                                    style: const TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
                .toList()),
      ),
    );
  }
}
