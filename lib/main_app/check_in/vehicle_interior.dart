import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_interior_photo.dart';
import 'package:yardapp/size.dart';

class VehicleInteriorPage extends StatefulWidget {
  const VehicleInteriorPage({Key? key}) : super(key: key);

  @override
  State<VehicleInteriorPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleInteriorPage> {
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
                Text("Check into yard", style: TextStyle(color:buttonColorText)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Interior Photos Of The New Vehicle For Your Yard", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      child: Text("Take interior photos of the new vehicle you're adding into your yard", textAlign: TextAlign.center,
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
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/VehicleInteriorPhotoPage');
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

                ])));
  }
}