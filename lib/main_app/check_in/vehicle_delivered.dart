
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'package:yardapp/color.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yardapp/main_app/check_in/sp_details.dart';
import 'package:yardapp/size.dart';

class VehicleDeliveredPage extends StatefulWidget {
  const VehicleDeliveredPage({Key? key}) : super(key: key);

  @override
  State<VehicleDeliveredPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleDeliveredPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // Initial Selected Value

  String dropdownvalue = 'Choose Tow Company';

  // List of items in our dropdown menu
  var items = [
    'Choose Tow Company',
    'AB Towing',
    'BB Towing',
    'Not Listed',

  ];
  @override


  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back, color: buttonColorText, size: 35.0,
                ),
                onPressed: () => Navigator.of(context).pop,
              ),
              backgroundColor: secondaryOverlayColor,
              elevation: 5, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
              title:
              const ListTile(
                title:
                Text("Check into yard \n ", style: TextStyle(color:buttonColorText, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold)),
                subtitle: Text("Who Delivered The Vehicle?",
                  style: TextStyle(color:buttonColorText,fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
              ),

              actions: [
                OutlinedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          const BorderSide(color: primaryTwoColor)
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(primaryTwoColor)
                  ),
                  child: const Text("Manage Job",
                    style: TextStyle(
                        color: buttonColorText,
                        fontFamily: "Raleway", fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ]),
        ),
        body:
        Center(
            child: ListView(

              children: [
                Container(
                  padding: const EdgeInsets.only(top: headerPaddingTop, bottom: headerPaddingBottom),
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0, left: 42.0, right: 42.0, bottom: 20.0),
                    child: Text("Before adding the vehicle to your yard tell us which tow company delivered the vehicle to you  "
                      ,style: TextStyle( fontSize: 15, fontFamily: "Raleway-Bold",  ),
                    ),
                  ),
                ),
                Center(
                  child: Container( padding: EdgeInsets.only(bottom: 300),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Select 'not listed' if you can't find the tow company", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                          DropdownButton(

                            // Initial Value
                            value: dropdownvalue,

                            // Down Arrow Icon
                            icon: const Icon(Icons.keyboard_arrow_down),

                            // Array list of items
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            // After selecting the desired option,it will
                            // change button value to selected value
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ]),
                  ),
                ),

                 Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: buttonHeight,
                        width: buttonWidthTwo,
                        child: OutlinedButton(
                          child: Text('Skip',
                            style: TextStyle(fontSize: 15, color: Colors.red, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: signUpButton, width: borderWidth)
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(borderRadiusButton),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(buttonColorText)
                          ),
                          onPressed: () {
                            {
                              Navigator.pushNamed(context, '/SPDetailsPage');
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 100),
                      SizedBox(
                        height: buttonHeight,
                         width: buttonWidthTwo,
                        child:
                        OutlinedButton(onPressed: () {
                          Navigator.pushNamed(context, '/SPDetailsPage');
                        },
                          style: ButtonStyle(

                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(borderRadiusButton),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                          ),
                          child: const Text("Continue",
                            style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                                ),
                          ), // backgroundColor: Colors.blue
                        ),


                    ],

                  ),
              ],
            )
        )
    );
  }
}