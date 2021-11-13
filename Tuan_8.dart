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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Setting()),
                    );
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
class Addfiend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Lời mời kết bạn",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          const Divider(
            color: Colors.grey,
            indent: 20,
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat.jpg'),
            ),
            title: Text(
              "Wibu",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "43 bạn chung",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                    minimumSize: Size(100, 50),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    )),
                onPressed: () {},
                child: Text("chấp nhận"),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                    minimumSize: Size(100, 50),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    )),
                onPressed: () {},
                child: Text("xoá"),
              ),
            ],
          ),
          const Divider(
            color: Colors.grey,
            indent: 20,
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat.jpg'),
            ),
            title: Text(
              "Wibu",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "43 bạn chung",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                    minimumSize: Size(100, 50),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    )),
                onPressed: () {},
                child: Text("chấp nhận"),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    primary: Colors.white,
                    minimumSize: Size(100, 50),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    )),
                onPressed: () {},
                child: Text("xoá"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
class FbCloneProfileStful extends StatefulWidget {
  _FbCloneProfileState createState() => _FbCloneProfileState();
}

class _FbCloneProfileState extends State<FbCloneProfileStful> {
  @override
  Widget build(BuildContext cx) {
    return new Scaffold(
      appBar: null,
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              Container(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  overflow: Overflow.visible,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            height: 200.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('../images/cat.jpg'))),
                          ),
                        )
                      ],
                    ),
                    Positioned(
                      top: 100.0,
                      child: Container(
                        height: 190.0,
                        width: 190.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('../images/cat.jpg'),
                            ),
                            border:
                                Border.all(color: Colors.white, width: 6.0)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                height: 130.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Thanh Toàn',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 28.0),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Container(
                  child: Text(
                'Signbox software',
                style: TextStyle(fontSize: 18.0),
              )),
              SizedBox(
                height: 10.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.collections, color: Colors.blueAccent),
                        Text(
                          'following',
                          style: TextStyle(color: Colors.blueAccent),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.message, color: Colors.black),
                        Text(
                          'Message',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.more_vert, color: Colors.black),
                          onPressed: () {
                            _showMoreOption(cx);
                          },
                        ),
                        Text(
                          'More',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Founder and CEO at',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'SignBox',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.work),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Works at',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'SignBox',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.school),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Studied Computer Science at',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Text(
                          'Abc University',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.home),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Lives in',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Pakistan',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.location_on),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'From',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Lahore',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.list),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'Followed by',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '100K people',
                          style: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('see more about Mohsin'),
                        ),
                      ],
                    ),
                    Container(
                      height: 10.0,
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Photos',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Card(
                                child: Image.asset('../images/xebus.jpg'),
                              )),
                              Expanded(
                                  child: Card(
                                child: Image.asset('../images/xebus.jpg'),
                              ))
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Expanded(
                                  child: Card(
                                child: Image.asset('../images/xebus.jpg'),
                              )),
                              Expanded(
                                  child: Card(
                                child: Image.asset('../images/xebus.jpg'),
                              )),
                              Expanded(
                                  child: Card(
                                child: Image.asset('../images/xebus.jpg'),
                              ))
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  _showMoreOption(cx) {
    showModalBottomSheet(
      context: cx,
      builder: (BuildContext bcx) {
        return new Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.feedback,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Give feedback or report this profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.block,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Block',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.link,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Copy link to profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    'Search Profile',
                    style: TextStyle(fontSize: 18.0),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

// thông báo
class notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Thông Báo",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              // do something
            },
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(0),
        children: [
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat.jpg'),
            ),
            title: Text(
              "Wibu đã đăng 1 tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "30 phút trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat2.jpg'),
            ),
            title: Text(
              "Mi đã đăng một tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "2 tiếng trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat3.jpg'),
            ),
            title: Text(
              "Tàu hủ đã đăng một tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "1 phút trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat4.jpg'),
            ),
            title: Text(
              "Lisa đã đăng một tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "7 phút trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat5.jpg'),
            ),
            title: Text(
              "Kevin đã đăng một tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "3 phút trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat6.jpg'),
            ),
            title: Text(
              "Mimi đã đăng một tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "5 tiếng trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat7.jpg'),
            ),
            title: Text(
              "anna đã đăng một tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "3 tiếng trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
          ListTile(
            selected: true,
            leading: CircleAvatar(
              backgroundImage: AssetImage('../images/cat8.jpg'),
            ),
            title: Text(
              "Elizabeth đã đăng một tin",
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              "1 phút trước",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
//====== Setting ======//
class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            ' Cài đặt & quyền riêng tư',
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 15),
            textAlign: TextAlign.justify,
          ),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Colors.black,
            ),
            onPressed: () {},
          ),
          actions: [
            Icon(
              Icons.search,
              color: Colors.black,
            ),
          ],
        ),
        body: Center(
          child: _buildList(),
        ),
      ),
    );
  }
}

