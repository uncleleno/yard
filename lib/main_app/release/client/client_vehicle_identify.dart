import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/size.dart';

class ClientVehicleIdentifyPage extends StatefulWidget {
  const ClientVehicleIdentifyPage({Key? key}) : super(key: key);

  @override
  State<ClientVehicleIdentifyPage> createState() => _ClientVehicleIdentifyPageState();
}

class _ClientVehicleIdentifyPageState extends State<ClientVehicleIdentifyPage> {

  int _vehicleIdentify = 0;
  int _vehicleScan = 0;
  bool onInputValidated = true;
  bool scanning = false;
  bool identify = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerNumberPlate = TextEditingController();

  void nameAndNumber () {


    if (controllerNumberPlate.text.isNotEmpty == true ) {
      setState(() {
        onInputValidated = false;
      });
    } else {
      setState(() {
        onInputValidated = true;
      });
    }
  }


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
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title:
              const ListTile(
                title:
                Text("Vehicle client release", style: TextStyle(
                    color:buttonColorText)
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top:8.0),
                  child: Text("Identify Vehicle", style: TextStyle(color:buttonColorText), overflow: TextOverflow.visible,
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
                      child: Text("Can the vehicle that you are releasing from yard be identified?",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                          _vehicleIdentify,
                          onChanged: (value) {
                            setState(() {
                              _vehicleIdentify = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      AbsorbPointer(
                        absorbing: identify,
                        child:
                        Radio<int>(
                            value: 2,
                            groupValue: _vehicleIdentify,
                            onChanged: (value) {
                              setState(() {
                                _vehicleIdentify = value!;
                              });
                            }
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if (_vehicleIdentify == 2)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.all(28.0),
                        child: Text("Enter the reference number",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  if (_vehicleIdentify == 2)
                    Padding(
                      padding: const EdgeInsets.all(textBoxSize),
                      child: TextFormField(
                        onChanged: (String nameText) {
                        },
                        keyboardType:
                        TextInputType.numberWithOptions(signed: true, decimal: false),
                        // controller: controllerPassword,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),

                  if (_vehicleIdentify == 1)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(28.0),
                        child: Text("Is the vehicle's license disk available for scanning?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  if (_vehicleIdentify == 1)
                    Row(
                      children: [
                        Radio<int>(
                            value: 4,
                            groupValue: _vehicleScan,
                            onChanged: (value) {
                              setState(() {
                                _vehicleScan = value!;
                              });
                            }
                        ),
                        SizedBox(width: 10.0,),
                        Text('Yes'),
                      ],
                    ),

                  if (_vehicleIdentify == 1)

                    Row(
                      children: [
                        Radio<int>(
                            value: 3,
                            groupValue: _vehicleScan,
                            onChanged: (value) {
                              setState(() {
                                _vehicleScan = value!;
                              });
                            }
                        ),
                        SizedBox(width: 10.0,),
                        Text('No'),
                      ],
                    ),


                  if (_vehicleScan == 3)
                    if ( _vehicleIdentify != 2)
                    // Visibility(
                    //     visible: identify,
                    //     child:
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(top: 10.0, left: 20, right: 20, bottom: 0),
                          child: Text("Enter Number Plate",
                            style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                  // ),


                  if (_vehicleScan == 3)
                    if ( _vehicleIdentify != 2)
                    // Visibility(
                    //     visible: identify,
                    //     child:
                      Container(
                        padding: EdgeInsets.all(textBoxSize),
                        child: TextFormField(
                          onChanged: (String nameText) {
                            nameAndNumber();
                          },
                          controller: controllerNumberPlate,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                            ),
                          ),
                        ),
                      ),
                  // ),

                  // Continue Button For "Can the vehicle that you are are adding to your yard be identified? No
                  if ( _vehicleIdentify == 2)
                    Center(
                        child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            height: buttonHeight,
                            width: buttonWidth,
                            child:
                            OutlinedButton(
                              child: Text('Continue',
                                style: TextStyle(fontSize: 20, color: backgroundColor, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(borderRadiusButton),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                              ),
                              onPressed: () {
                                {
                                  Navigator.pushNamed(context, '/ClientVehicleDeliveredPage');
                                }
                              },
                            ),
                          ),
                        )
                    ),

                  // Other Continue Button
                  if (_vehicleScan == 3)
                    if ( _vehicleIdentify != 2)
                      Center(
                          child:
                          SizedBox(
                            height: buttonHeight,
                            width: buttonWidth,
                            child:
                            OutlinedButton(
                              child: Text('Continue',
                                style: TextStyle(fontSize: 20, color: backgroundColor, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(

                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(borderRadiusButton),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                              ),
                              onPressed: () {
                                {
                                  Navigator.pushNamed(context, '/ClientVehicleDeliveredPage');
                                }
                              },
                            ),
                          )
                      ),


                  if(_vehicleScan == 4)
                    if(_vehicleIdentify == 1)
                      Center(
                          child:
                          SizedBox(
                            height: buttonHeight,
                            width: buttonWidth,
                            child:
                            OutlinedButton(
                              child: Text( "Scan license disk",
                                style: TextStyle(
                                    fontSize: 20, color: backgroundColor, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                              ),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(

                                      borderRadius: BorderRadius.circular(borderRadiusButton),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                              ),
                              onPressed: () {
                                {
                                  Navigator.pushNamed(context, '/ClientVehicleScanLicensePage');
                                }
                              },
                            ),

                          )
                      )
                ]
            )
        )
    );
  }
}