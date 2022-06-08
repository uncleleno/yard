import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_exterior_photo.dart';
import 'package:yardapp/size.dart';

class ClientVehicleExteriorPage extends StatefulWidget {
  const ClientVehicleExteriorPage({Key? key}) : super(key: key);

  @override
  State<ClientVehicleExteriorPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<ClientVehicleExteriorPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90.0),
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
                  child: Text("Exterior Photos Of The Vehicle", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0, left: 10, right: 10),
                      child: Text("Get ready to take exterior photos photos of the new vehicle you're release from your yard", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      child: SizedBox( height: 400, width: 400,
                          child: Image.asset('assets/images/car.PNG')
                      ),
                    ),
                  ),
                  SizedBox(
                    height: buttonHeight,
                    width: buttonWidthTwo,
                    child:
                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/ClientVehicleExteriorPhotoPage');
                      },
                      style: ButtonStyle(

                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadiusButton),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                      ),
                      child: const Text("Take Photos",
                        style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                      ),
                    ),
                  ), //,

                ])
        )
    );
  }
}