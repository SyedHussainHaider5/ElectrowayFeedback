import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class addComment extends StatefulWidget {
  final String postId;
  final Map<String, dynamic> newValue;
  const addComment({super.key, required this.postId, required this.newValue});

  @override
  State<addComment> createState() => _addCommentState();
}

bool _isButtonEnabled = false;

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
            onPressed: () {},
            icon: Icon(Icons.send),
            iconSize: 20.0,
          )
        ],
      ),
    );
  }
}
