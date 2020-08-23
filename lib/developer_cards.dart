import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_flutter_tutorial/developer.dart';
import 'package:my_flutter_tutorial/home_page.dart';

const double developerCardHeight = 180;

List<DeveloperCard> updateDeveloperCards() {
  List<Widget> developerCards = <DeveloperCard>[];
  debugPrint('update cards');
  for (int i = 0; i < myDevelopers.length; i++) {
      developerCards.add(new DeveloperCard(
        email: myDevelopers[i].email,
        password: myDevelopers[i].password,
        firstName: myDevelopers[i].firstName,
        lastName: myDevelopers[i].lastName,
        bio: myDevelopers[i].bio,
        index: i,
      ));
  }
  return developerCards;
}

class DeveloperCard extends StatefulWidget {
  DeveloperCard({@required this.email,@required this.password,@required this.firstName,@required this.lastName,@required this.bio,
  @required this.index});
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String bio;
  final int index;
  
  @override
  State<DeveloperCard> createState() => new _DeveloperCardState();
}

class _DeveloperCardState extends State<DeveloperCard> {
  String _email;
  String _password;
  String _firstName;
  String _lastName;
  String _bio;
  int _index;
  
  @override
  void initState() {
    super.initState();
    _email = widget.email;
    _password = widget.password;
    _firstName = widget.firstName;
    _lastName = widget.lastName;
    _bio = widget.bio;
    _index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 70,
            child: Container(
              padding: new EdgeInsets.fromLTRB(10, 10, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                      _firstName + ' ' + _lastName,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        //color: Colors.blue,
                      )),
                  SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Text(
                    _bio,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        tooltip: 'Edit user story',
                        icon: Icon(FontAwesomeIcons.edit),
                        onPressed: () => editDeveloperPressed(_index, context),
                      ),
                      IconButton(
                        tooltip: 'Delete user story',
                        icon: Icon(FontAwesomeIcons.trash),
                        onPressed: () => deleteDeveloperPressed(_index, context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      height: developerCardHeight,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}

editDeveloperPressed(index, context) {
  myLastSelectedDeveloper=index;
  MyHomePage.of(context).editUserStoryInContext();
}

deleteDeveloperPressed(index, context) {
  MyHomePage.of(context).deleteWarningPopupInContext('developer', index, context);
}

