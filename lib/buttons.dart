import 'package:flutter/material.dart';

import 'package:yardapp/color.dart';
import 'package:yardapp/main_login/main_login.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';


class TopBackButton extends StatefulWidget {
  TopBackButton({Key? key, required this.routeName}) : super(key: key);
  final Route routeName;

  @override
  _TopBackButtonState createState() => _TopBackButtonState();
}

class _TopBackButtonState extends State<TopBackButton> {

  @override
  Widget build(BuildContext context) {

    return Positioned(
      left: 10,
      top: 5,
      child: IconButton(
        icon: Icon(Icons.arrow_back, size: 30.0),
        color: secondaryOneColor,
        onPressed: () {
          Navigator.of(context)
              .push(widget.routeName);
        },
      ),
    );
  }
}

class TopBackReplaceButton extends StatefulWidget {
  TopBackReplaceButton({Key? key, required this.routeName}) : super(key: key);
  final Route routeName;

  @override
  _TopBackReplaceButtonState createState() => _TopBackReplaceButtonState();
}

class _TopBackReplaceButtonState extends State<TopBackReplaceButton> {

  @override
  Widget build(BuildContext context) {

    return Positioned(
      left: 10,
      top: 5,
      child: IconButton(
        icon: Icon(Icons.arrow_back, size: 30.0),
        color: secondaryOneColor,
        onPressed: () {
          Navigator.of(context)
              .pushReplacement(widget.routeName);
        },
      ),
    );
  }
}

class MenuSingleWithImageButton extends StatefulWidget {
  MenuSingleWithImageButton({Key? key, required this.buttonImage, required this.buttonText, required this.routeName}) : super(key: key);
  final String buttonImage;
  final String buttonText;
  final Route routeName;

  @override
  _MenuSingleWithImageButtonState createState() => _MenuSingleWithImageButtonState();
}

class _MenuSingleWithImageButtonState extends State<MenuSingleWithImageButton> {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width: resizeToScreenWidth(context, buttonWidth),
        height: resizeToScreenHeight(context, buttonHeight),
        child: OutlinedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: buttonLeftIconPadding,
                child:
                SizedBox(
                  height: resizeToScreenWidth(context, iconSize),
                  width: resizeToScreenHeight(context, iconSize),
                  child: Center(
                    child: Image.asset(
                      widget.buttonImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Container(
                padding: buttonRightTextPadding,
                child: Text(widget.buttonText,
                  style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeButtonText), color: primaryThreeColor,),
                ),
              ),
            ],
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
                BorderSide(color: secondaryOneColor, width: borderWidth)
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(widget.routeName);
          },
        ),
      ),
    );
  }
}

class MenuSingleWithIconButton extends StatefulWidget {
  MenuSingleWithIconButton({Key? key, required this.buttonIcon, required this.buttonText, required this.routeName}) : super(key: key);
  final IconData buttonIcon;
  final String buttonText;
  final Route routeName;

  @override
  _MenuSingleWithIconButtonState createState() => _MenuSingleWithIconButtonState();
}

class _MenuSingleWithIconButtonState extends State<MenuSingleWithIconButton> {

  @override
  Widget build(BuildContext context) {

    return Center(
      child: SizedBox(
        width: resizeToScreenWidth(context, buttonWidth),
        height: resizeToScreenHeight(context, buttonHeight),
        child: OutlinedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: buttonLeftIconPadding,
                child:
                SizedBox(
                  height: resizeToScreenWidth(context, iconSize),
                  width: resizeToScreenHeight(context, iconSize),
                  child: Center(
                    child: Icon(widget.buttonIcon, size: resizeToScreenWidth(context, iconSize), color: secondaryOneColor),
                  ),
                ),
              ),
              Container(
                padding: buttonRightTextPadding,
                child: Text(widget.buttonText,
                  style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeButtonText), color: primaryThreeColor,),
                ),
              ),
            ],
          ),
          style: ButtonStyle(
            side: MaterialStateProperty.all(
                BorderSide(color: secondaryOneColor, width: borderWidth)
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          onPressed: () {
            Navigator.of(context)
                .push(widget.routeName);
          },
        ),
      ),
    );
  }
}

class SignOutButton extends StatefulWidget {

  @override
  _SignOutButtonState createState() => _SignOutButtonState();
}

class _SignOutButtonState extends State<SignOutButton> {


  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Center(
        child: SizedBox(
          width: resizeToScreenWidth(context, buttonWidth),
          height: resizeToScreenHeight(context, buttonHeight),
          child: OutlinedButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  padding: buttonLeftIconPadding,
                  child:
                  SizedBox(
                    height: resizeToScreenWidth(context, iconSize),
                    width: resizeToScreenHeight(context, iconSize),
                    child: Center(
                      child: Icon(Icons.logout, size: resizeToScreenWidth(context, iconSize), color: secondaryOneColor),
                    ),
                  ),
                ),
                Container(
                  padding: buttonRightTextPadding,
                  child: Text("Logout",
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeButtonText), color: primaryThreeColor,),
                  ),
                ),
              ],
            ),
            style: ButtonStyle(
              side: MaterialStateProperty.all(
                  BorderSide(color: secondaryOneColor, width: borderWidth)
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),

            onPressed: () async {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => MainLoginPage()), (route) => false);

            },
          ),
        )
    );
  }
}


