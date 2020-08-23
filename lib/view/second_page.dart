import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/view/home_page.dart';
import 'package:my_flutter_tutorial/model/context_example.dart';
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
          title: Text('Utilities',style: TextStyle(fontSize: 17,)),
          backgroundColor: Colors.green,
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
                    color: Colors.orange,
                    child: Text(
                      "Home",
                      style: TextStyle(fontSize: 10.0),
                    ),onPressed: (){
                  Route _createRoute() {
                    return PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    );
                  }
                  Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> pageRouteBuilder) => false);
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    color: Colors.orange,
                    child: Text(
                      "Create random developer",
                      style: TextStyle(fontSize: 10.0),
                    ),onPressed: (){
                  updateSomeData(context);
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                    color: Colors.red,
                    child: Text(
                      "Delete all",
                      style: TextStyle(fontSize: 10.0),
                    ),onPressed: (){
                  deleteAllDevelopers(context);
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