Widget _buildList() {
  return ListView(
    children: [
      Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          'Tài khoản',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
      Container(
        child: Text(
          'Cập nhật thông tin để góp phần bảo vệ tài khoản.',
          style: TextStyle(color: Colors.black, fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ),
      _tile(
          'Thông tin cá nhân và tài khoản', Icons.account_circle_outlined),
      _tile('Mật khẩu và bảo mật', Icons.security_sharp),
      _tile('Thanh toán', Icons.payments_sharp),

      //===================//
      const Divider(
        color: Colors.grey,
        indent: 20,
        endIndent: 20,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          'Tùy chọn',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
      Container(
        child: Text(
          'Tùy chỉnh trải nghiệm của bãn trên Facebook.',
          style: TextStyle(color: Colors.black, fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ),
      _tile('Bảng tin', Icons.post_add),
      _tile('Tùy chọn về cảm xúc', Icons.view_list_sharp),
      _tile('Thông báo', Icons.notifications),
      _tile('Bảo xem trước tin nhắn', Icons.messenger),
      _tile('Lối tắc', Icons.lock),
      _tile('Ngôn ngữ và khu vực', Icons.language),
      _tile('File phương tiện', Icons.file_copy_sharp),
      _tile('Thời gian bạn ở trên Facebook', Icons.lock_clock),
      _tile('Chế độ tối', Icons.dark_mode),

      //===================//
      const Divider(
        color: Colors.grey,
        indent: 20,
        endIndent: 20,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          'Đối tượng và chế độ hiển thị',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
      Container(
        child: Text(
          'Kiểm soát ai có thể xem bài viết, tin và trang cá nhân của bạn.',
          style: TextStyle(color: Colors.black, fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ),
      _tile('Thông tin trên trang cá nhân', Icons.account_circle_outlined),
      _tile('Cách mọi người tìm và liên hệ với bạn',
          Icons.account_balance_outlined),
      _tile('Bài viết', Icons.post_add_sharp),
      _tile('Tin', Icons.message),
      _tile('Người theo dõi và nội dung công khai', Icons.follow_the_signs),
      _tile('Trang cá nhân và gắn thẻ', Icons.tag_faces),
      _tile('Chặn', Icons.block),
      _tile('Trạng thái hoạt động', Icons.account_circle),

//===================//
      const Divider(
        color: Colors.grey,
        indent: 20,
        endIndent: 20,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          'Quyền',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
      Container(
        child: Text(
          'Quản lý thông tin nào mà Facebook có thể dùng để cải thiện trải nghiệm của bạn, chẳng hạn như sở thích hoặc vị trí.',
          style: TextStyle(color: Colors.black, fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ),
      _tile('Tùy chọn quảng cáo', Icons.event_available_outlined),
      _tile('Vị trí', Icons.place),
      _tile('Nhận dạng khuôn mặt', Icons.account_box_outlined),
      _tile('Ứng dụng và trang web', Icons.app_registration),
      _tile('Game', Icons.games),
      _tile('Tiện ích tích hợp cho doang nghiệp', Icons.extension),
      _tile('Tải danh bạ lên', Icons.phone_android),
      _tile('Trình duyệt', Icons.browser_not_supported),
      _tile('Hoạt động bên ngoài Facebook', Icons.work),

//===================//
      const Divider(
        color: Colors.grey,
        indent: 20,
        endIndent: 20,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          'Thông tin của bạn',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
      Container(
        child: Text(
          'Truy cập vào nhật ký hoạt động và các tùy chọn kiểm soát để quản lý thông tin của bạn trên Facebook.',
          style: TextStyle(color: Colors.black, fontSize: 15),
          textAlign: TextAlign.justify,
        ),
      ),
      _tile('Nhật ký hoạt động', Icons.article_outlined),
      _tile('Truy cập thông tin của bạn', Icons.assignment_ind_outlined),
      _tile('Tải thông tin của bạn xuống', Icons.download),
      _tile('Chuyển bản sao thông tin của bạn', Icons.folder_open),
      _tile('Tìm hiểu cách quản lý thông tin của bạn',
          Icons.question_answer),

      //===================//
      const Divider(
        color: Colors.grey,
        indent: 20,
        endIndent: 20,
      ),
      Container(
        padding: EdgeInsets.only(bottom: 10, top: 10),
        child: Text(
          'Tiêu chuẩn cộng đồng và chính sách pháp lý',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 18),
          textAlign: TextAlign.justify,
        ),
      ),
      _tile('Điều khoản dịch vụ', Icons.room_service),
      _tile('Chính sách dữ liệu', Icons.data_saver_off),
      _tile('Chính sách cookie', Icons.policy),
      _tile('Tiêu chuẩn cộng đồng', Icons.sticky_note_2),
      _tile('Giới thiệu', Icons.production_quantity_limits),
    ],
  );
}

ListTile _tile(String title, IconData icon) {
  return ListTile(
    title: Text(title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    leading: Icon(
      icon,
      color: Colors.black,
    ),
  );
}
