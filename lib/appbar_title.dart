import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/check_into_start.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';



class AppBarTitleJobFirstOnSceneWidget extends StatefulWidget {
  AppBarTitleJobFirstOnSceneWidget({Key? key, required this.topLine, required this.middleLine,
    required this.centerLine, required this.bottomLine, required this.progressPercentage}) : super(key: key);
  final String topLine;
  final String middleLine;
  final String centerLine;
  final String bottomLine;
  final int progressPercentage;
  @override
  State createState() => AppBarTitleJobFirstOnSceneWidgetState();
}

class AppBarTitleJobFirstOnSceneWidgetState extends State<AppBarTitleJobFirstOnSceneWidget>  {

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.topLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.middleLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
                if (widget.centerLine != '')
                  Container(
                    padding: appBarPadding,
                    alignment: Alignment.centerLeft,
                    child:
                    Text(widget.centerLine,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),

            Container(
              padding: appBarPadding,
              alignment: Alignment.centerRight,
              child:
              OutlinedButton(
                child: SizedBox(
                  height: resizeToScreenHeight(context, appBarImageSize),
                  width: resizeToScreenWidth(context, appBarImageSize),
                  child: Center(
                    child:
                    Image.asset(
                      'assets/images/truck.png',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(primaryTwoColor)
                ),
                onPressed: () {


                },
              ),
            ),
          ],
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child:
          Text(widget.bottomLine,
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarSubText), color: backgroundColor),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}

class AppBarTitleNoButtonJobFirstOnSceneWidget extends StatefulWidget {
  AppBarTitleNoButtonJobFirstOnSceneWidget({Key? key, required this.topLine, required this.middleLine, required this.bottomLine, required this.progressPercentage}) : super(key: key);
  final String topLine;
  final String middleLine;
  final String bottomLine;
  final int progressPercentage;
  @override
  State createState() => AppBarTitleNoButtonJobFirstOnSceneWidgetState();
}

class AppBarTitleNoButtonJobFirstOnSceneWidgetState extends State<AppBarTitleNoButtonJobFirstOnSceneWidget>  {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.topLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.middleLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Container(
              padding: appBarPadding,
              alignment: Alignment.centerRight,
              child:
              OutlinedButton(
                child: Text('',
                  style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarButtonText), color: secondaryOneColor),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    side: MaterialStateProperty.all(BorderSide(width: 0.0, color: secondaryOneColor)),
                    backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                ),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child:
          Text(widget.bottomLine,
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarSubText), color: backgroundColor),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}

class AppBarTitleNoButtonTakeoverJobWidget extends StatefulWidget {
  AppBarTitleNoButtonTakeoverJobWidget({Key? key, required this.topLine, required this.middleLine, required this.bottomLine, required this.progressPercentage}) : super(key: key);
  final String topLine;
  final String middleLine;
  final String bottomLine;
  final int progressPercentage;
  @override
  State createState() => AppBarTitleNoButtonTakeoverJobWidgetState();
}

class AppBarTitleNoButtonTakeoverJobWidgetState extends State<AppBarTitleNoButtonTakeoverJobWidget>  {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.topLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.middleLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Container(
              padding: appBarPadding,
              alignment: Alignment.centerRight,
              child:
              OutlinedButton(
                child: Text('',
                  style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarButtonText), color: secondaryOneColor),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    side: MaterialStateProperty.all(BorderSide(width: 0.0, color: secondaryOneColor)),
                    backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                ),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child:
          Text(widget.bottomLine,
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarSubText), color: backgroundColor),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}

class AppBarTitleNoButtonArJobWidget extends StatefulWidget {
  AppBarTitleNoButtonArJobWidget({Key? key, required this.topLine, required this.middleLine, required this.bottomLine, required this.progressPercentage}) : super(key: key);
  final String topLine;
  final String middleLine;
  final String bottomLine;
  final int progressPercentage;
  @override
  State createState() => AppBarTitleNoButtonArJobWidgetState();
}

