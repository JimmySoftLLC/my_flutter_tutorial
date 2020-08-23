import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/view/second_page.dart';
import 'package:my_flutter_tutorial/view/register_page.dart';
import 'package:my_flutter_tutorial/widgets/developer_cards.dart';
import 'package:my_flutter_tutorial/view/messages.dart';
import 'package:my_flutter_tutorial/view/edit_developer.dart';

class MyHomePage extends StatefulWidget {
  static const String id ='/MyHomePage';
  static _MyHomePageState of(BuildContext context) =>
      context.findAncestorStateOfType();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> developerCards = <DeveloperCard>[];
  @override
  void initState() {
    super.initState();
    developerCards = updateDeveloperCards();
  }

  void deleteWarningPopupInContext(String itemType, int index, context) {
    deleteWarningPopup( itemType,  index, context);
  }

  void editDeveloperInContext() {
    Navigator.pushReplacementNamed(context, MyEditDeveloperPage.id);
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
              color: Colors.green,
              child: Text(
                "Utilities",
                style: TextStyle(fontSize: 10.0),
              ),onPressed: (){
              Route _createRoute() {
                return PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => MySecondPage(),
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
                    "Register Developer",
                    style: TextStyle(fontSize: 10.0),
                  ),onPressed: (){
                Route _createRoute() {
                  return PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => MyRegisterPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  );
                }
                Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> pageRouteBuilder) => false);
              }),
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
          children: developerCards,
        ),
        ),
      );
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
