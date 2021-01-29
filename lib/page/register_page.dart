import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_blog_firebase_database/component/custom_appbar.dart';
import 'package:flutter_blog_firebase_database/network/authentication.dart';
import 'package:flutter_blog_firebase_database/page/home_page.dart';
import 'package:flutter_blog_firebase_database/page/register_page.dart';
import 'package:flutter_svg/svg.dart';

import '../util/const.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  bool _togglePassVisible = false;
  FocusNode firstNameFocusNode, lastNameFocusNode, emailFocusNode, passFocusNode;
  final globalKey = GlobalKey<ScaffoldState>();
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    //show/hide pass
    _togglePassVisible = false;
    emailFocusNode = FocusNode();
    passFocusNode = FocusNode();
    firstNameFocusNode = FocusNode();
    lastNameFocusNode = FocusNode();
    scrollController = ScrollController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    emailFocusNode.dispose();
    passFocusNode.dispose();
    firstNameFocusNode.dispose();
    lastNameFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // After 1 second, scroll to top singlechildscrollview
    Timer(Duration(seconds: 1), () => scrollController.jumpTo(scrollController.position.maxScrollExtent),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      key: globalKey,
      appBar: CustomAppBar(
        context: context,
        title: 'Sign Up',
        leadingOnPress: () => Navigator.pop(context),
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Container(
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //LIST FORM
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 28.0, vertical: 40.0),
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
                                  controller: _firstNameController,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.person),
                                      hintText: 'First Name'),
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  autovalidate: true,
                                  autocorrect: false,
                                  focusNode: firstNameFocusNode,
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

                            //EDITEXT WITH FIRSNAME
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
                                  controller: _lastNameController,
                                  textAlign: TextAlign.left,
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      icon: Icon(Icons.person_add_rounded),
                                      hintText: 'Last Name'),
                                  keyboardType: TextInputType.text,
                                  textCapitalization: TextCapitalization.words,
                                  autovalidate: true,
                                  autocorrect: false,
                                  focusNode: lastNameFocusNode,
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


                            //EDITEXT WITH LASTNAME
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
                                      icon: Icon(Icons.email),
                                      hintText: 'Email'),
                                  keyboardType: TextInputType.emailAddress,
                                  autovalidate: true,
                                  autocorrect: false,
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

                        //SIGN UP
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
                              onTap: () => register(),
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
                                    'Create Account'.toUpperCase(),
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

                  SizedBox(height: 10.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void register() {
    String firstName = _firstNameController.text.trim();
    String lastName = _lastNameController.text.trim();
    String email = _emailController.text.trim();
    String pass = _passController.text.trim();

    if (firstName.isEmpty) {
      //hide keyboard
      FocusScope.of(context).requestFocus(firstNameFocusNode);
      //showSnackBar(globalKey, 'Please enter email.');
      return;
    }
    if (lastName.isEmpty) {
      //hide keyboard
      FocusScope.of(context).requestFocus(lastNameFocusNode);
      //showSnackBar(globalKey, 'Please enter email.');
      return;
    }
    if (email.isEmpty) {
      //hide keyboard
      FocusScope.of(context).requestFocus(emailFocusNode);
      //showSnackBar(globalKey, 'Please enter email.');
      return;
    }
    if (!isValidEmail(email)) {
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
      showSnackBar(globalKey, 'Password must be at least 6 characters!');
      return;
    }
    if (isValidEmail(email) && (pass.isNotEmpty && pass.length >= 6)) {
      Navigator.of(context).pop(
        MaterialPageRoute(
          builder: (context) {
            String userId = Auth().createUserRegister(email, pass) as String;
            print('New user: ${userId}');
          }
        ),
      );
      return;
    }
  }

  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }
}
