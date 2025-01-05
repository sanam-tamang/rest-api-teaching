import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:restapicall/post_model.dart';

class Method2ApiCallWithFutureBuilder extends StatefulWidget {
  const Method2ApiCallWithFutureBuilder({super.key});

  @override
  State<Method2ApiCallWithFutureBuilder> createState() =>
      _Method2ApiCallWithFutureBuilderState();
}

class _Method2ApiCallWithFutureBuilderState
    extends State<Method2ApiCallWithFutureBuilder> {
  final url = "https://jsonplaceholder.org/posts";

  Future<List<Post>> getAllPost() async {
    try {
      final response = await Dio().get(url);
      if (response.statusCode == 200) {
        final data = response.data;
        final posts = List.from(data).map((e) => Post.fromMap(e)).toList();
        return posts;
      }
      return [];
    } catch (e) {
      throw "Something went wrong";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getAllPost(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              //data
              if (snapshot.hasData) {
                ///getting all posts from snapshot.data
                final posts = snapshot.data;

                ///showing posts in  ui
                return ListView.builder(
                    itemCount: posts?.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts![index].title),
                        subtitle: Text(posts[index].content),
                      );
                    });
              }
              //data end
              return Text(snapshot.error.toString());
            } else {
              return Text("Something went wrong!");
            }
          }),
    );
  }
}
