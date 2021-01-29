import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const colorPrimary = Color(0xffE8505B);
const colorPrimary2 = Color(0xffF77941);


const double textSuperSmall = 10.0;
const double textSmall = 12.0;
const double textMedium = 14.0;
const double textNormal = 16.0;
const double textTitle = 18.6;
const double textBig = 20.0;
const double textToolbar = 28.0;
const double textSuperBig = 28.0;
const double textSuperSuperBig = 36.0;
const double textTemperature = 50.0;

enum AuthStatus{
  notSignedIn,
  signedIn,
}


void showSnackBar(GlobalKey<ScaffoldState> globalKey, String message) {
  var snackBar = SnackBar(
    backgroundColor: Colors.white,
    content: Text(
      message,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: textNormal,
      ),
    ),
    action: SnackBarAction(
      textColor: Colors.blue[400],
      label: 'OK',
      onPressed: () => {
        globalKey.currentState.hideCurrentSnackBar(),
      },
    ),
  );
  globalKey.currentState.showSnackBar(snackBar);
}
