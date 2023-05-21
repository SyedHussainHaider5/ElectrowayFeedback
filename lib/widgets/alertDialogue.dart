import 'package:feedback_module/dataproviders/post_data.dart';
import 'package:feedback_module/pages/my_posts_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Alert_Dialogue {
  Future<void> showMyDialog(BuildContext context, String post_id) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Post'),
          content: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Text('Are you sure, You want to delete this post?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Confirm'),
              onPressed: () async {
                print('Confirmed');
                await Firestore_post().deletePost(post_id);
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => My_posts()));
              },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
