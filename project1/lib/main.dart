import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'page/homepage.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigoAccent,
      ),
      home: Home_Page(),
    );
  }
}
//TESTTEST STREE
//TEST 14.35