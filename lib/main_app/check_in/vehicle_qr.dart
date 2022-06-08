import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_qr_scan.dart';
import 'package:yardapp/size.dart';
import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:wakelock/wakelock.dart';
import 'package:hive/hive.dart';

class VehicleQRPage extends StatefulWidget {
  const VehicleQRPage({Key? key}) : super(key: key);

  @override
  State<VehicleQRPage> createState() => _VehicleQRPageState();
}

class _VehicleQRPageState extends State<VehicleQRPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // int radioValue = 0;
  // ScanResult? scanResult;
  //
  // var _aspectTolerance = 0.00;
  // var _selectedCamera = -1;
  // var _useAutoFocus = true;
  // var _autoEnableFlash = false;
  //
  // List<BarcodeFormat> selectedFormats = [BarcodeFormat.qr];
  //
  // String accessToken = "";
  // List matches = [];
  // bool processing = true;
  // bool hasData = false;
  // String error = "";
  // bool disableWidget = false;
  // // File? file;
  // late Box<String> storage;

  // void checkData() async {
  //   storage = Hive.box('firstOnSceneAccident');
  //
  //   setState(() {
  //     try {
  //       String valueTemp = storage.get('scanVehicle') ?? '';
  //       if (valueTemp != '') {
  //         radioValue = int.parse(valueTemp.toString());
  //       }
  //     } catch(e) {}
  //   });
  // }
  @override
  // void initState() {
  //   super.initState();
  //   Wakelock.enable();
  //   _scan();
  // }



  // Future<void> _scan() async {
  //   try {
  //     final result = await BarcodeScanner.scan(
  //       options: ScanOptions(
  //         strings: {
  //           'cancel': 'Cancel',
  //           'flash_on': 'Flash on',
  //           'flash_off': 'Flash off',
  //         },
  //         restrictFormat: selectedFormats,
  //         useCamera: _selectedCamera,
  //         autoEnableFlash: _autoEnableFlash,
  //         android: AndroidOptions(
  //           aspectTolerance: _aspectTolerance,
  //           useAutoFocus: _useAutoFocus,
  //         ),
  //       ),
  //     );
  //     setState(() {
  //       scanResult = result;
  //     });
  //
  //     SharedPreferences prefs = await _prefs;
  //     prefs.setString("qrScanCodeContent", result.rawContent);
  //     prefs.setString("qrScanCodeType", result.type.toString());
  //     prefs.setString("qrScanCodeError", "");
  //
  //   } on PlatformException catch (e) {
  //     setState(() async {
  //       scanResult = ScanResult(
  //         type: ResultType.Error,
  //         format: BarcodeFormat.unknown,
  //         rawContent: e.code == BarcodeScanner.cameraAccessDenied
  //             ? 'The user did not grant the camera permission!'
  //             : 'Unknown error: $e',
  //       );
  //     });
  //
  //     SharedPreferences prefs = await _prefs;
  //     prefs.setString("qrScanCodeContent", "");
  //     prefs.setString("qrScanCodeType", scanResult!.type.toString());
  //     prefs.setString("qrScanCodeError", scanResult!.rawContent.toString());
  //
  //   }
  //   Navigator.of(context)
  //       .pushNamed('/VehicleQRScanPage');
  // }




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
    Container(
      padding: EdgeInsets.only(bottom: 00),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
      Container(
      padding: EdgeInsets.only(left: 35, right: 35, bottom: 00),
      child: const Text("Scan the QR Code attached to the vehicles' windscreen.",
          style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
    ),
            Center(
              child: Container(
                child: SizedBox( height: 400, width: 400,
                    child: Image.asset('assets/images/barcode.PNG')
                ),
              ),
            ),
      Center(
          child:
        SizedBox(
            height: buttonHeight,
            width: buttonWidth,
            child:
            OutlinedButton(
              child: Text('Scan Auction Nation QR Code',
                style: TextStyle(fontSize: 20, color: backgroundColor, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
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
                  Navigator.of(context)
                      .pushNamed('/VehicleQRScanPage');
                // }
              },
            ),
              )
           )]
        ),
      )
    );
  }
}