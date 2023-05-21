import 'package:expandable/expandable.dart';
import 'package:feedback_module/pages/post_page.dart';
import 'package:feedback_module/widgets/likeButton.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class postImage extends StatefulWidget {
  final String username;
  final String email;
  final String text;
  final int likes;
  final String post_id;
  final String ImageURL;

  const postImage(
      {super.key,
      required this.username,
      required this.email,
      required this.text,
      required this.likes,
      required this.post_id,
      required this.ImageURL});

  @override
  State<postImage> createState() => _postImageState();
}

String imagename = "https://electroway-45be3.appspot.com/photos/1684705868626";

class _postImageState extends State<postImage> {
  void initState() {
    super.initState();
    runOnce();
  }

  void runOnce() async {
    Reference storageReference =
        await FirebaseStorage.instance.ref().child('photos/$widget.ImageURL');

    String downloadURL = await storageReference.getDownloadURL();
    print("heeloo");
    imagename = downloadURL;

    print(imagename);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 300,
        alignment: Alignment.center,
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 32,
                  child: CircleAvatar(
                    radius: 31,
                    backgroundImage:
                        AssetImage('assets/images/profile_image.png'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        //style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        widget.email,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      SizedBox(
                        height: 25,
                      )
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 200.00,
              height: 200.00,
              child: Image.network(
                  'https://electroway-45be3.appspot.com/photos/1684705868626'),

              // decoration: new BoxDecoration(
              //   image: new DecorationImage(
              //     image: NetworkImage(
              //         'https://googleflutter.com/sample_image.jpg'),
              //     //image: null,
              //     fit: BoxFit.fitHeight,
              //   ),
              // )
            ),
            SizedBox(
              height: 20,
            ),
            ExpandablePanel(
              collapsed: Text(
                widget.text,
                // style: TextStyle(fontSize: 13),
                style: Theme.of(context).textTheme.titleMedium,
              ),
              expanded: Text(
                widget.text,
                //style: TextStyle(fontSize: 13),
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // decoration: BoxDecoration(
              //     border: Border.all(width: 1, color: Colors.black),
              //     borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LikeButtonContainer(
                    text: "Like",
                    icon: Icons.favorite,
                    post_id: widget.post_id,
                  ),
                  //SizedBox(width: 100),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: Container(
                      color: Colors.grey,
                      width: 0.5,
                      height: 25,
                    ),
                  ),
                  // VerticalDivider(
                  //   color: Colors.black,
                  //   thickness: 2,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostPage(
                                postId: widget.post_id,
                                username: widget.username,
                                email: widget.email,
                                text: widget.text,
                                likes: widget.likes)),
                      );
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
                            Icons.add_comment,
                            color: Colors.grey,
                            size: 15,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            "Comment",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey, //color of divider
              height: 2, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 0, //spacing at the start of divider
              endIndent: 0, //spacing at the end of divider
            ),
          ],
        ),
      ),
    );
  }
}
