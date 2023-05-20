import "dart:ffi";

import "package:feedback_module/pages/New_Post_Page.dart";
import "package:feedback_module/widgets/post.dart";
import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:feedback_module/dataproviders/post_data.dart";

class feed_Page extends StatefulWidget {
  feed_Page({super.key});

  @override
  State<feed_Page> createState() => _feed_PageState();
}

class _feed_PageState extends State<feed_Page> {
  final _posts = [];

  void initState() {
    super.initState();
    Firestore_post().fetchPosts().then((posts) {
      posts.forEach((post) {
        setState(() {
          _posts.add([
            post['username'],
            post['email_id'],
            post['post_description'],
            post['likes'],
            post['post_id']
          ]);
        });
      });
    }).catchError((error) {
      print('Error fetching cars: $error');
    });
  }

  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("All Posts"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: [
          BottomNavigationBarItem(
            label: ('Favourite'),
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: ('Favourite'),
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: ('Favourite'),
            icon: Icon(Icons.search),
          ),
          BottomNavigationBarItem(
            label: ('Favourite'),
            icon: Icon(Icons.light),
          ),
        ],
      ),
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton.extended(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => New_Post_Page()),
              );
            },
            icon: Icon(Icons.add),
            label: Text("Create Post"),
          ),
        ),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(() {
            if (direction == ScrollDirection.reverse) {
              _showFab = false;
            } else if (direction == ScrollDirection.forward) {
              _showFab = true;
            }
          });
          return true;
        },
        child: ListView.builder(
            itemCount: _posts.length,
            itemBuilder: (context, index) {
              return post(
                  username: _posts[index][0],
                  email: _posts[index][1],
                  text: _posts[index][2],
                  likes: _posts[index][3].length,
                  post_id: _posts[index][4]);
            }),
      ),
      drawer: Drawer(),
    );
  }
}
