import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class comment extends StatelessWidget {
  final String username;
  final String text;
  const comment({super.key, required this.username, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 22,
                    child: CircleAvatar(
                      radius: 21,
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
                          username,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        // Text(
                        //   email,
                        //   style: Theme.of(context).textTheme.bodySmall,
                        // ),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ExpandablePanel(
                  collapsed: Text(
                    text,
                    style: TextStyle(fontSize: 13),
                  ),
                  expanded: Text(
                    text,
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Divider(
              //   color: Colors.grey, //color of divider
              //   height: 2, //height spacing of divider
              //   thickness: 1, //thickness of divier line
              //   indent: 20, //spacing at the start of divider
              //   endIndent: 20, //spacing at the end of divider
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     LikeButtonContainer(
              //       text: "Like",
              //       icon: Icons.favorite,
              //       post_id: post_id,
              //       //onPressed: () {}
              //     ),
              //     // Text(
              //     //   "Like + $likes",
              //     //   style: Theme.of(context).textTheme.bodySmall,
              //     // ),
              //     SizedBox(width: 100),
              //     IconButton(
              //         onPressed: () => {},
              //         icon: Icon(Icons.comment_bank),
              //         iconSize: 15.0),
              //     Text(
              //       "Comment",
              //       style: Theme.of(context).textTheme.bodySmall,
              //     )
              //   ],
              // ),
              // Divider(
              //   color: Colors.grey, //color of divider
              //   height: 2, //height spacing of divider
              //   thickness: 1, //thickness of divier line
              //   indent: 20, //spacing at the start of divider
              //   endIndent: 20, //spacing at the end of divider
              // ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
