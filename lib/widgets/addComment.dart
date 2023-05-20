import 'package:feedback_module/pages/post_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../dataproviders/post_data.dart';

class addComment extends StatefulWidget {
  final String postId;
  final String username;
  final String email;
  final String text;
  final int likes;
  // final Map<String, dynamic> newValue;
  //final VoidCallback commentadded;
  const addComment(
      {super.key,
      required this.postId,
      required this.username,
      required this.email,
      required this.text,
      required this.likes});

  @override
  State<addComment> createState() => _addCommentState();
}

bool _isButtonEnabled = false;
bool success = false;

class _addCommentState extends State<addComment> {
  TextEditingController _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _textController.addListener(_validateTextField);
  }

  void _validateTextField() {
    setState(() {
      _isButtonEnabled =
          _textController.text.isNotEmpty && _textController.text.length > 5;
    });
  }

  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  String getText() {
    return _textController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          // CircleAvatar(
          //   backgroundColor: Colors.black,
          //   radius: 22,
          //   child: CircleAvatar(
          //     radius: 21,
          //     backgroundImage: AssetImage('assets/images/profile_image.png'),
          //   ),
          // ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: TextField(
              keyboardType: TextInputType.multiline,
              minLines: 1, //Normal textInputField will be displayed
              maxLength: 200,
              controller: _textController,
              decoration: InputDecoration(
                  hintText: "Write Comment..",
                  focusedBorder: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {
              _ShowAlertMethod(context, widget.postId, widget.username,
                  widget.email, widget.text, widget.likes);
              _isButtonEnabled
                  ? Firestore_post().addComment(widget.postId,
                      {'OWIUYldGNIef5xxLbuGibotYyuV2': _textController.text})
                  : null;

              _isButtonEnabled ? _textController.clear() : success = false;
            },
            icon: Icon(Icons.send),
            iconSize: 20.0,
          )
        ],
      ),
    );
  }
}

void _ShowAlertMethod(BuildContext context, String postId, String username,
    String email, String text, int likes) {
  var alert = AlertDialog(
    title: _isButtonEnabled
        ? Text('Posted!')
        : Text('Please fill the comments field properly!'),
    content: _isButtonEnabled
        ? Text("Dear user, your comment is successfully posted!")
        : null,
    actions: <Widget>[
      TextButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();

          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(
                    postId: postId,
                    username: username,
                    email: email,
                    text: text,
                    likes: likes)),
          );

          // _isButtonEnabled
          //     ? Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => PostPage(
          //                 postId: postId,
          //                 username: username,
          //                 email: email,
          //                 text: text,
          //                 likes: likes)),
          //       )
          //     : null;
        },
      )
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
