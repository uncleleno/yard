import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/main_app.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';

class VehicleCheckListSignOffPage extends StatefulWidget {
  const VehicleCheckListSignOffPage({Key? key}) : super(key: key);

  @override
  State<VehicleCheckListSignOffPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleCheckListSignOffPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String firstName = "";
  int vehicleJackAndSpanner = 0;
  int vehicleDashCam = 0;
  int vehicleKeys = 0;
  int vehicleETag = 0;
  int vehicleSDCard = 0;
  int vehicleGPS = 0;
  int vehiclePillarA = 0;
  int vehiclePillarB = 0;
  int vehicleAirbag = 0;
  int vehicleSpareWheel = 0;
  int vehicleBattery = 0;

  @override
  void initState() {
    super.initState();
    getInitialValues();
  }





  void getInitialValues() async {
    final SharedPreferences prefs = await _prefs;

    debugPrint(prefs.getKeys().toList().toString());


    setState(() {
      firstName = prefs.getString('firstName') ?? '';
      vehicleJackAndSpanner = prefs.getInt('vehicleJackAndSpanner') ?? 0;
      vehicleDashCam = prefs.getInt('vehicleDashCam') ?? 0;
      vehicleKeys = prefs.getInt('vehicleKeys') ?? 0;
       vehicleETag = prefs.getInt('vehicleETag') ?? 0;
       vehicleSDCard = prefs.getInt('vehicleSDCard') ?? 0;
       vehicleGPS = prefs.getInt('vehicleGPS') ?? 0;
       vehiclePillarA = prefs.getInt('vehiclePillarA') ?? 0;
       vehiclePillarB = prefs.getInt('vehiclePillarB') ?? 0;
       vehicleAirbag = prefs.getInt('vehicleAirbag') ?? 0;
       vehicleSpareWheel = prefs.getInt('vehicleSpareWheel') ?? 0;
       vehicleBattery = prefs.getInt('vehicleBattery') ?? 0;
    });

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
                  child: Text("Vehicle Checklist Sign Off", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("I, the undersigned, $firstName accept and agree to the following",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("2. The vehicle checklist has been recorded correctly including the specific items listed below.",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        ( vehicleJackAndSpanner == 1)?
                        Icon(Icons.check_circle, size: resizeToScreenWidth(context, iconSize), color: secondaryOneColor)
                            :
                        Icon(Icons.cancel, size: resizeToScreenWidth(context, iconSize), color: primaryTwoColor),

                        Text(
                          "  ",
                          softWrap: true,
                          style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                            color: primaryThreeColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "The jack and wheel spanner is present.",
                            softWrap: true,
                            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                              color: primaryThreeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        ( vehicleDashCam == 1)?
                        Icon(Icons.check_circle, size: resizeToScreenWidth(context, iconSize), color: secondaryOneColor)
                            :
                        Icon(Icons.cancel, size: resizeToScreenWidth(context, iconSize), color: primaryTwoColor),

                        Text(
                          "  ",
                          softWrap: true,
                          style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                            color: primaryThreeColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "The dash cam is present.",
                            softWrap: true,
                            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                              color: primaryThreeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        ( vehicleKeys == 1)?
                        Icon(Icons.check_circle, size: resizeToScreenWidth(context, iconSize), color: secondaryOneColor)
                            :
                        Icon(Icons.cancel, size: resizeToScreenWidth(context, iconSize), color: primaryTwoColor),

                        Text(
                          "  ",
                          softWrap: true,
                          style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                            color: primaryThreeColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "The keys is present.",
                            softWrap: true,
                            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                              color: primaryThreeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        ( vehicleETag == 1)?
                        Icon(Icons.check_circle, size: resizeToScreenWidth(context, iconSize), color: secondaryOneColor)
                            :
                        Icon(Icons.cancel, size: resizeToScreenWidth(context, iconSize), color: primaryTwoColor),

                        Text(
                          "  ",
                          softWrap: true,
                          style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                            color: primaryThreeColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "The e Tag is present.",
                            softWrap: true,
                            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                              color: primaryThreeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: textPadding,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        ( vehicleGPS == 1)?
                        Icon(Icons.check_circle, size: resizeToScreenWidth(context, iconSize), color: secondaryOneColor)
                            :
                        Icon(Icons.cancel, size: resizeToScreenWidth(context, iconSize), color: primaryTwoColor),

                        Text(
                          "  ",
                          softWrap: true,
                          style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                            color: primaryThreeColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "The GPS is present.",
                            softWrap: true,
                            style: TextStyle(fontSize: resizeToScreenWidth(context, fontSizeText),
                              color: primaryThreeColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                  OutlinedButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainAppPage()));
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

                ])));
  }
}