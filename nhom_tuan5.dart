import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

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
      home: MyhomePage(),
    );
  }
}

class MyhomePage extends StatelessWidget {
  MyhomePage({Key? key}) : super(key: key);
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
                Icons.drafts,
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
                    hintText: "Email",
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
                  MaterialPageRoute(builder: (context) => Loadding()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TryAgain()),
                );
              }
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


class Loadding extends StatelessWidget {
  Loadding({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(
                padding: EdgeInsets.only(top: 130, bottom: 40),
                child: Icon(
                  Icons.drafts,
                  size: 100,
                  color: Colors.blue,
                )),
            Text(
              "SignIn",
              textScaleFactor: 4,
            ),
            Text("Speak, friend, and enter"),
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Email()),
                );
              },
              child: Image.asset("../images/loadding.png"),
            )
          ],
        ),
      ),
    );
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
class Email extends StatelessWidget {
  const Email({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      Text(
        'Mailboxes',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black54),
        textAlign: TextAlign.center,
      ),
      Container(
        color: Colors.black12,
        height: 50,
        child: Text(
          'Mailboxes',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
          textAlign: TextAlign.justify,
        ),
      ),
      _tile('All inboxes', Icons.inbox),
      const Divider(
        color: Colors.grey,
        indent: 20,
      ),
      _tile('ICloud', Icons.cloud),
      const Divider(
        color: Colors.grey,
        indent: 20,
      ),
      _tile('Gmail', Icons.email),
      const Divider(
        color: Colors.grey,
        indent: 20,
      ),
      _tile('Hotmail', Icons.email_sharp),
      const Divider(
        color: Colors.grey,
        indent: 20,
      ),
      _tile('VIP', Icons.star_border_purple500),
      const Divider(
        color: Colors.grey,
        indent: 20,
      ),
      Container(
        color: Colors.black12,
        height: 50,
        child: Text(
          'Special folders',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black38),
          textAlign: TextAlign.left,
        ),
      ),
      _tile('Secure', Icons.security),
      const Divider(
        color: Colors.grey,
        indent: 20,
      ),
      _tile('Notifications', Icons.notifications),
      const Divider(
        color: Colors.blue,
      ),
      _tile('Delete', Icons.delete),
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
      color: Colors.blue[500],
    ),
  );
}

Widget _checkbox() {
  bool isChecked = false;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.blue;
    }
    return Colors.red;
  }

  return Checkbox(
    checkColor: Colors.white,
    fillColor: MaterialStateProperty.resolveWith(getColor),
    value: isChecked,
    onChanged: (bool? value) {
      setState(() {
        isChecked = value!;
      });
    },
  );
}

void setState(Null Function() param0) {}
