import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/home_page.dart';
import 'package:flutter/cupertino.dart';

class MySecondPage extends StatefulWidget {
  static const String id ='MySecondPage';
  @override
  _MySecondPageState createState() => new _MySecondPageState();
}

class _MySecondPageState extends State<MySecondPage> {
  TextEditingController textEditingControllerUrl = new TextEditingController();
  TextEditingController textEditingControllerId = new TextEditingController();

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          title: Text('My second page',style: TextStyle(fontSize: 17,)),
          backgroundColor: Colors.blue,
          actions: <Widget>[
            // overflow menu
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    color: Colors.blue,
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 10.0),
                    ),onPressed: (){
                  Navigator.pushNamedAndRemoveUntil(context, MyHomePage.id,(Route<dynamic> route) => false);
                }),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
        ),
      ),
    );
  }
}