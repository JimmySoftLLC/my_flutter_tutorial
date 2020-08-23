import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/view/home_page.dart';
import 'package:my_flutter_tutorial/view/second_page.dart';
import 'package:my_flutter_tutorial/view/register_page.dart';
import 'package:my_flutter_tutorial/view/edit_developer.dart';

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
          MyRegisterPage.id : (context) => MyRegisterPage(),
          MyEditDeveloperPage.id : (context) => MyEditDeveloperPage(),
        }
    );
  }
}
