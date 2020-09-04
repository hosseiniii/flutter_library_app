import 'package:flutter/material.dart';
import 'package:flutter_library_app/constants/color_constant.dart';
import 'package:flutter_library_app/pages/home_page.dart';
import 'package:pushpole/pushpole.dart';

void main() {
  PushPole.initialize();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Dana",
          accentColor: kMainColor,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent),
      home: HomePage(),
      routes: {"/homePage": (_) => new HomePage()},
    );
  }
}
