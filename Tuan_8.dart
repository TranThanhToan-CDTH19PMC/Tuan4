import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SignIn(),
    );
  }
}

class DescriptionTextWidget extends StatefulWidget {
  final String text;

  DescriptionTextWidget({required this.text});

  @override
  _DescriptionTextWidgetState createState() =>
      new _DescriptionTextWidgetState();
}

class _DescriptionTextWidgetState extends State<DescriptionTextWidget> {
  late String firstHalf;
  late String secondHalf;

  bool flag = true;

  @override
  void initState() {
    super.initState();

    if (widget.text.length > 50) {
      firstHalf = widget.text.substring(0, 50);
      secondHalf = widget.text.substring(50, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: secondHalf.isEmpty
          ? new Text(firstHalf)
          : new Column(
              children: <Widget>[
                new Text(flag ? (firstHalf + "...") : (firstHalf + secondHalf)),
                new InkWell(
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new Text(
                        flag ? "show more" : "show less",
                        style: new TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                  onTap: () {
                    setState(() {
                      flag = !flag;
                    });
                  },
                ),
              ],
            ),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final String description =
      "Flutter is Google’s mobile UI framework for crafting high-quality native interfaces on iOS and Android in record time. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source.";

  @override
  Widget build(BuildContext context) {
    Widget baiviet = Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Column(
        children: [
          Row(children: [
            Image.asset('../images/face.jpg', width: 30, height: 30),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Text(
                    "Đoàn Văn Thiện",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontFamily: 'RobotoMono'),
                  ),
                  Text("15 phút trước"),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 250),
              child: Row(
                children: [
                  Icon(Icons.more_horiz),
                ],
              ),
            ),
          ]),
          Container(
            child: DescriptionTextWidget(text: description),
          ),
          Image.asset(
            '../images/lake.jpg',
            width: 400,
            height: 300,
          ),
          Row(
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(Icons.sentiment_very_satisfied, color: Colors.yellow),
                    Text("41")
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 200),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("36 bình luận  "),
                    Text("6 lượt chia sẻ"),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.group)),
                Tab(icon: Icon(Icons.notifications_rounded)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ListView(
                children: [baiviet, baiviet, baiviet],
              ),
              Container(child: new Addfiend()),
              Container(child: new notification()),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Menu'),
                ),
                ListTile(
                  title: const Text('Profile'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FbCloneProfileStful()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Security'),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
                ListTile(
                    title: const Text('Sign Out'),
                    onTap: () {
                      Navigator.pop(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final myController1 = TextEditingController();
  final myController2 = TextEditingController();
  String user = '';
  String pass = '';
  @override
  Widget inconleft = Row(
    children: [
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.crop_din,
        size: 15,
      )
    ],
  );
  Widget iconright = Row(
    children: [
      Icon(
        Icons.crop_din,
        size: 15,
      ),
      Text("80%"),
      Image.asset("../images/battery.png", width: 15, height: 15)
    ],
  );

  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [inconleft, Text("4:02PM"), iconright],
          ),
          const Padding(
              padding: EdgeInsets.only(top: 120, bottom: 40),
              child: Icon(
                Icons.facebook,
                size: 100,
                color: Colors.blue,
              )),
          Text(
            "SignIn",
            textScaleFactor: 4,
          ),
          Text("Speak, friend, and enter"),
          Padding(
            padding: EdgeInsets.only(top: 70, bottom: 40),
            child: Column(
              children: [
                TextField(
                  controller: myController1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                  ),
                ),
                TextField(
                  controller: myController2,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                )
              ],
            ),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.black,
              primary: Colors.white,
              minimumSize: Size(200, 50),
            ),
            onPressed: () {
              pass = myController2.text;
              user = myController1.text;
              if (pass == '' || user == '') {
                showAlerDialog(context);
              } else if (pass == user) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TryAgain()),
                );
              }
              ;
            },
            child: Text('SIGN IN'),
          )
        ],
      ),
    );
  }

  showAlerDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Ok"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
        title: Text("Lỗi"),
        content: Text("vui lòng nhập đầy đủ thông tin "),
        actions: [
          okButton,
        ]);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}

class TryAgain extends StatelessWidget {
  TryAgain({Key? key}) : super(key: key);
  @override
  Widget inconleft = Row(
    children: [
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.circle_rounded,
        size: 15,
      ),
      Icon(
        Icons.crop_din,
        size: 15,
      )
    ],
  );
  Widget iconright = Row(
    children: [
      Icon(
        Icons.crop_din,
        size: 15,
      ),
      Text("80%"),
      Image.asset("../images/battery.png", width: 15, height: 15)
    ],
  );

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [inconleft, Text("4:02PM"), iconright],
          ),
          Padding(
            padding: EdgeInsets.only(top: 120),
          ),
          Image.asset("../images/crash.png"),
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Text(
            "UPS... couldn't Sign In",
            textScaleFactor: 2,
          ),
          Text('Your username and password dont macth.'),
          Text('Please, try again.'),
          Padding(
            padding: EdgeInsets.only(top: 100),
          ),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.black,
              primary: Colors.white,
              minimumSize: Size(200, 50),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('TRY AGAIN'),
          )
        ],
      ),
    );
  }
}
