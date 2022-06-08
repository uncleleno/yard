import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_delivered.dart';
import 'package:yardapp/size.dart';


class ClientWrongLicenseDiskPage extends StatefulWidget {
  const ClientWrongLicenseDiskPage({Key? key}) : super(key: key);

  @override
  State<ClientWrongLicenseDiskPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<ClientWrongLicenseDiskPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerNumberPlate = TextEditingController();
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
                Text("Vehicle client release", style: TextStyle(color:buttonColorText)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Wrong License Disk", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                  Container( padding: rowBetweenLoginPadding,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 20),
                              child: const Text("Enter the license plate number of the vehicle:",
                                  style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                            ),
                            Container(
                              child: TextFormField(
                                controller: controllerNumberPlate,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 350.0),
                              child: Center(
                                  child:
                                  SizedBox(
                                    height: buttonHeight,
                                    width: buttonWidth,
                                    child:
                                    OutlinedButton(
                                      child: Text( "Continue",
                                        style: TextStyle(
                                            fontSize: fontSizeButtonText, color: backgroundColor, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
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
                                          Navigator.pushNamed(context, '/ClientVehicleExteriorPage');
                                        }
                                      },
                                    ),

                                  )
                              ),
                            )

                          ]
                      )
                  )
                ])
        )
    )
    ;
  }
}