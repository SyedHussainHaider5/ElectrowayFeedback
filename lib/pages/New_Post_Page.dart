import "package:feedback_module/dataproviders/post_data.dart";
import "package:feedback_module/pages/feed_page.dart";
import "package:flutter/material.dart";

class New_Post_Page extends StatefulWidget {
  const New_Post_Page({super.key});

  @override
  State<New_Post_Page> createState() => _New_Post_PageState();
}

bool _isButtonEnabled = false;

class _New_Post_PageState extends State<New_Post_Page> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Post here"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 20.0),
                child: Row(
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
                      padding: const EdgeInsets.symmetric(horizontal: 5),
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
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: SingleChildScrollView(
                  child: Container(
                    width: 317.0,
                    height: 350.0,
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black),
                        borderRadius: BorderRadius.all(Radius.circular(9))),
                    child: Card(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1, //Normal textInputField will be displayed
                        maxLength: 400,
                        controller: _textController,
                        decoration: InputDecoration(
                            hintText: "What's on your mind? write here..",
                            focusedBorder: InputBorder.none,
                            filled: true,
                            fillColor: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  _ShowAlertMethod(context);
                  _isButtonEnabled
                      ? Firestore_post().createPost(getText())
                      : null;
                  _isButtonEnabled ? _textController.clear() : null;
                },
                child: Text("Post Now!"),
                style: TextButton.styleFrom(minimumSize: Size(150, 40)),
              )
            ],
          )),
        ),
      ),
      drawer: Drawer(),
    );
  }
}

void _ShowAlertMethod(BuildContext context) {
  var alert = AlertDialog(
    title: _isButtonEnabled
        ? Text('Posted!')
        : Text('Please fill the post field properly!'),
    content: _isButtonEnabled
        ? Text("Dear user, your desired post is successfully posted!")
        : null,
    actions: <Widget>[
      TextButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => feed_Page()),
          );
        },
      )
    ],
  );
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      });
}
