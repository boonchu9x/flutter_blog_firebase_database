import 'package:flutter/material.dart';
import 'package:flutter_blog_firebase_database/util/const.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  BuildContext context;
  String title;
  final Function leadingOnPress;

  CustomAppBar({
    Key key,
    this.context,
    this.title,
    this.leadingOnPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      margin: EdgeInsets.only(top: 25.0),
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Stack(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: textTitle,
                        ),
                      ),
                    ),
                  ),
                  FlatButton(
                    height: double.infinity,
                    minWidth: 10,
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    ),
                    onPressed: leadingOnPress,
                  ),
                ],
              ),
            ),
          ),
          Divider(
            height: 2,
            color: Colors.black26,
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(60.0);
}
