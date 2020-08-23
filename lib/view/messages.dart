import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/model/developer.dart';
import 'package:my_flutter_tutorial/view/home_page.dart';

void deleteWarningPopup(String itemType, int index, context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Warning !', style: TextStyle(color: Colors.red)),
        content: myRichText(itemType, myDevelopers[index].firstName + ' ' + myDevelopers[index].lastName),
        actions: <Widget>[
          FlatButton(
            child: const Text('CANCEL', style: TextStyle(color: Colors.orange)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: const Text('DELETE', style: TextStyle(color: Colors.orange)),
            onPressed: () {
                    myDevelopers.removeAt(index);
                    Route _createRoute() {
                      return PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          return FadeTransition(opacity: animation, child: child);
                        },
                      );
                    }
                    Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> pageRouteBuilder) => false);
                  },
          )
        ],
      );
    },
  );
}

RichText myRichText(String itemType, String itemName) {
  var text = new RichText(
    text: new TextSpan(
      style: new TextStyle(
        fontSize: 14.0,
        color: Colors.black,
      ),
      children: <TextSpan>[
        new TextSpan(
            text: 'You are about to delete ' + itemType + ', ',
            style: new TextStyle(fontSize: 17)),
        new TextSpan(
            text: itemName,
            style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
        new TextSpan(
            text: '.  This process is irreversable are you sure?',
            style: new TextStyle(fontSize: 17)),
      ],
    ),
  );
  return text;
}

