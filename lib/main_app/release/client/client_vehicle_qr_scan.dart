import 'dart:io';

import 'package:barcode_scan2/barcode_scan2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock/wakelock.dart';
import 'package:yardapp/color.dart';

class ClientVehicleQRScanPage extends StatefulWidget {
  const ClientVehicleQRScanPage({Key? key}) : super(key: key);

  @override
  State<ClientVehicleQRScanPage> createState() => _ClientVehicleQRScanPageState();
}

class _ClientVehicleQRScanPageState extends State<ClientVehicleQRScanPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool isChecked = false;


  int radioValue = 0;
  ScanResult? scanResult;

  var _aspectTolerance = 0.00;
  var _selectedCamera = -1;
  var _useAutoFocus = true;
  var _autoEnableFlash = false;

  List<BarcodeFormat> selectedFormats = [BarcodeFormat.qr];

  String accessToken = "";
  List matches = [];
  bool processing = true;
  bool hasData = false;
  String error = "";
  bool disableWidget = false;
  File? file;
  late Box<String> storage;


  void checkData() async {
    storage = Hive.box('clientVehicleQrScan');

    setState(() {
      try {
        String valueTemp = storage.get('scanVehicle') ?? '';
        if (valueTemp != '') {
          radioValue = int.parse(valueTemp.toString());
        }
      } catch(e) {}
    });
  }

  @override
  void initState() {
    super.initState();
    Wakelock.enable();
    _scan();
  }



  Future<void> _scan() async {
    try {
      final result = await BarcodeScanner.scan(
        options: ScanOptions(
          strings: {
            'cancel': 'Cancel',
            'flash_on': 'Flash on',
            'flash_off': 'Flash off',
          },
          restrictFormat: selectedFormats,
          useCamera: _selectedCamera,
          autoEnableFlash: _autoEnableFlash,
          android: AndroidOptions(
            aspectTolerance: _aspectTolerance,
            useAutoFocus: _useAutoFocus,
          ),
        ),
      );
      setState(() {
        scanResult = result;
      });

      SharedPreferences prefs = await _prefs;
      prefs.setString("qrScanCodeContent", result.rawContent);
      prefs.setString("qrScanCodeType", result.type.toString());
      prefs.setString("qrScanCodeError", "");

    } on PlatformException catch (e) {
      setState(() async {
        scanResult = ScanResult(
          type: ResultType.Error,
          format: BarcodeFormat.unknown,
          rawContent: e.code == BarcodeScanner.cameraAccessDenied
              ? 'The user did not grant the camera permission!'
              : 'Unknown error: $e',
        );
      });

      SharedPreferences prefs = await _prefs;
      prefs.setString("qrScanCodeContent", "");
      prefs.setString("qrScanCodeType", scanResult!.type.toString());
      prefs.setString("qrScanCodeError", scanResult!.rawContent.toString());

    }
    Navigator.of(context)
        .pushNamed('/ClientVehicleIdentifyPage');
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
    );
  }
}