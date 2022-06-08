import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_interior_additional_photo.dart';
import 'package:yardapp/size.dart';

class VehicleRadioPage extends StatefulWidget {
  const VehicleRadioPage({Key? key}) : super(key: key);

  @override
  State<VehicleRadioPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleRadioPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerRadioName = TextEditingController();
  bool onInputValidated = true;

  void radioName () {
    // print("-----------");
    // print("controllerName.text: ${controllerName.text.isNotEmpty}");
    // print("controllerMobile.text: ${controllerMobile.text.isNotEmpty}");

    if (controllerRadioName.text.isNotEmpty == true) {
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
                  child: Text("Radio Make/Model", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      child: Text("Enter the make/model of the radio:", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      onChanged: (String nameText) {
                        radioName();
                      },
                      controller: controllerRadioName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),

                  Center(
                      child:
                      Padding(
                        padding: const EdgeInsets.only(top: 300.0),
                        child: SizedBox(
                            height: buttonHeight,
                            width: buttonWidth,
                            child:
                            AbsorbPointer(
                              absorbing: onInputValidated,
                              child:
                              OutlinedButton(
                                // onFocusChange: toggleSwitch,
                                onPressed: () async {
                                  final SharedPreferences prefs = await _prefs;
                                  // Save an integer value to 'counter' key.
                                  // await prefs.setInt('counter', 10);
                                  // Save an boolean value to 'repeat' key.
                                  // await prefs.setBool('repeat', true);
                                  // Save an double value to 'decimal' key.
                                  // await prefs.setDouble('decimal', 1.5);
                                  // Save an String value to 'action' key.
                                  await prefs.setString('radioName', controllerRadioName.text);



                                  Navigator.pushNamed(context, '/VehicleInteriorAdditionalPhotoPage');
                                },
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        BorderSide(color: otpButtonBackground, width: borderWidth)
                                    ),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(borderRadiusButton),
                                      ),
                                    ),
                                    backgroundColor: (onInputValidated == true)? MaterialStateProperty.all<Color>(otpButtonBackground): MaterialStateProperty.all<Color>(acceptButton)
                                ),
                                child: const Text("Continue",
                                  style: TextStyle(
                                      color: buttonColorText,
                                      fontSize: buttonSizeText, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                ), // backgroundColor: Colors.blue
                              ),
                            )),
                      )
                  ),

                ])));
  }
}