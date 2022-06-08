import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/tow_slip_photo.dart';
import 'dart:io';


class SPVehicleIdentifyPage extends StatefulWidget {
  const SPVehicleIdentifyPage({Key? key}) : super(key: key);

  @override
  State<SPVehicleIdentifyPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<SPVehicleIdentifyPage> {
  String accessToken = "";
  String personFirstname = '';
  String personSurname = '';
  String photoLocation = '';
  String mobileNumber = '';
  String vehicleManufacturer = '';
  String vehicleMake = '';
  File? photoFile;



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
                  Center(
                    child: const Text("SPVehicleIdentifyPage",
                      style: TextStyle(
                          fontSize: 25, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  OutlinedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => TowSlipPhotoPage()));
                  },
                    style: ButtonStyle(
                        side: MaterialStateProperty.all(
                            BorderSide(color: Colors.black, width: 20)
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(Colors.black)
                    ),
                    child: const Text("Sign Up",
                      style: TextStyle(
                        color: buttonColorText,

                      ),
                    ), // backgroundColor: Colors.blue
                  ),
                ])
              )
          );
  }
}