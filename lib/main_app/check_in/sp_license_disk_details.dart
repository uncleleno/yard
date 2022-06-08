import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/main_app/check_in/vehicle_exterior.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';
import '../../color.dart';

class SPLicenseDiskPage extends StatefulWidget {
  const SPLicenseDiskPage({Key? key}) : super(key: key);

  @override
  State<SPLicenseDiskPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<SPLicenseDiskPage> {
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
                  child: Text("Identify The New Vehicle For Your Yard", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
            ListView(
            children: [
                    Container(
                        padding: topBottomPagePadding,
                    ),

                Container(
                  padding: textPadding,
                  child: Text(
                    "Does the below license disk details match the actual vehicle?",
                    textAlign: TextAlign.left,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                        color: primaryThreeColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),

        if (diskScanCodeError != "")
              Container(
                padding: bottomBarOnePadding,
                child: Text(
                  "Error: " + diskScanCodeError,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                      color: primaryTwoColor,
                      fontWeight: FontWeight.bold),
                ),
              ),

                Container(
                padding: rowBetweenPadding,
                ),

                Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Text(
                    'Manufacturer:',
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                    color: primaryThreeColor, fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                  Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child:
                  Container(
                    padding: boxPadding,
                    alignment: Alignment.center,
                    // width: resizeToScreenWidth(context, textBoxWidth),
                        height: resizeToScreenHeight(context, textBoxHeight),
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(borderRadius),
                        // color: backgroundColor,
                    border: Border(
                      top: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                      left: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                      right: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                      bottom: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    ),
                  ),
                  child:
                  Container(
                      padding: textBoxPadding,
                      alignment: Alignment.centerLeft,
                      child:
                      Text(
                        vehicleManufacturer,
                        softWrap: true,
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: primaryThreeColor),
                        ),
                      ),
                    ),
                  ),

                    Container(
                    padding: rowBetweenPadding,
                    ),

                    Container(
                        padding: textPadding,
                        alignment: Alignment.centerLeft,
                        child: Text(
                        'Model:',
                        softWrap: true,
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                        color: primaryThreeColor, fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    Container(
                      padding: textPadding,
                      alignment: Alignment.centerLeft,
                      child:
                    Container(
                      padding: boxPadding,
                      alignment: Alignment.center,
                      // width: resizeToScreenWidth(context, textBoxWidth),
                      height: resizeToScreenHeight(context, textBoxHeight),
                      decoration:
                      BoxDecoration(
                        borderRadius:
                          BorderRadius.circular(borderRadius),
                        // color: backgroundColor,
                      border: Border(
                      top: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                      left: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                      right: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                      bottom: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                      ),
                      ),
                      child:
                    Container(
                      padding: textBoxPadding,
                      alignment: Alignment.centerLeft,
                      child:
                    Text(
                        vehicleMake,
                        softWrap: true,
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: primaryThreeColor),
                        ),
                        ),
                      ),
                    ),

                      Container(
                      padding: rowBetweenPadding,
                    ),

                  Container(
                      padding: textPadding,
                      alignment: Alignment.centerLeft,
                      child: Text(
                      'Colour:',
                      softWrap: true,
                      style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                      color: primaryThreeColor, fontWeight: FontWeight.bold
                      ),
                      ),
                  ),

                Container(
                  padding: textPadding,
                  alignment: Alignment.centerLeft,
                  child:
                Container(
                    padding: boxPadding,
                    alignment: Alignment.center,
                    // width: resizeToScreenWidth(context, textBoxWidth),
                    height: resizeToScreenHeight(context, textBoxHeight),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    // color: backgroundColor,
                    border: Border(
                    top: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    left: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    right: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    bottom: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    ),
                    ),
                    child:
                Container(
                    padding: textBoxPadding,
                    alignment: Alignment.centerLeft,
                    child:
                Text(
                    vehicleColour,
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: primaryThreeColor),
                    ),
                    ),
                ),
                ),

