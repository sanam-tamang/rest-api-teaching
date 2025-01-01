import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restapicall/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Post>> getAllPosts() async {
    final response = await Dio().get("https://jsonplaceholder.org/posts");
    if (response.statusCode == 200) {
      log(response.data[0].toString());
      final listOfMap = response.data;
      final posts = List.from(listOfMap).map((e) => Post.fromJson(e)).toList();
      return posts;
    } else {
      throw "Something went wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: getAllPosts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final List<Post>? posts = snapshot.data;
                  return ListView.builder(
                      itemCount: posts!.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return ListTile(
                          leading: Image.network(post.imageUrl,height: 50, width: 50,),
                          title: Text(post.title),
                          subtitle: Text(post.content),
                        );
                      });
                } else {
                  return Text("we got an error ${snapshot.error}");
                }
              } else {
                return Text("Something here is cooking");
              }
            }));
  }
}
