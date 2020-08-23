import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/view/home_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_tutorial/model/developer.dart';

class MyRegisterPage extends StatefulWidget {
  static const String id ='/MyRegisterPage';
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  String myText = '';
  String email = '';
  String password = '';
  String firstName = '';
  String lastName = '';
  String bio = '';

  void validateEntries() {
    if (password == '' ) {
      setState(() {
        myText = 'No entries please enter email and password.';
      });
    }else{
      setState(() {
        myText = 'Registering user please wait.';
      });
      Developer myDeveloper;
      int index;
      index = myDevelopers.length-1;
      myDeveloper = new Developer(email, password, firstName, lastName, bio,index);
      myDevelopers.add(myDeveloper);
      Navigator.pushReplacementNamed(context, MyHomePage.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    double myRadius = 10;
    Color mainColor = Colors.orange;
    Color accentColor = Colors.orangeAccent;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register New User',style: TextStyle(fontSize: 17,)),
        backgroundColor: mainColor,
        actions: <Widget>[
          // overflow menu
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              tooltip: 'Go back',
              icon: Icon(FontAwesomeIcons.angleLeft), onPressed: () {
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
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 24.0,
              ),
              TextField(
                //controller: TextEditingController()..text = '',
                onChanged: (value) {
                  email = value;
                },
                decoration: InputDecoration(
                  hintText: 'email',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: accentColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: accentColor, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                //controller: TextEditingController()..text = '',
                onChanged: (value) {
                  password = value;
                },
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'password',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: accentColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: accentColor, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 20,
                    child: TextField(
                      //controller: TextEditingController()..text = 'flutter@anywhere.com',
                      onChanged: (value) {
                        firstName = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'first name',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: accentColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: accentColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: SizedBox(
                      height: 24.0,
                    ),
                  ),
                  Expanded(
                    flex: 20,
                    child: TextField(
                      //controller: TextEditingController()..text = 'flutter@anywhere.com',
                      onChanged: (value) {
                        lastName = value;
                      },
                      decoration: InputDecoration(
                        hintText: 'last name',
                        contentPadding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: accentColor, width: 1.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: accentColor, width: 2.0),
                          borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 24.0,
              ),
              TextField(
                maxLines: 4,
                //controller: TextEditingController()..text = '',
                onChanged: (value) {
                  bio = value;
                },
                decoration: InputDecoration(
                  hintText: 'Tell us about yourself',
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: accentColor, width: 1.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                    BorderSide(color: accentColor, width: 2.0),
                    borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  ),
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16.0),
                child: Material(
                  color: accentColor,
                  borderRadius: BorderRadius.all(Radius.circular(myRadius)),
                  elevation: 5.0,
                  child: MaterialButton(
                    onPressed: () {
                      validateEntries();
                    },
                    minWidth: 200.0,
                    height: 42.0,
                    child: Text(
                      'Register',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                myText,
              ),
              SizedBox(
                height: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}