import "package:flutter/material.dart";

class New_Post_Page extends StatelessWidget {
  const New_Post_Page({super.key});

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
                    child: const Card(
                      child: TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1, //Normal textInputField will be displayed
                        maxLines: null,
                        //maxLength: 100, // when user presses enter it will adapt to it
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
                onPressed: () {},
                child: Text("Post"),
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
