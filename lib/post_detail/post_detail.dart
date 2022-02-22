import 'package:flutter/material.dart';
import 'package:getx_api/model/model.dart';
import 'package:getx_api/post_detail/comment_detail.dart';
import 'package:get/get.dart';
class PostDetail extends StatefulWidget {
  PostDetail({Key? key,this.user,this.post,this.list}) : super(key: key);
  User? user;
  Post? post;
  var list;
  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool show = true;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                show = !show;
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.width,
                  child: Image.network(
                    widget.post!.image!,fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            ),
          ),
           Visibility(
             child: Positioned(
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, icon: const Icon(Icons.highlight_remove_outlined)),
              left: 0,
              top: 10,
                     ),
           ),
          Visibility(
            visible: show,
            child: Positioned(
              child: IconButton(
                  onPressed: () {
                    showDialog(context: context, builder: (context){
                      return SimpleDialog(
                        children: [
                          SimpleDialogOption(onPressed: (){
                            
                          },child:const Text("Edit"),),
                          SimpleDialogOption(onPressed: (){
                            widget.list.remove(widget.post);
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },child:const Text("Delete"),),
                        ],
                      );
                    });
                  }, icon: const Icon(Icons.more_horiz)),
              right: 0,
              top: 10,
            ),
          ),
          Visibility(
            visible: show,
            child: Positioned(
              left: 0,
              bottom: 0,
              right: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image:  DecorationImage(
                                  image: NetworkImage(
                                      widget.user!.avatar!),
                                  fit: BoxFit.cover)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Text(
                              widget.user!.name!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            const Text("16 tháng 2 lúc 14:15")
                          ],
                        )
                      ],
                    ),
                  ),
                   Padding(
                    padding:const EdgeInsets.only(left: 10),
                    child: Text(
                      widget.post!.title!,
                      style:const TextStyle(fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {},
                              icon: const Icon(Icons.favorite),
                              label: Text(widget.post!.like.toString()))
                        ],
                      ),
                      Row(
                        children: [
                          TextButton.icon(
                              onPressed: () {
                                showMyDialog(context,widget.post!.comment!);
                              },
                              icon: const Icon(Icons.mode_comment_rounded),
                              label: Text(widget.post!.comment!.length.toString()))
                        ],
                      )
                    ],
                  ),
                  const Divider(
                    height: 1,
                    thickness: 2,
                  ),
                  Row(
                    children: [
                      TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.favorite_border),
                          label: const Text("Like")),
                      const SizedBox(
                        width: 20,
                      ),
                      TextButton.icon(
                          onPressed: () {
                            
                            showMyDialog(context,widget.post!.comment!);
                          },
                          icon: const Icon(Icons.mode_comment_outlined),
                          label: const Text("Comments")),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
