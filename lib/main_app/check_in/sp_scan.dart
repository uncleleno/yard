import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/sp_vehicle_identify.dart';
import 'package:yardapp/size.dart';

class SPScanPage extends StatefulWidget {
  const SPScanPage({Key? key}) : super(key: key);

  @override
  State<SPScanPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<SPScanPage> {
  int _towVehicleIdentify = 0;


  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerSPNumberPlate = TextEditingController();
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
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: secondaryOverlayColor,
              elevation: 5, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
              title:
              const ListTile(
                title:
                Text("Check into yard", style: TextStyle(color:buttonColorText)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Scan SP's Vehicle License Disk",
                    style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
                  ),
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
                        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
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
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("Is the license disk of the service provider's tow vehicle abailable for scanning?",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                          _towVehicleIdentify,
                          onChanged: (value) {
                            setState(() {
                              _towVehicleIdentify = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [

                        Radio<int>(
                            value: 2,
                            groupValue: _towVehicleIdentify,
                            onChanged: (value) {
                              setState(() {
                                _towVehicleIdentify = value!;
                              });
                            }
                        ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if (_towVehicleIdentify == 2)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28.0, right: 28.0),
                        child: Text("Enter the license plate number of the number of the service provider's vehicle:",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  if (_towVehicleIdentify == 2)
                    Padding(
                      padding: const EdgeInsets.all(textBoxSize),
                      child: TextFormField(
                        onChanged: (String nameText) {
                        },
                        keyboardType:
                        TextInputType.numberWithOptions(signed: true, decimal: false),
                        // controller: controllerPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidthTwo,
                          child: OutlinedButton(
                            child: Text('Skip',
                              style: TextStyle(fontSize: fontSizeButtonText, color: Colors.red, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
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
                                Navigator.pushNamed(context, '/TowSlipPhotoPage');
                              }
                            },
                          ),
                        ),
                        SizedBox(width: 100),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidthTwo,
                          child:
                          OutlinedButton(
                            onPressed: () async {

                              SharedPreferences prefs = await _prefs;


                              prefs.setInt('_towVehicleIdentify', _towVehicleIdentify);

                              prefs.setString('SPNumberPlateValue', controllerSPNumberPlate.text);

                            Navigator.pushNamed(context, '/SPScanLicensePage');
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
                              style: TextStyle(fontSize: fontSizeButtonText, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                            ),
                          ), // backgroundColor: Colors.blue
                        ),


                      ],

                    ),
                  ),
                ]
            )
        )
    );
  }
}