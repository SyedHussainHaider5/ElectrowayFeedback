import 'package:feedback_module/dataproviders/complaint_data.dart';
import 'package:flutter/material.dart';

class complaint_page extends StatefulWidget {
  const complaint_page({super.key});

  @override
  State<complaint_page> createState() => _complaint_pageState();
}

bool _isButtonEnabled = false;

class _complaint_pageState extends State<complaint_page> {
  ////////////////////////////////////////////////// State changing and validation check on text field
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

//////////////////////////////////////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Complaint Page"),
        centerTitle: true,
      ),
      drawer: Drawer(),
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
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Having any issues?\ntell us now!",
                style: TextStyle(fontSize: 27),
              ),
            ),
          ),
          SizedBox(height: 20),
          Divider(
            color: Colors.black, //color of divider
            height: 2, //height spacing of divider
            thickness: 1, //thickness of divier line
            indent: 20, //spacing at the start of divider
            endIndent: 20, //spacing at the end of divider
          ),
          Text(
            "COMPLAINT BOX",
            style: TextStyle(color: Colors.blue),
          ),
          Divider(
            color: Colors.black, //color of divider
            height: 2, //height spacing of divider
            thickness: 1, //thickness of divier line
            indent: 20, //spacing at the start of divider
            endIndent: 20, //spacing at the end of divider
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: SingleChildScrollView(
              child: Container(
                width: 317.0,
                height: 350.0,
                //color: Colors.blue,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
                child: Card(
                  child: TextField(
                    maxLength: 200,
                    keyboardType: TextInputType.multiline,
                    minLines: 1, //Normal textInputField will be displayed
                    maxLines: null,
                    //maxLength: 100, // when user presses enter it will adapt to it
                    controller: _textController,
                    decoration: InputDecoration(
                        hintText: "Enter your Complaint here...",
                        focusedBorder: InputBorder.none,
                        filled: true,
                        fillColor: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _ShowAlertMethod(context);
              ////////checking firebase
              Firestore_complaint().fetchCars().then((cars) {
                cars.forEach((car) {
                  print(
                      'Brand: ${car['brand']}, Model: ${car['model']}, Company: ${car['company']}');
                });
              }).catchError((error) {
                print('Error fetching cars: $error');
              });
              //////////////////////////
              _isButtonEnabled
                  ? Firestore_complaint().createComplaint(getText())
                  : null;
              _isButtonEnabled ? _textController.clear() : null;
            },
            child: Text("Send Complaint"),
            style: TextButton.styleFrom(minimumSize: Size(150, 40)),
          )
        ],
      )),
    );
  }
}

void _ShowAlertMethod(BuildContext context) {
  var alert = AlertDialog(
    title: _isButtonEnabled
        ? Text('Complaint Registered!')
        : Text('Please fill the complain field properly!'),
    content: _isButtonEnabled
        ? Text(
            "Dear user, your complaint is registered successfully and you will be contacted by our team, shortly!")
        : null,
    actions: <Widget>[
      TextButton(
        child: Text('OK'),
        onPressed: () {
          Navigator.of(context).pop();
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
