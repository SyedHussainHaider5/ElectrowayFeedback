import 'package:feedback_module/pages/complaint_page.dart';
import 'package:feedback_module/pages/feed_page.dart';
import 'package:feedback_module/pages/privacy_policy_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'pages/post_page.dart';
import 'package:flutter/material.dart';
import 'pages/New_Post_Page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: FeedPage(),
      theme: ThemeData(
          //primarySwatch: Colors.blueGrey,
          fontFamily: GoogleFonts.lato().fontFamily),
      routes: {
        "/": (context) => privacy_policy_page(),
        "/post": (context) => New_Post_Page()
      },
    );
  }
}