class AppBarTitleNoButtonArJobWidgetState extends State<AppBarTitleNoButtonArJobWidget>  {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.topLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.middleLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            Container(
              padding: appBarPadding,
              alignment: Alignment.centerRight,
              child:
              OutlinedButton(
                child: Text('',
                  style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarButtonText), color: secondaryOneColor),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                    ),
                    side: MaterialStateProperty.all(BorderSide(width: 0.0, color: secondaryOneColor)),
                    backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                ),
                onPressed: () {
                },
              ),
            ),
          ],
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child:
          Text(widget.bottomLine,
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarSubText), color: backgroundColor),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}

class AppBarTitleNoButtonArJobMultiLineWidget extends StatefulWidget {
  AppBarTitleNoButtonArJobMultiLineWidget({Key? key, required this.topLine, required this.middleLine,
    required this.centerLine, required this.bottomLine, required this.progressPercentage}) : super(key: key);
  final String topLine;
  final String middleLine;
  final String centerLine;
  final String bottomLine;
  final int progressPercentage;
  @override
  State createState() => AppBarTitleNoButtonArJobMultiLineWidgetState();
}

class AppBarTitleNoButtonArJobMultiLineWidgetState extends State<AppBarTitleNoButtonArJobMultiLineWidget>  {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.topLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: appBarPadding,
                  alignment: Alignment.centerLeft,
                  child:
                  Text(widget.middleLine,
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                  ),
                ),
                if (widget.centerLine != '')
                  Container(
                    padding: appBarPadding,
                    alignment: Alignment.centerLeft,
                    child:
                    Text(widget.centerLine,
                      textAlign: TextAlign.left,
                      softWrap: true,
                      style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
                    ),
                  ),
              ],
            ),
          ],
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child:
          Text(widget.bottomLine,
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarSubText), color: backgroundColor),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}

class AppBarMainTitleWidget extends StatefulWidget {
  AppBarMainTitleWidget({Key? key, required this.headerText}) : super(key: key);
  final String headerText;
  @override
  State createState() => AppBarMainTitleWidgetState();
}

class AppBarMainTitleWidgetState extends State<AppBarMainTitleWidget>  {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child: Text(widget.headerText,
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarText), color: backgroundColor, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}

class AppBarMainTitleNoTextWidget extends StatefulWidget {
  AppBarMainTitleNoTextWidget({Key? key}) : super(key: key);
  @override
  State createState() => AppBarMainTitleNoTextWidgetState();
}

class AppBarMainTitleNoTextWidgetState extends State<AppBarMainTitleNoTextWidget>  {

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: dtMainImageSize,
          width: dtMainImageSize,
          child: Center(
            child:
            Image.asset(
              'assets/images/MicrosoftTeams-image11.png',
              fit: BoxFit.cover,
            ),
          ),
        ),

        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child: Text("DREAM",
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarDtText), color: backgroundColor, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child: Text("TEC",
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarDtText), color: primaryTwoColor, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child: Text(" ",
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarDtText), color: backgroundColor, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: appBarPadding,
          alignment: Alignment.centerLeft,
          child: Text("YARD",
            textAlign: TextAlign.left,
            softWrap: true,
            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeAppBarDtText), color: backgroundColor, fontWeight: FontWeight.bold),
          ),
        ),

      ],
    );

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}

class BottomBarWidget extends StatefulWidget {
  BottomBarWidget({Key? key}) : super(key: key);
  @override
  State createState() => BottomBarWidgetState();
}

class BottomBarWidgetState extends State<BottomBarWidget>  {
  int _releaseType = 0;

  Future releaseDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("Choose a release type:", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [

                Row(
                  children: [
                    Radio<int>(
                        value: 1,
                        groupValue: _releaseType,
                        onChanged: (value) {
                          setState(() {
                            _releaseType = value!;
                          });
                        }
                    ),
                    SizedBox(width: 10.0,),
                    Text('Sale release'),
                  ],
                ),

                Row(
                  children: [
                    Radio<int>(
                        value: 2,
                        groupValue: _releaseType,
                        onChanged: (value) {
                          setState(() {
                            _releaseType = value!;
                          });
                        }
                    ),
                    SizedBox(width: 10.0,),
                    Text('Client release'),
                  ],
                ),


                Row(
                  children: [
                    Radio<int>(
                        value: 3,
                        groupValue: _releaseType,
                        onChanged: (value) {
                          setState(() {
                            _releaseType = value!;
                          });
                        }
                    ),
                    SizedBox(width: 10.0,),
                    Text('Demolished'),
                  ],
                ),

              ],
            ),

