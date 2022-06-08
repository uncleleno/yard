import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/size.dart';

const Text subHeading = Text('Add or release a vehicle from your yard');

class MenuHeader extends StatefulWidget {
  MenuHeader({Key? key, required this.headerText}) : super(key: key);
  final String headerText;
  @override
  _MenuHeaderState createState() => _MenuHeaderState();
}

class _MenuHeaderState extends State<MenuHeader> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20.0, bottom: 1.0),
      alignment: Alignment.center,
      child: Text(
        widget.headerText,
        textAlign: TextAlign.center,
        softWrap: true,
        style: const TextStyle(fontSize: menuHeader,
            color: headerTextColor,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}