import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog_firebase_database/network/authentication.dart';
import 'package:flutter_blog_firebase_database/page/home_page.dart';
import 'package:flutter_blog_firebase_database/page/register_page.dart';
import 'package:flutter_svg/svg.dart';

import '../util/const.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  bool _togglePassVisible = false;
  FocusNode emailFocusNode, passFocusNode;
  final globalKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    //show/hide pass
    _togglePassVisible = false;
    emailFocusNode = FocusNode();
    passFocusNode = FocusNode();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailFocusNode.dispose();
    passFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.black12,
      //statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      key: globalKey,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              reverse: true,
              controller: scrollController,
              scrollDirection: Axis.vertical,
              child: Container(
                height: size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //HEADER
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/icons/ic_header_login.svg',
                          height: size.height * 0.3,
                          width: size.height * 0.3,
                        ),

                        /* SizedBox(
                      height: 14.0,
                    ),*/

                        //TEXT TITLE LOGIN
                        Text(
                          'Flutter Blog App',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4.0),

                        Text(
                          'Login to share your story',
                          style: TextStyle(
                            color: Colors.black26,
                            fontSize: 16.0,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),

                    //LIST FORM
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(
                          horizontal: 28.0, vertical: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //FORM
                          ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            children: [
                              //EDITEXT WITH EMAIL
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: TextFormField(
                                    controller: _emailController,
                                    textAlign: TextAlign.left,
                                    maxLines: 1,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(Icons.person),
                                        hintText: 'Email'),
                                    keyboardType: TextInputType.emailAddress,
                                    autovalidate: true,
                                    autocorrect: false,
                                    autofocus: false,
                                    focusNode: emailFocusNode,
                                    /* validator: (_) {
                                        return loginState.isValidEmail
                                            ? null
                                            : 'Invalid email format';
                                      },*/
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 20.0,
                              ),

                              //EDITTEXT WITH PASSWORD
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(1000.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 0.5,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0,
                                  ),
                                  child: Center(
                                    child: TextFormField(
                                      controller: _passController,
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.left,
                                      maxLines: 1,
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        icon: Icon(
                                          Icons.lock,
                                          size: 22,
                                        ),
                                        // ignore: missing_return
                                        suffixIcon: GestureDetector(
                                          //long press show/hide icon password
                                          onLongPress: () {
                                            setState(() {
                                              _togglePassVisible = true;
                                              FocusScope.of(context).unfocus();
                                            });
                                          },
                                          onLongPressUp: () {
                                            setState(() {
                                              _togglePassVisible = false;
                                              FocusScope.of(context).unfocus();
                                            });
                                          },
                                          child: IconButton(
                                            focusColor: Colors.transparent,
                                            highlightColor: Colors.transparent,
                                            hoverColor: Colors.transparent,
                                            splashColor: Colors.transparent,
                                            icon: Icon(_togglePassVisible
                                                ? Icons.visibility
                                                : Icons.visibility_off),
                                            onPressed: () {
                                              setState(() {
                                                _togglePassVisible =
                                                    !_togglePassVisible;
                                                FocusScope.of(context)
                                                    .unfocus();
                                              });
                                            },
                                          ),
                                        ),
                                        hintText: 'Password',
                                      ),
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      autovalidate: true,
                                      focusNode: passFocusNode,
                                      autofocus: false,
                                      autocorrect: false,
                                      obscureText: !_togglePassVisible,
                                      enableInteractiveSelection: false,
                                      /*validator: (_) {
                                          return loginState.isValidPass
                                              ? null
                                              : 'Invalid password format';
                                        },*/
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 40.0),

                          //LOGIN/ SIGN IN
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Card(
                              elevation: 0.0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(1000.0),
                              ),
                              color: colorPrimary,
                              child: InkWell(
                                hoverColor: Colors.white,
                                splashColor: Colors.white.withOpacity(0.2),
                                onTap: () => login(),
                                borderRadius: BorderRadius.circular(1000.0),
                                highlightColor: Colors.white.withOpacity(0.4),
                                focusColor: Colors.white.withOpacity(0.9),
                                child: Container(
                                  height: 48.0,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'LogIn'.toUpperCase(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //TEXT 'Don't have an account? Sign Up'
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 16.0,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    InkWell(
                      onTap: () => register(),
                      borderRadius: BorderRadius.circular(1000.0),
                      highlightColor: Colors.white.withOpacity(0.4),
                      focusColor: Colors.white.withOpacity(0.9),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: colorPrimary,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login() async {
    String email = _emailController.text.trim();
    String pass = _passController.text.trim();

    if (email.isEmpty) {
      //hide keyboard
      FocusScope.of(context).requestFocus(emailFocusNode);
      //showSnackBar(globalKey, 'Please enter email.');
      return;
    }
    if (!isValidEmail(email)) {
      FocusScope.of(context).unfocus();
      showSnackBar(globalKey, 'Email not valid!');
      return;
    }
    if (pass.isEmpty) {
      //hide keyboard
      FocusScope.of(context).requestFocus(emailFocusNode);
      //showSnackBar(globalKey, 'Please enter password.');
      return;
    }
    if (pass.length < 6) {
      FocusScope.of(context).unfocus();
      showSnackBar(globalKey, 'Password must be at least 6 characters!');
      return;
    }
    if (isValidEmail(email) && (pass.isNotEmpty && pass.length >= 6)) {
      FocusScope.of(context).unfocus();
      //sign in
      Auth().signInWithMailAndPass(email, pass);
      Navigator.of(context).pop(
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ),
      );
      return;
    }
  }

  void register() {
    FocusScope.of(context).unfocus();
    _emailController.clear();
    _passController.clear();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RegisterScreen(),
      ),
    );
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
