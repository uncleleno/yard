import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_delivered.dart';
import 'package:yardapp/size.dart';

class VehicleDescriptionPage extends StatefulWidget {
  const VehicleDescriptionPage({Key? key}) : super(key: key);


  State<VehicleDescriptionPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleDescriptionPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerNumberPlate = TextEditingController();
  bool isChecked = false;

  String accessToken = "";
  List matches = [];
  bool processing = true;
  bool hasData = false;
  String error = "";
  bool disableWidget = false;
  String diskScanCode = "";
  String diskScanCodeMyTemp = "";
  String diskScanCodeError = "";

  String municipalAuthority = "";
  String municipalCode = "";
  String registerAuthorization = "";
  String municipalType = "";
  String licenseDiskNumber = "";
  String licenceNumber = "";
  String vehicleRegistrationNumber = "";
  String vehicleDescription = "";
  String vehicleManufacturer = "";
  String vehicleMake = "";
  String vehicleColour = "";
  String vehicleVin = "";
  String vehicleEngineNo = "";
  String dateOfExpiry = "";

  late Box<String> storage;

  @override

  void checkDiskScannedCode() async {
    SharedPreferences prefs = await _prefs;
    String? diskScanCodeContentTemp = prefs.getString("diskScanCodeContent");
    // String? diskScanCodeTypeTemp = prefs.getString("diskScanCodeType");
    String? diskScanCodeErrorTemp = prefs.getString("diskScanCodeError");
    if (diskScanCodeErrorTemp == null || diskScanCodeErrorTemp == '') {
    } else {
      setState(() {
        diskScanCodeError = diskScanCodeErrorTemp;
      });
    }

    extractDiskScannedCode(diskScanCodeContentTemp);

    prefs.setString("diskScanCodeContent", "");
    prefs.setString("diskScanCodeType", "");
    prefs.setString("diskScanCodeError", "");
  }

