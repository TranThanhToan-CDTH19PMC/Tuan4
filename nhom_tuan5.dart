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
