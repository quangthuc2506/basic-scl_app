import 'dart:convert';

class User {
  User({
    this.name,
    this.avatar,
    this.post,
    this.id,
  });

  String? name;
  String? avatar;
  List<Post>? post;
  dynamic id;
  factory User.fromJson(Map<String, dynamic> json) => User(
      name: json['name'],
      avatar: json['avatar'],
      post: List<Post>.from(json['post'].map((x)=>Post.fromJson(x))),
      id: json['id']);
}
List<User> usersListModelFromJson(String str){
  return List<User>.from(json.decode(str).map((x)=>User.fromJson(x)));
}

class Post {
  Post({
    this.title,
    this.image,
    this.like,
    this.comment,
  });

  String? title;
  String? image;
  int? like;
  List<Comment>? comment;
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        title: json["title"],
        image: json["image"],
        like: json["like"],
        comment: List<Comment>.from(json["comment"].map((x) => Comment.fromJson(x))),
    );
}

class Comment {
  Comment({
    this.commentcontent,
  });

  String? commentcontent;
  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        commentcontent: json["commentcontent"],
    );
}
