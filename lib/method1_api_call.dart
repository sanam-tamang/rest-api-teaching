

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restapicall/post_model.dart';

class Method1APICall extends StatefulWidget {
  const Method1APICall({super.key});

  @override
  State<Method1APICall> createState() => _Method1APICallState();
}

class _Method1APICallState extends State<Method1APICall> {
  final url = "https://jsonplaceholder.org/posts";
  Post? post;
  Future<void> getAllPosts() async {

    final response = await Dio().get(url);
    if (response.statusCode == 200) {
     
      setState(() {
         post = Post.fromMap(response.data[0]);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API call"),
      ),
      body:post==null?CircularProgressIndicator(): Text(post!.title) ,
    );
  }
}
