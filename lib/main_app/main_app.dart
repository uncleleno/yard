import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/appbar_title.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/check_into_start.dart';
import 'package:yardapp/main_app/menu/menu.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';

class MainAppPage extends StatefulWidget {
  const MainAppPage({Key? key}) : super(key: key);

  @override
  State<MainAppPage> createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage> {
  int _releaseType = 0;


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  TextEditingController textarea = TextEditingController();

  String onInputValidated = 'Dreamtec Yard';
  String firstName = "";
  // Initial Selected Value
  String dropdownvalue = 'Dreamtec Yard';

  // List of items in our dropdown menu
  var items = [
    'Dreamtec Yard',
    'The Other Yard',
    'The Other Other Yard',

  ];

  void initState() {
    textarea.text = "Dreamtec Yard";
    super.initState();
    getFirstName();
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  FloatingActionButtonLocation location = FloatingActionButtonLocation.startFloat;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedIndex = 0;


  void getFirstName() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      firstName = prefs.getString('firstName') ?? '';
    });

  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            leadingWidth: resizeToScreenWidth(context, iconSize),
            toolbarHeight: resizeToScreenHeight(context, toolbarHeight),
            backgroundColor: secondaryOneColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(borderRadius),
                  topRight: const Radius.circular(borderRadius),
                  bottomLeft: Radius.circular(borderRadius),
                  bottomRight: Radius.circular(borderRadius)
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.menu, size: resizeToScreenWidth(context, iconSize), color: backgroundColor),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MenuPage()));
              },
            ),
            title: AppBarMainTitleNoTextWidget(),
          ),
          body:
            Stack(
              children: [
                Column(
                  children: [
                    Center(
                      child: Container(
                        padding: topBottomPagePadding,
                        child: Text("Morning, $firstName ",
                          style: const TextStyle( fontSize: 20,fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Center(
                      child: Container( padding: rowBetweenLoginPadding,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Your yard is:", style: TextStyle( fontFamily: "Raleway")),
                            Container(

                              child: TextFormField(
                                controller: textarea,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            OutlinedButton(onPressed: (){}, child: const Text("Change"))
                          ],
                        ),
                      ),
                    ),
                   Center(
                      child: Column(
                        children: <Widget>[
                        Container(
                          width: 350,
                          height: 50,
                          margin: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 0),
                          padding: const EdgeInsets.only(top: 5, left: 5, right: 5, bottom: 0),
                          child: const Text('Ready to add/ release the next vehicle',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: addRelease, color: secondaryOneColor,),
                          ),
                          decoration: BoxDecoration(
                          color: buttonColorText,
                          border: Border.all(
                          color: Colors.black,
                          width: 1,
                          )),
                          ),
                            Container(
                              width: 350,
                              height: 188,
                              margin: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 20),
                              padding: const EdgeInsets.only(top: 0, left: 5, right: 5, bottom: 0),


                              child: OutlinedButton(onPressed: (){},
                                  style: ButtonStyle(
                                      side: MaterialStateProperty.all(
                                          const BorderSide(color: buttonColorBorder, width: 1)
                                      ),
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                      ),
                                      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey)
                                  ),
                                  child: const Text("View all uploads", style: TextStyle(fontSize: addRelease, color: buttonColorText,),
                                  ),
                              ),

                          decoration: BoxDecoration(
                              color: buttonColorText,
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              )),
                        ),

                       BottomBarWidget(),

                  ],
                ),

              )

              ],
            ),

        ]),

    );

  }

}
