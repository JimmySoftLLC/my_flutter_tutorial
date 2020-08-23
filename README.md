# my_flutter_tutorial

This flutter application was started with a new flutter project and then added to to demonstrate routing, widgets, hot reload, context, state, plugins and custom widgets.  It is the project that is discussed in my tutorial at https://www.mysoftwarejourney.com/2020/08/22/customizing-flutters-demo-app/

## Create an app

Start android studio and click “Start a new Flutter project”. On the next screen choose “Flutter Application”.  Click on the next few screens, which allow you to change location and names, and you will be presented with a new working flutter app.

## Change control

Now lets add this app to GitHub.  Log into GitHub and then choose “VCS/Import into Version Control/Share Project on Github”.

![Android studio add share on github](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-15.png)

The following screen will display with the files to be added for the initial commit. Press “Add” and it will create a repository on your GitHub account. If successful will indicate the files are shared successfully.

![Android studio add files for initial commit](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-16.png)

## Routing between home page and second page

The original demo app had everything in the “main.dart” file. We will refactor the “main.dart” file to have one stateless widget defining the home page and routes for the other pages. The we will create separate files for every view.

Make two new files named “home_page.dart” and “second_page.dart” in the “lib” folder.

Paste the following code in “home_page.dart”

```dart
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
```

Paste the following code in “second_page.dart”

```dart
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
              FlatButton(
                  color: Colors.blue,
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 10.0),
                  ),onPressed: (){
                Navigator.pushNamedAndRemoveUntil(context, MyHomePage.id,(Route<dynamic> route) => false);
              }),
            ],
          ),
        ),
        body: SingleChildScrollView(
        ),
      ),
    );
  }
}
```

Replace the contents of “main.dart” with the following code. This code defines the routes to the HomePage and SecondPage using Ids.

```dart
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
```
Run the app and you will be able to move from one page to the next.

When you press the “Second Page” button the following function is used “Navigator.pushNamedAndRemoveUntil(context, MyHomePage.id,(Route<dynamic> route) => false);”

This function “pushNamedAndRemoveUntil” removes all the other views and pushed the named page. This creates a single page app experience and prevents the user from swiping the view away which could put them on the wrong screen.


