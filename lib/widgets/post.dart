import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class post extends StatelessWidget {
  final String username;
  final String email;
  final String text;

  const post(
      {super.key,
      required this.username,
      required this.email,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      alignment: Alignment.center,
      // decoration: const BoxDecoration(
      //   boxShadow: [
      //     BoxShadow(
      //       color: Color.fromARGB(255, 202, 213, 226),
      //       spreadRadius: 2,
      //       offset: Offset(0, 0),
      //     ),
      //   ],
      // ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        'Syed Hussain Haider',
                        //style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        'syedhussainhaider5@gmail.com',
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
            ExpandablePanel(
              collapsed: Text(
                text,
                style: TextStyle(fontSize: 13),
              ),
              expanded: Text(
                text,
                style: TextStyle(fontSize: 13),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: Colors.grey, //color of divider
              height: 2, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 20, //spacing at the start of divider
              endIndent: 20, //spacing at the end of divider
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => {},
                  icon: Icon(Icons.favorite),
                  iconSize: 15.0,
                ),
                Text(
                  "Like",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(width: 100),
                IconButton(
                    onPressed: () => {},
                    icon: Icon(Icons.comment_bank),
                    iconSize: 15.0),
                Text(
                  "Comment",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            Divider(
              color: Colors.grey, //color of divider
              height: 2, //height spacing of divider
              thickness: 1, //thickness of divier line
              indent: 20, //spacing at the start of divider
              endIndent: 20, //spacing at the end of divider
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
