import 'package:feedback_module/widgets/addComment.dart';
import 'package:feedback_module/widgets/comment.dart';
import 'package:feedback_module/widgets/post.dart';
import 'package:flutter/material.dart';

import '../dataproviders/post_data.dart';

class PostPage extends StatefulWidget {
  final String postId;
  final String username;
  final String email;
  final String text;
  final int likes;

  const PostPage({
    super.key,
    required this.postId,
    required this.username,
    required this.email,
    required this.text,
    required this.likes,
  });

  @override
  State<PostPage> createState() => _PostPageState();
}

bool _isCommentAdded = false;

class _PostPageState extends State<PostPage> {
  final comments = [];

  void initState() {
    super.initState();
    Firestore_post().fetchComments(widget.postId).then((posts) async {
      for (final post in posts) {
        String? username = await Firestore_post()
            .fetchUsername(post.keys.toList()[0].toString());
        setState(() {
          comments.add([
            username,
            post.values,
          ]);
        });
      }
    }).catchError((error) {
      print('Error fetching comments: $error');
    });
  }

  void _commentAdded() {
    setState(() {
      _isCommentAdded = !_isCommentAdded;
    });
  }

  // void _commentadder() {
  //   setState(() {
  //     Firestore_post()
  //         .addComment(widget.postId, widget.); // Update the counter
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Post Page"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              post(
                  username: widget.username,
                  email: widget.email,
                  text: widget.text,
                  likes: widget.likes,
                  post_id: widget.postId),
              Container(
                height: 50,
                width: 500,
                color: Color.fromARGB(255, 246, 245, 245),
                // decoration: BoxDecoration(
                //   color: Colors.grey,
                //   borderRadius: BorderRadius.circular(20),
                // ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "  Comments",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ),
              // addComment(postId: widget.postId, newValue: {
              //   "OWIUYldGNIef5xxLbuGibotYyuV2": "This is a comment6"
              // }),
              SizedBox(
                  height: 100,
                  child: addComment(
                      postId: widget.postId,
                      username: widget.username,
                      email: widget.email,
                      text: widget.text,
                      likes: widget.likes)
                  // child: addComment(onIncrement: () {}),
                  ),
              Container(
                // color: Colors.grey,
                height: 335,
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: comments.length,
                    itemBuilder: (context, index) {
                      return comment(
                          username: comments[index][0],
                          text: comments[index][1].toList()[0].toString());
                      //print(comments[index]);
                    }),
              ),
            ],
          ),
        ));
  }
}
