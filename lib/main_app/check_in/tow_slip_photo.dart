import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/sp_license_disk_details.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';


class TowSlipPhotoPage extends StatefulWidget {
  const TowSlipPhotoPage({Key? key}) : super(key: key);

  @override
  State<TowSlipPhotoPage> createState() => _VehicleQRScanPageState();
}


class _VehicleQRScanPageState extends State<TowSlipPhotoPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerPassword = TextEditingController();

  // File? towSlipImage;

  bool noPhoto = false;

  String photoLocation = '';
  String _towSlipPhotoLocation = "";

uploadCameraImage() async {
  final _imagePicker = ImagePicker();
  XFile? image;

  //Select Image

  try {
    image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
  } catch(e) { print(e.toString()); }

  if (image != null) {
    var file = File(image.path);
    setState(() {
      _towSlipPhotoLocation = file.path.toString();
    });

  } else {
    print('No Image Path Received');
  }
}

  // towSlipImageOn() {
  // if (towSlipImage != null) {
  //   setState(() {
  //     noPhoto = true;
  //   });
  //
  // }
  // }

// uploadGalleryImage() async {
//   final _imagePicker = ImagePicker();
//   XFile? image;
//   //Select Image
//   try {
//     image = (await _imagePicker.pickImage(source: ImageSource.gallery, maxHeight: 500, maxWidth: 500, imageQuality: 100));
//   } catch(e) { print(e.toString()); }
//
//   if (image != null) {
//     var file = File(image.path);
//     List<int> imageBytes = await file.readAsBytes();
//     setState(() {
//       photoLocation = file.path.toString();
//     });
//     Navigator.of(context).pop();
//   } else {
//     print('No Image Path Received');
//   }
// }
//

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
                  child: Text("Photo Of Tow Slip", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      padding: const EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: const Text("Take a photo of the tow slip (if available).",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                      width: 0,
                      height: 120,
                      margin: const EdgeInsets.fromLTRB(140, 0, 140, 0),
                      padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                      decoration: BoxDecoration(
                          color: buttonColorText,
                          border: Border.all(
                            color: Colors.black,
                            width: 0.5,
                          ), borderRadius: BorderRadius.circular(0.0)
                      ),

                   child: Center(
                      child: ListView(
                        children: [
                          Container(
                              child: _towSlipPhotoLocation != "" ? Image.file(File(_towSlipPhotoLocation), width: 150, height: 150, fit: BoxFit.fill,): null
                          ),
                          IconButton( alignment: Alignment.center,
                            icon: Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                            onPressed: () {
                              uploadCameraImage();
                            },
                          ),

                            Padding(
                              padding: const EdgeInsets.only(top: 50.0),
                              child: const Text('Take Photo',
                                  style: TextStyle(
                                      backgroundColor: secondaryOverlayColor,
                                      color: buttonColorText,
                                  ),
                                      textAlign: TextAlign.center
                              ),
                            ),

                       ]
                      )
                   ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        if(_towSlipPhotoLocation == "")
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidthTwo,
                          child:
                          OutlinedButton(
                            child: Text('Skip',
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
                                Navigator.pushNamed(context, '/SPDriversLicense');
                              }
                            },
                          ),
                          ),

                        SizedBox(width: 100),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidthTwo,
                          child:
                          OutlinedButton(onPressed: () async {
                            SharedPreferences prefs = await _prefs;

                            prefs.setString('_towSlipPhotoLocation', _towSlipPhotoLocation);


                            Navigator.pushNamed(context, '/SPScanPage');
                          },
                            style: ButtonStyle(

                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(borderRadiusButton),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                            ),
                            child: const Text("Continue",
                              style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                            ),
                          ), // backgroundColor: Colors.blue
                        ),


                      ],

                    ),
                  ),
                ],


            )

        )
    );
  }

}


