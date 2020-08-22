import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/home_page.dart';
import 'package:my_flutter_tutorial/second_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:MyHomePage(),
        routes: {
          MyHomePage.id : (context) => MyHomePage(),
          MySecondPage.id : (context) => MySecondPage(),
        }
    );
  }
}
