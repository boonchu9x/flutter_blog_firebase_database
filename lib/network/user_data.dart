import 'package:flutter/material.dart';
import 'package:flutter_blog_firebase_database/page/register_page.dart';
import 'package:flutter_blog_firebase_database/util/const.dart';
import 'authentication.dart';


class MapingPage extends StatefulWidget {
  final Auth auth;

  MapingPage({this.auth});

  @override
  _MapingPageState createState() => _MapingPageState();
}

class _MapingPageState extends State<MapingPage> {

  //init
  AuthStatus authStatus = AuthStatus.notSignedIn;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.auth.getUser().then((firebaseUserId) {
      setState(() {
        authStatus = firebaseUserId == null ? AuthStatus.notSignedIn : AuthStatus.signedIn;
      });
    });

  }


  @override
  Widget build(BuildContext context) {
    switch(authStatus){
      case AuthStatus.notSignedIn:
        return RegisterScreen();
      case AuthStatus.signedIn:

    }

    return


      SizedBox.fromSize(
        size: const Size.fromHeight(100.0),
        child: ListView.builder(
          itemCount: photoUrls.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 8.0, left: 20.0),
          itemBuilder: _buildPhoto,
        ),
      ),
  }
}
