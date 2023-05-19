import 'package:feedback_module/widgets/comment.dart';
import 'package:flutter/material.dart';

import '../dataproviders/post_data.dart';

class PostPage extends StatefulWidget {
  final String postId;
  const PostPage({super.key, required this.postId});

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  final comments = [];

  void initState() {
    super.initState();
    Firestore_post().fetchComments(widget.postId).then((posts) {
      posts.forEach((post) async {
        String? username = await Firestore_post()
            .fetchUsername(post.keys.toList()[0].toString());
        // print(post.keys);
        // print(post.values);
        // print("hello");
        comments.add([
          username,
          post.values,
        ]);
        print(comments[0]);
      });
    }).catchError((error) {
      print('Error fetching cars: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post Page"),
        ),
        body: Container(
          height: 300,
          child: ListView.builder(
              itemCount: comments.length,
              itemBuilder: (context, index) {
                return comment(
                    username: comments[index][0],
                    text: comments[index][1].toList()[0].toString());
                //print(comments[index]);
              }),
        ));
  }
}
