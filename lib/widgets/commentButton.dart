import 'package:feedback_module/dataproviders/post_data.dart';
import 'package:flutter/material.dart';

class LikeButtonContainer extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final String post_id;

  const LikeButtonContainer(
      {Key? key,
      required this.text,
      required this.icon,
      required this.onPressed,
      required this.post_id})
      : super(key: key);

  @override
  _LikeButtonContainerState createState() => _LikeButtonContainerState();
}

class _LikeButtonContainerState extends State<LikeButtonContainer> {
  // String text = 'Like';
  bool isliked = false;
  Color iconColor = Colors.red;
  // bool isliked = Firestore_post().checkIfLiked(post_id, "skdlskdlsd");

  void updateLikes() {
    setState(() {
      // text = 'New Text';
    });
  }

  void changeColor() {
    setState(() {
      isliked = !isliked;
    });
  }

  void changeLike() {
    setState(() {
      if (isliked == false) {
        Firestore_post().removeValueFromLikesField(widget.post_id, "123");
      } else {
        Firestore_post().addValueToLikesField(widget.post_id, "123");
      }
    });
  }

  bool functionExecuted = false;

  @override
  void initState() {
    super.initState();
    executeOnce();
  }

  Future<void> executeOnce() async {
    if (!functionExecuted) {
      bool result = await runOnce();
      setState(() {
        functionExecuted = true;
        isliked = result;
        print(isliked);
      });
    }
  }

  Future<bool> runOnce() async {
    return await Firestore_post().checkIfLiked(widget.post_id, "123");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onPressed();
        changeColor();
        changeLike();
      },
      child: Container(
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 246, 245, 245),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              widget.icon,
              color: (isliked == true) ? Colors.red : Colors.grey,
              size: 15,
            ),
            SizedBox(width: 8.0),
            Text(
              widget.text + ' 2',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
