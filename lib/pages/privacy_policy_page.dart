import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class privacy_policy_page extends StatefulWidget {
  const privacy_policy_page({super.key});

  @override
  State<privacy_policy_page> createState() => _privacy_policy_pageState();
}

class _privacy_policy_pageState extends State<privacy_policy_page> {
  /////////////////////
  late ScrollController _scrollController;
  bool _showButton = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        if (_scrollController.offset >= 200) {
          setState(() {
            _showButton = true;
          });
        } else {
          setState(() {
            _showButton = false;
          });
        }
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _moveToTop() {
    _scrollController.animateTo(0,
        duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
  ////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy"),
        centerTitle: true,
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 10,
            ),
            Text("PRIVACY POLICY",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
            Text(
                "\nThis page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data."),
            Text(
                "\nWe use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy."),
            Text("\nInformation Collection and Use",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Text(
                "\nWe collect several types of information for various purposes to provide and improve our Service to you."),
            Text("\nTypes of Data Collected",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            Text("\n* Personal Data"),
            Text(
                '\nWhen you use our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:'),
            Text(
                "\n* Email address\n* First name and last name\n* Phone number\n* Address, State, Province, ZIP/Postal code, City\n* Cookies and Usage Data"),
            Text("\nUsage Data",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            Text(
                '\nWe may also collect information that your browser sends whenever you visit our Service or when you access the Service by or through a mobile device ("Usage Data").'),
            Text(
                "\nThis Usage Data may include information such as your computer's Internet Protocol address (e.g. IP address), browser type, browser version, the pages of our Service that you visit, the time and date of your visit, the time spent on those pages, unique device identifiers and other diagnostic data."),
            Text(
                "\nWhen you access the Service by or through a mobile device, this Usage Data may include information such as the type of mobile device you use, your mobile device unique ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browser you use, unique device identifiers and other diagnostic data."),
            Text("\nTracking & Cookies Data",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            Text(
                "\nWe use cookies and similar tracking technologies to track the activity on our Service and hold certain information."),
            Text(
                "\nCookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags, and scripts to collect and track information and to improve and analyze our Service."),
            Text(
                "\nYou can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service."),
            Text("\nUse of Data",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            Text("\nWe use the collected data for various purposes:"),
            Text(
                "\n* To provide and maintain the Service\n* To notify you about changes to our Service\n* To allow you to participate in interactive features of our Service when you choose to do so\n* To provide customer care and support\n* To provide analysis or valuable information so that we can improve the Service\n* To monitor the usage of the Service\n* To detect, prevent and address technical issues"),
            Text("\nTransfer of Data",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            Text(
                "\nYour information, including Personal Data, may be transferred to - and maintained on - computers located outside of your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from your jurisdiction."),
            Text(
                "\nIf you are located outside [insert country name] and choose to provide information to us, please note that we transfer the data, including Personal Data, to [insert country name] and process it there."),
            Text(
                "\nYour consent to this Privacy Policy followed by your submission of such information represents your agreement to that transfer."),
            Text("\nDisclosure of Data",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            Text(
                "\nWe may disclose your Personal Data in the good faith belief that such action is necessary to:"),
            Text(
                "\n* To comply with a legal obligation\n* To protect and defend the rights\n* To prevent or investigate possible wrongdoing in connection with the Service"),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: FloatingActionButton(
                onPressed: _moveToTop,
                child: Icon(
                  Icons.arrow_upward,
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
