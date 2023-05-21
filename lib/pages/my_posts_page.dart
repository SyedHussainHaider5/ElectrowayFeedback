import 'package:feedback_module/widgets/postDelete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../dataproviders/post_data.dart';
import '../widgets/post.dart';
import 'New_Post_Page.dart';

class My_posts extends StatefulWidget {
  const My_posts({super.key});

  @override
  State<My_posts> createState() => _My_postsState();
}

class _My_postsState extends State<My_posts> {
  final _posts = [];

  void initState() {
    super.initState();
    Firestore_post().MyPosts("abc786").then((posts) {
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
      print('Error fetching posts: $error');
    });
  }

  bool _showFab = true;

  @override
  Widget build(BuildContext context) {
    const duration = Duration(milliseconds: 300);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("My Posts"),
        shadowColor: Colors.black,
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
              return postDelete(
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