  void extractDiskScannedCode(String? diskScanCodeContentTemp) async {
    if (diskScanCodeContentTemp == null || diskScanCodeContentTemp == '') {
    } else {
      String diskScanCodeTempStrip = diskScanCodeContentTemp.substring(1, diskScanCodeContentTemp.length-1);
      List<String> result = diskScanCodeTempStrip.split('%');

      setState(() {
        diskScanCode = diskScanCodeContentTemp;
        try {
          municipalAuthority = result[0];
        } catch(e) {}
        try {
          municipalCode = result[1];
        } catch(e) {}
        try {
          registerAuthorization = result[2];
        } catch(e) {}
        try {
          municipalType = result[3];
        } catch(e) {}
        try {
          licenseDiskNumber = result[4];
        } catch(e) {}
        try {
          licenceNumber = result[5];
        } catch(e) {}
        try {
          vehicleRegistrationNumber = result[6];
        } catch(e) {}
        try {
          vehicleDescription = result[7];
        } catch(e) {}
        try {
          vehicleManufacturer = result[8];
        } catch(e) {}
        try {
          vehicleMake = result[9];
        } catch(e) {}
        try {
          vehicleColour = result[10];
        } catch(e) {}
        try {
          vehicleVin = result[11];
        } catch(e) {}
        try {
          vehicleEngineNo = result[12];
        } catch(e) {}
        try {
          dateOfExpiry = result[13];
        } catch(e) {}
        diskScanCodeError = "";
      });
    }
  }
  void checkData() async {

    setState(() {
      try {
        String valueTemp1 = storage.get('thirdPartyMunicipalAuthority') ?? '';
        if (valueTemp1 != '') {
          municipalAuthority = valueTemp1;
        }
      } catch(e) {}
      try {
        String valueTemp2 = storage.get('thirdPartyMunicipalCode') ?? '';
        if (valueTemp2 != '') {
          municipalCode = valueTemp2;
        }
      } catch(e) {}
      try {
        String valueTemp3 = storage.get('thirdPartyRegisterAuthorization') ?? '';
        if (valueTemp3 != '') {
          registerAuthorization = valueTemp3;
        }
      } catch(e) {}
      try {
        String valueTemp4 = storage.get('thirdPartyMunicipalType') ?? '';
        if (valueTemp4 != '') {
          municipalType = valueTemp4;
        }
      } catch(e) {}
      try {
        String valueTemp5 = storage.get('thirdPartyLicenseDiskNumber') ?? '';
        if (valueTemp5 != '') {
          licenseDiskNumber = valueTemp5;
        }
      } catch(e) {}
      try {
        String valueTemp6 = storage.get('thirdPartyLicenceNumber') ?? '';
        if (valueTemp6 != '') {
          licenceNumber = valueTemp6;
        }
      } catch(e) {}
      try {
        String valueTemp7 = storage.get('thirdPartyVehicleRegistrationNumber') ?? '';
        if (valueTemp7 != '') {
          vehicleRegistrationNumber = valueTemp7;
        }
      } catch(e) {}
      try {
        String valueTemp8 = storage.get('thirdPartyVehicleDescription') ?? '';
        if (valueTemp8 != '') {
          vehicleDescription = valueTemp8;
        }
      } catch(e) {}
      try {
        String valueTemp9 = storage.get('thirdPartyVehicleManufacturer') ?? '';
        if (valueTemp9 != '') {
          vehicleManufacturer = valueTemp9;
        }
      } catch(e) {}
      try {
        String valueTemp10 = storage.get('thirdPartyVehicleMake') ?? '';
        if (valueTemp10 != '') {
          vehicleMake = valueTemp10;
        }
      } catch(e) {}
      try {
        String valueTemp11 = storage.get('thirdPartyVehicleColour') ?? '';
        if (valueTemp11 != '') {
          vehicleColour = valueTemp11;
        }
      } catch(e) {}
      try {
        String valueTemp12 = storage.get('thirdPartyVehicleVin') ?? '';
        if (valueTemp12 != '') {
          vehicleVin = valueTemp12;
        }
      } catch(e) {}
      try {
        String valueTemp13 = storage.get('thirdPartyVehicleEngineNo') ?? '';
        if (valueTemp13 != '') {
          vehicleEngineNo = valueTemp13;
        }
      } catch(e) {}
      try {
        String valueTemp14 = storage.get('thirdPartyDateOfExpiry') ?? '';
        if (valueTemp14 != '') {
          dateOfExpiry = valueTemp14;
        }
      } catch(e) {}
    });

    checkDiskScannedCode();
  }
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.red;
    }

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
                child: Text("Identify The New Vehicle For Your Yard", style: TextStyle(color:buttonColorText, fontFamily: "Raleway",  ),
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
      Stack(
          children: [
          Container(
            width: 650,
            height: 488,
            margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
            padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
            decoration: BoxDecoration(
                color: buttonColorText,
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ), borderRadius: BorderRadius.circular(15.0)
            ),

            // child: Center(
              child: ListView(
                children: [Container( padding: rowBetweenLoginPadding,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("Does the below license disk details match the actual vehicle?",
                          style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)
                      ),
                    ],
                  ),
                ),
                  Container( padding: rowBetweenLoginPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Make/model:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                        Container(
                          child: TextFormField(
                            // controller: textarea,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container( padding: rowBetweenLoginPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Colour:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                        Container(
                          child: TextFormField(
                            // controller: textarea,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container( padding: rowBetweenLoginPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Vin:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                        Container(
                          child: TextFormField(
                            // controller: textarea,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Container( padding: rowBetweenLoginPadding,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("License Plate Number:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                        Container(
                          child: TextFormField(
                            // controller: textarea,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              )
            // ),
          ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(top: 510),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    height: buttonHeight,
                    width: buttonWidthTwo,
                    child: OutlinedButton(
                      child: Text("No it's wrong",
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
                          Navigator.pushNamed(context, '/WrongLicenseDiskPage');
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
                      Navigator.pushNamed(context, '/VehicleDeliveredPage');
                    },
                      style: ButtonStyle(

                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadiusButton),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                      ),
                      child: const Text("Yes, it's correct",
                        style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                      ),
                    ), // backgroundColor: Colors.blue
                  ),


                ],
              ),
            ),
      ],
    )
    );
  }
}