            if(_releaseType == 2)
            SizedBox(
              height: buttonHeight,
              width: buttonWidth,
              child: OutlinedButton(
                // onFocusChange: toggleSwitch,
                onPressed: ()  {

                  Navigator.pushNamed(context, '/ClientSelectYardPage');
                },
                style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: otpButtonBackground, width: borderWidth)
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadiusButton),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(acceptButton)
                ),
                child: const Text("Continue",
                  style: TextStyle(
                      color: buttonColorText,
                      fontSize: buttonSizeText, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ), // backgroundColor: Colors.blue
              ),
            ),

          ],


        )


    ),
  );


  String? status;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: resizeToScreenHeight(context, toolbarHeight),
      child:
      Container(
        padding: bottomBarOnePadding,
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        // height: bottomBarHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(0),
              bottomRight: Radius.circular(0)
          ),
          color: secondaryOneColor,
          border: Border(
            top: BorderSide(color: secondaryOneColor, width: 0, style: BorderStyle.solid),
            left: BorderSide(color: secondaryOneColor, width: 0, style: BorderStyle.solid),
            right: BorderSide(color: secondaryOneColor, width: 0, style: BorderStyle.solid),
            bottom: BorderSide(color: secondaryOneColor, width: 0, style: BorderStyle.solid),
          ),
        ),

        child: Row(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width / 4) - resizeToScreenWidth(context, radioSize), // set this
              child:
              OutlinedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_downward, size: resizeToScreenWidth(context, iconSize), color: backgroundColor),
                    Container(
                      padding: bottomBarTwoPadding,
                      alignment: Alignment.center,
                      child:
                      Text("Check In",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: backgroundColor),
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOverlayColor),
                ),
                onPressed: () async {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckIntoStartPage()));


                },
              ),
            ),

            SizedBox(
              width: (MediaQuery.of(context).size.width / 4) - resizeToScreenWidth(context, radioSize), // set this
              child:
              OutlinedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_upward, size: resizeToScreenWidth(context, iconSize), color: backgroundColor),
                    Container(
                      padding: bottomBarTwoPadding,
                      alignment: Alignment.center,
                      child:
                      Text("Release",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: backgroundColor),
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOverlayColor),
                ),
                onPressed: () {
                  releaseDialog();


                },
              ),
            ),

            SizedBox(
              width: (MediaQuery.of(context).size.width / 4) - resizeToScreenWidth(context, radioSize), // set this
              child:
              OutlinedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back, size: resizeToScreenWidth(context, iconSize), color: secondaryOverlayColor),
                    Container(
                      padding: bottomBarTwoPadding,
                      alignment: Alignment.center,
                      child:
                      Text("Natis",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: backgroundColor),
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOverlayColor),
                ),
                onPressed: () {
                  // printWhenDebug('Save');



                },
              ),
            ),

            SizedBox(
              width: (MediaQuery.of(context).size.width / 4) - resizeToScreenWidth(context, radioSize), // set this
              child:
              OutlinedButton(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.remove, size: resizeToScreenWidth(context, iconSize), color: backgroundColor),
                    Container(
                      padding: bottomBarTwoPadding,
                      alignment: Alignment.center,
                      child:
                      Text("Items Removed",
                        textAlign: TextAlign.center,
                        softWrap: true,
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: backgroundColor),
                      ),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius),
                    ),
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOverlayColor),
                ),
                onPressed: () {
                  // printWhenDebug('Save');



                },
              ),
            ),

          ],
        ),
      ),
    );

  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    super.dispose();
  }

}
