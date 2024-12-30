import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restapicall/detail_page.dart';
import 'package:restapicall/post_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    getAllPost();
  }

  Future<void> getAllPost() async {
    try {
      final response = await Dio().get("https://jsonplaceholder.org/posts");

      if (response.statusCode == 200) {
        final data = response.data;

        log(data.toString());
        posts = List.from(data).map((e) => Post.fromMap(e)).toList();
        setState(() {});
      }
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation testing"),
      ),
      body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailPage(index: index)));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(posts[index].title),
              ),
            );
          }),
    );
  }
}
