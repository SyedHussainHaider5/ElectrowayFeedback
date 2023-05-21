import "dart:io";

import "package:feedback_module/dataproviders/post_data.dart";
import "package:feedback_module/pages/feed_page.dart";
import "package:firebase_storage/firebase_storage.dart";
import "package:flutter/material.dart";
import "package:image_picker/image_picker.dart";

class New_Post_Page extends StatefulWidget {
  const New_Post_Page({super.key});

  @override
  State<New_Post_Page> createState() => _New_Post_PageState();
}

bool _isButtonEnabled = false;
String? imageurl = "";
bool _photoUploaded = false;
late File file;
late String fileName;
TextEditingController _textController = TextEditingController();

class _New_Post_PageState extends State<New_Post_Page> {
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
              _photoUploaded
                  ? Container(
                      width: 60.0,
                      height: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _photoUploaded = false;
                            imageurl = "";
                          });
                        },
                        icon: Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 32.0,
                        ),
                      ),
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        final picker = ImagePicker();
                        final pickedFile =
                            await picker.pickImage(source: ImageSource.gallery);

                        if (pickedFile != null) {
                          file = File(pickedFile.path);
                          fileName =
                              DateTime.now().millisecondsSinceEpoch.toString();
                        }
                        setState(() {
                          imageurl = fileName;
                          if (imageurl == null) {
                            _photoUploaded = false;
                          } else {
                            _photoUploaded = true;
                          }
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 12.0, horizontal: 16.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, size: 20.0),
                          SizedBox(width: 8.0),
                          Text('Upload photo'),
                        ],
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
                      ? Firestore_post().createPost(getText(), imageurl)
                      : null;
                  if (_isButtonEnabled && imageurl != "") {
                    Reference storageRef = FirebaseStorage.instance
                        .ref()
                        .child('photos/$fileName');
                    UploadTask uploadTask = storageRef.putFile(file);
                  }
                  // _isButtonEnabled ? _textController.clear() : null;
                  _isButtonEnabled
                      ? setState(() {
                          _photoUploaded = false;
                        })
                      : null;
                },
                child: Text("Post Now!"),
                style: TextButton.styleFrom(minimumSize: Size(300, 40)),
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
          if (_isButtonEnabled) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => feed_Page()),
            );
            _textController.clear();
          } else {
            _textController.clear();
          }
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