                Container(
                  padding: rowBetweenPadding,
                ),

                Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Text(
                    'Vin:',
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                    color: primaryThreeColor, fontWeight: FontWeight.bold
                    ),
                  ),
                ),


                Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child:
                Container(
                    padding: boxPadding,
                    alignment: Alignment.center,
                    // width: resizeToScreenWidth(context, textBoxWidth),
                    height: resizeToScreenHeight(context, textBoxHeight),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    // color: backgroundColor,
                  border: Border(
                  top: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                  left: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                  right: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                  bottom: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                  ),
                ),
                  child:
                  Container(
                      padding: textBoxPadding,
                      alignment: Alignment.centerLeft,
                      child:
                    Text(
                      vehicleVin,
                      softWrap: true,
                      style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: primaryThreeColor),
                      ),
                    ),
                ),
                ),

                Container(
                   padding: rowBetweenPadding,
                ),

                Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Text(
                    'Licence plate number:',
                    softWrap: true,
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                    color: primaryThreeColor, fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child:
                Container(
                    padding: boxPadding,
                    alignment: Alignment.center,
                    // width: resizeToScreenWidth(context, textBoxWidth),
                    height: resizeToScreenHeight(context, textBoxHeight),
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(borderRadius),
                    // color: backgroundColor,
                    border: Border(
                    top: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    left: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    right: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    bottom: BorderSide(color: secondaryOneColor, width: borderWidth, style: BorderStyle.solid),
                    ),
                    ),
                      child:
                  Container(
                        padding: textBoxPadding,
                        alignment: Alignment.centerLeft,
                        child:
                  Text(
                      licenceNumber,
                      softWrap: true,
                      style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText), color: primaryThreeColor),
                      ),
                    ),
                  ),
                ),

                Container(
                    padding: rowBetweenPadding,
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                SizedBox(
                    width: resizeToScreenWidth(context, buttonWidthTwo),
                    height: resizeToScreenHeight(context, buttonHeight),
                    child:
                OutlinedButton(
                    child: Text("No, it's wrong",
                    style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeButtonText), color: primaryTwoColor),
                    ),
                    style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    ),
                    ),
                    side: MaterialStateProperty.all(BorderSide(width: borderWidth, color: primaryTwoColor)),
                    backgroundColor: MaterialStateProperty.all<Color>(backgroundColor)
                    ),
                    onPressed: () {
                    setState(() {
                    Navigator.of(context)
                        .pushNamed('/SPWrongLicenseDiskPage');
                    });
                  },
                  ),
                ),

                if (licenceNumber != '' && vehicleManufacturer != '' && vehicleMake != ''  &&
                vehicleVin != '' && dateOfExpiry != '')

                SizedBox(
                  width: resizeToScreenWidth(context, buttonWidthTwo),
                  height: resizeToScreenHeight(context, buttonHeight),
                  child:
                    OutlinedButton(
                        child: Text("Yes, it's correct",
                        style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeButtonText), color: backgroundColor),
                ),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(borderRadius),
                    ),
                ),
                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                ),
                onPressed: () {
                  // storage.put('thirdPartyDiskScanCode', diskScanCode);
                  // storage.put('thirdPartyMunicipalAuthority', municipalAuthority);
                  // storage.put('thirdPartyMunicipalCode', municipalCode);
                  // storage.put('thirdPartyRegisterAuthorization', registerAuthorization);
                  // storage.put('thirdPartyMunicipalType', municipalType);
                  // storage.put('thirdPartyLicenseDiskNumber', licenseDiskNumber);
                  // storage.put('thirdPartyLicenceNumber', licenceNumber);
                  // storage.put('thirdPartyVehicleRegistrationNumber', vehicleRegistrationNumber);
                  // storage.put('thirdPartyVehicleDescription', vehicleDescription);
                  // storage.put('thirdPartyVehicleManufacturer', vehicleManufacturer);
                  // storage.put('thirdPartyVehicleMake', vehicleMake);
                  // storage.put('thirdPartyVehicleColour', vehicleColour);
                  // storage.put('thirdPartyVehicleVin', vehicleVin);
                  // storage.put('thirdPartyVehicleEngineNo', vehicleEngineNo);
                  // storage.put('thirdPartyDateOfExpiry', dateOfExpiry);

                Navigator.of(context)
                    .pushNamed;
                        },
                      ),
                    ),
                  ],
                ),

                Container(
                    padding: topBottomPagePadding,
                      ),

              ],
          ),

            // ),

          ],
        )
    );
  }
}