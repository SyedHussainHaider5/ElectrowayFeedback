import 'package:feedback_module/dataproviders/post_data.dart';
import 'package:flutter/material.dart';

class LikeButtonContainer extends StatefulWidget {
  final String text;
  final IconData icon;
  final String post_id;

  const LikeButtonContainer(
      {Key? key, required this.text, required this.icon, required this.post_id})
      : super(key: key);

  @override
  _LikeButtonContainerState createState() => _LikeButtonContainerState();
}

class _LikeButtonContainerState extends State<LikeButtonContainer> {
  bool isliked = false;
  Color iconColor = Colors.red;
  int likes = 0;

  // void updateLikes() {
  //   setState(() async {
  //     likes = await runOnce1();
  //   });
  // }

  void changeColor() {
    setState(() {
      isliked = !isliked;
    });
  }

  void changeLike() {
    setState(() {
      if (isliked == false) {
        Firestore_post().removeValueFromLikesField(widget.post_id, "123");
        likes--;
      } else {
        Firestore_post().addValueToLikesField(widget.post_id, "123");
        Firestore_post().addComment(widget.post_id,
            {"OWIUYldGNIef5xxLbuGibotYyuV2": "This is a comment4"});

        likes++;
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
      int _likes = await runOnce1();
      setState(() {
        functionExecuted = true;
        isliked = result;
        likes = _likes;
        print(isliked);
      });
    }
  }

  Future<bool> runOnce() async {
    return await Firestore_post().checkIfLiked(widget.post_id, "123");
  }

  Future<int> runOnce1() async {
    return await Firestore_post().countLikes(widget.post_id);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //widget.onPressed();
        changeColor();
        changeLike();
        //updateLikes();
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
              widget.text + ' $likes',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
