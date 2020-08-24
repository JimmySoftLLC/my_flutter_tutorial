# my_flutter_tutorial

This flutter application was started with a new flutter project and then modified to demonstrate routing, widgets, hot reload, context, state, plugins and custom widgets.  It is the project that is discussed in my tutorial at https://www.mysoftwarejourney.com/2020/08/22/customizing-flutters-demo-app/

## Create an app

Start android studio and click “Start a new Flutter project”. On the next screen choose “Flutter Application”.  Click on the next few screens, which allow you to change location and names, and you will be presented with a new working flutter app.

## Change control

Now lets add this app to GitHub.  Log into GitHub and then choose “VCS/Import into Version Control/Share Project on Github”.

![Android studio add share on github](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-15.png)

The following screen will display with the files to be added for the initial commit. Press “Add” and it will create a repository on your GitHub account. If successful will indicate the files are shared successfully.

![Android studio add files for initial commit](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-16.png)

## Routing between home page and second page

The original demo app had everything in the “main.dart” file. We will refactor the “main.dart” file to have one stateless widget defining the home page and routes for the other pages. Then we will create separate files for every view.

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

## Widgets

Everything in flutter is driven by widgets. The buttons currently don’t have any padding. To fix this we wrap the button in a padding widget.

To wrap a button with padding widget clicking on the line where button is. A light bulb will show where you can select “Wrap with padding”. That was easy.

![Android studio wrap with padding](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-17.png)

The button will now have padding as defined with EdgeInsets. There are other types of EdgeInsets. For example EdgeInset.fromLTRB gives you left, top, right and bottom settings.

```dart
Padding(
    padding: const EdgeInsets.all(8.0),
    child: FlatButton(
    color: Colors.orange,
    child: Text(
      "Second page",
      style: TextStyle(fontSize: 10.0),
    ),onPressed: (){
    Navigator.pushNamedAndRemoveUntil(context, MySecondPage.id,(Route<dynamic> route) => false);
    }),
  ),
```
Many of the widgets are similar to layout classes you maybe are already familiar with like bootstrap and materialUI. These include containers, rows, columns, flex grids and more.

## Hot reload

Hot reload allows you to change code on the fly and the app automatically updates. This is my favorite feature and helps speed up development. Change some colors, wrap things with widgets, change functions have fun.

## Context

Widget builders and navigator functions have context and must be passed when going to a new page.

For example a function that validates some data and then navigates to a view will need to pass context.

This next example demonstrates this.

Add “context_example.dart” to your project and add the following code.

```dart
import 'package:flutter/material.dart';
import 'package:my_flutter_tutorial/home_page.dart';

void updateSomeData(myData, context) async {
    // do stuff with myData
    Route _createRoute() {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => MyHomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    }
    Navigator.of(context).pushAndRemoveUntil(_createRoute(),(Route<dynamic> PageRouteBuilder) => false);
}
```
Import “context_example.dart” into your “second_page.dart” file and add another button as follows.

```dart
Padding(
    padding: const EdgeInsets.all(8.0),
    child: FlatButton(
        color: Colors.blue,
        child: Text(
          "updateSomeData then home",
          style: TextStyle(fontSize: 10.0),
        ),onPressed: (){
      updateSomeData(null, context);
    }),
  ),
```

The second button named “updateSomeData then home” will call a function and then pass context to the home page.

## State

Local state is easily handled in flutter. You simply create a local variable in your class and then the widget can update it using “onChanged: (value) {myVariable = value;}”

## Plugins

Plugins extend functionality of Flutter. Plugins are published at https://pub.dev/ and are rated by likes, pub points and popularity.

Plugins come from many sources: the flutter team, other companies and developers.

Navigate to https://pub.dev/ and search for the a plugin your are interested in.

For this example we will add font awesome icons to our project.

![Flutter plugins](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-18.png)

To use this plug modify your pubspec.yaml file as shown. Note: Indentation is important in “yaml” files so make sure it is correct.

```dart
dependencies:
  flutter:
    sdk: flutter
  font_awesome_flutter: ^8.8.1
  cupertino_icons: ^0.1.3
```

The next step is to import the package into your dart file. Add this line to all pages where you want to use font awesome icons. “import ‘package:font_awesome_flutter/font_awesome_flutter.dart’;”

After changing your dart files you should get a message to “Get dependencies. If you don’t you can manually get them by typing “flutter pub get” in the Android Studio terminal.

![Flutter get dependancies](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-19.png)

## Custom widgets

You can create custom widgets for your applications also. I use list of custom widgets for “cards”. The example below shows them added to this project. You can check this out in the GitHub repository.

![Flutter get dependancies](https://www.mysoftwarejourney.com/wp-content/uploads/2020/08/image-20-488x1024.png)

## In Conclusion

Flutter is a fun IDE to use. I am hoping someday they will release the web version. Currently react native can do similar things except for the hot reload. React native now has good competition so both products should get better. Hot reload for react native? One can hope. The future will be exciting for both frameworks.





