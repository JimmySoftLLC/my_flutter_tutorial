import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/second_page.dart';

class MyHomePage extends StatefulWidget {
  static const String id ='/MyHomePage';
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Flutter Tutorial',style: TextStyle(fontSize: 17,)),
          backgroundColor: Colors.orange,
          actions: <Widget>[
            // overflow menu
          ],
        ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            FlatButton(
            color: Colors.orange,
            child: Text(
              "Second page",
              style: TextStyle(fontSize: 10.0),
            ),onPressed: (){
            Navigator.pushNamedAndRemoveUntil(context, MySecondPage.id,(Route<dynamic> route) => false);
            }),
          ],
        ),
      ),
      body: Center(
        child: Container(
        )
        ),
      );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
