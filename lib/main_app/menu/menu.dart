import 'package:flutter/material.dart';
import 'package:yardapp/appbar_title.dart';
import 'package:yardapp/buttons.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/main_app.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';



class MenuPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leadingWidth: resizeToScreenWidth(context, iconSize),
        toolbarHeight: resizeToScreenHeight(context, toolbarHeight),
        backgroundColor: secondaryOneColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(borderRadius),
              topRight: Radius.circular(borderRadius),
              bottomLeft: Radius.circular(borderRadius),
              bottomRight: Radius.circular(borderRadius)
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: resizeToScreenWidth(context, iconSize), color: backgroundColor),
          onPressed: () {
            // Navigator.of(context)
            //     .push(routeToMainPage());
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainAppPage()));
          },
        ),
        title: AppBarMainTitleWidget(headerText: "Menu",),
      ),
      body:
      Stack(
        children: <Widget>[
          ListView(
            children: [
              Container(
                padding: topBottomPagePadding,
              ),

              // MenuSingleWithIconButton(buttonIcon: Icons.person, buttonText: 'Profile', routeName: routeToProfilePage()),

              Container(
                padding: rowBetweenPadding,
              ),


              // MenuSingleWithIconButton(buttonIcon: Icons.support, buttonText: 'Support', routeName: routeToSupportEnquiryPage()),

              Container(
                padding: rowBetweenPadding,
              ),

              // MenuSingleWithIconButton(buttonIcon: Icons.info, buttonText: 'Application Information', routeName: routeToApplicationInformationPage()),

              Container(
                padding: rowBetweenPadding,
              ),

              // MenuSingleWithIconButton(buttonIcon: Icons.notes, buttonText: 'Release Notes', routeName: routeToReleaseNotesPage()),

              Container(
                padding: rowBetweenPadding,
              ),

              SignOutButton(),

              Container(
                padding: topBottomPagePadding,
              ),
            ],
          ),
        ],
      ),
    );
  }

}