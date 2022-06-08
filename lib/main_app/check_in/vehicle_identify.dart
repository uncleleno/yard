import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/size.dart';

class VehicleIdentifyPage extends StatefulWidget {
  const VehicleIdentifyPage({Key? key}) : super(key: key);

  @override
  State<VehicleIdentifyPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleIdentifyPage> {

  int vehicleIdentify = 0;
  int vehicleScan = 0;
  bool onInputValidated = true;
  bool scanning = false;
  bool identify = false;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerNumberPlate = TextEditingController();
  final TextEditingController controllerIdentifyReference = TextEditingController();

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
                Text("Check into yard", style: TextStyle(
                    color:buttonColorText)
                ),
                subtitle: Padding(
                  padding: EdgeInsets.only(top:8.0),
                  child: Text("Identify New Vehicle For Your Yard's QR Code", style: TextStyle(color:buttonColorText), overflow: TextOverflow.visible,
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
                      child: Text("Can the vehicle that you are adding to your yard be identified?",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                          vehicleIdentify,
                          onChanged: (value) {
                            setState(() {
                              vehicleIdentify = value!;
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
                          groupValue: vehicleIdentify,
                          onChanged: (value) {
                            setState(() {
                              vehicleIdentify = value!;
                            });
                          }
                      ),
                  ),
                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if (vehicleIdentify == 2)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("Enter the reference number",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  if (vehicleIdentify == 2)
                    Padding(
                      padding: const EdgeInsets.all(textBoxSize),
                      child: TextFormField(
                        onChanged: (String nameText) {
                        },
                        keyboardType:
                        TextInputType.numberWithOptions(signed: true, decimal: false),
                        controller: controllerIdentifyReference,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),

                  if (vehicleIdentify == 1)
                    Center(
                      child: Padding(
                        padding: EdgeInsets.all(28.0),
                        child: Text("Is the vehicle's license disk available for scanning?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

              if (vehicleIdentify == 1)
                    Row(
                      children: [
                        Radio<int>(
                            value: 4,
                            groupValue: vehicleScan,
                            onChanged: (value) {
                              setState(() {
                                vehicleScan = value!;
                              });
                            }
                      ),
                    SizedBox(width: 10.0,),
                    Text('Yes'),
                    ],
                    ),

                if (vehicleIdentify == 1)

                     Row(
                        children: [
                          Radio<int>(
                              value: 3,
                              groupValue: vehicleScan,
                              onChanged: (value) {
                                setState(() {
                                  vehicleScan = value!;
                                });
                              }
                          ),
                          SizedBox(width: 10.0,),
                          Text('No'),
                        ],
                      ),


                  if (vehicleScan == 3)
                    if ( vehicleIdentify != 2)
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


                  if (vehicleScan == 3)
                    if ( vehicleIdentify != 2)
                    // Visibility(
                    //     visible: identify,
                    //     child:
                    Container(
                      padding: EdgeInsets.all(textBoxSize),
                      child: TextFormField(
                        // onChanged: (String nameText) {
                        //   nameAndNumber();
                        // },
                        controller: controllerNumberPlate,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),
                    // ),

                  // Continue Button For "Can the vehicle that you are are adding to your yard be identified? No
                  if ( vehicleIdentify == 2)
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
                              onPressed: () async {
                                SharedPreferences prefs = await _prefs;
                                prefs.setString('controllerIdentifyReference', controllerIdentifyReference.text);


                                  Navigator.pushNamed(context, '/VehicleDeliveredPage');

                              },
                            ),
                          ),
                        )
                    ),

                  // Number Plate Continue Button
                  if (vehicleScan == 3)
                    if ( vehicleIdentify != 2)
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
                          onPressed: () async {
                            SharedPreferences prefs = await _prefs;
                            prefs.setString('controllerNumberPlate', controllerNumberPlate.text);




                              Navigator.pushNamed(context, '/VehicleDeliveredPage');

                          },
                        ),
                      )
                  ),


                if(vehicleScan == 4)
                if(vehicleIdentify == 1)
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
                          onPressed: () async {
                            SharedPreferences prefs = await _prefs;

                            prefs.setInt('vehicleIdentify', vehicleIdentify);
                            prefs.setInt('vehicleIdentify', vehicleScan);


                              Navigator.pushNamed(context, '/VehicleScanLicensePage');

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