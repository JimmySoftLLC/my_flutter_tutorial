import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/view/home_page.dart';
import 'package:my_flutter_tutorial/model/developer.dart';
import 'dart:math';

void updateSomeData( context) async {
  // do stuff with myData
  Developer myDeveloper;
  int index;
  index = myDevelopers.length-1;
  String firstName = returnRandomString(firstNamesData);
  String lastName = returnRandomString(lastNamesData);
  String bio = returnRandomString(biosData);
  myDeveloper = new Developer(firstName + '.' + lastName + '@anywhere.com', '1234', firstName, lastName, bio,index);
  myDevelopers.add(myDeveloper);
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
  Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> pageRouteBuilder) => false);
}

void deleteAllDevelopers( context) async {
  // do stuff with myData
  myDevelopers.clear();
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }
  Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> pageRouteBuilder) => false);
}

String returnRandomString(myStrings){
  Random rnd = new Random();
  double myDouble = rnd.nextDouble();
  double myRandDouble =  myStrings.length*(1-myDouble)-1;
  int myRandInt = myRandDouble.toInt();
  if (myRandInt > myStrings.length-1){
    myRandInt = myStrings.length-1;
  }
  if (myRandInt < 0){
    myRandInt = 0;
  }
  return myStrings[myRandInt];
}

