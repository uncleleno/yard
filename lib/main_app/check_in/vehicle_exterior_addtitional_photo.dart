import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_tyre_photo.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'dart:io';

import 'package:yardapp/size.dart';


class VehicleExteriorAdditionalPhotoPage extends StatefulWidget {
  const VehicleExteriorAdditionalPhotoPage({Key? key}) : super(key: key);

  @override
  State<VehicleExteriorAdditionalPhotoPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleExteriorAdditionalPhotoPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool hideButton = false;
  String photoLocation = "";
  File? image;

  String firstExtraPhotoLocation = "";
  String secondExtraPhotoLocation = "";

  uploadCameraFirstExtra() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        firstExtraPhotoLocation = file.path.toString();
      });

    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraPhotoSecondExtraFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        secondExtraPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
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
                  child: Text("Exterior Photos Of The New Vehicle For Your Yard", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0, left: 15, right: 15),
                      child: Text("Would like to take more or less addtional exterior photos of the vehicle?", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text( "First Extra Photo",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),


                  Container(
                    width: buttonPhotoBoxWidth,
                    height: buttonPhotoBoxHeight,
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
                                child: firstExtraPhotoLocation != "" ? Image.file(File(firstExtraPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton(
                                  alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraFirstExtra();
                                  },
                                ),
                              ),

                              GestureDetector(
                                child:
                                // Container(
                                //   padding: const EdgeInsets.only(left: 3.0, top: 80),
                                //   child:
                                const Padding(
                                  padding: EdgeInsets.only(top: buttonTextPadding),
                                  child: Text('Take Photo',
                                      style: TextStyle(
                                        backgroundColor: secondaryOverlayColor,
                                        color: buttonColorText,
                                      ),
                                      textAlign: TextAlign.center
                                  ),
                                ),
                                // ),

                                onTap: () {
                                  uploadCameraFirstExtra();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Second Extra Photo",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Container(
                    width: buttonPhotoBoxWidth,
                    height: buttonPhotoBoxHeight,
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
                                child: secondExtraPhotoLocation != "" ? Image.file(File(secondExtraPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton( alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraPhotoSecondExtraFile();
                                  },
                                ),
                              ),


                              // const Padding(
                              //   padding: EdgeInsets.only(top: buttonTextPadding),
                              //   child:
                              GestureDetector(
                                child:
                                // Container(
                                //   padding: const EdgeInsets.only(left: 3.0, top: 80),
                                //   child:
                                const Padding(
                                  padding: EdgeInsets.only(top: buttonTextPadding),
                                  child: Text('Take Photo',
                                      style: TextStyle(
                                        backgroundColor: secondaryOverlayColor,
                                        color: buttonColorText,
                                      ),
                                      textAlign: TextAlign.center
                                  ),
                                ),
                                // ),

                                onTap: () {
                                  uploadCameraPhotoSecondExtraFile();
                                },
                              ),
                              // ),
                            ]
                        )
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 40.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: buttonHeight,
                            width: buttonWidthTwo,
                            child:

                              OutlinedButton(
                                child: const Text('No, skip',
                                  style: TextStyle(fontSize: 15, color: Colors.red, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                                ),
                                style: ButtonStyle(
                                    side: MaterialStateProperty.all(
                                        const BorderSide(color: signUpButton, width: borderWidth)
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
                                    Navigator.pushNamed(context, '/VehicleTyrePhotoPage');
                                  }
                                },
                              ),
                            ),
                          // ),

                          const SizedBox(width: 100),
                          SizedBox(
                            height: buttonHeight,
                            width: buttonWidthTwo,
                            child:
                            // Visibility(
                            //   visible: hideButton,
                            //   child:
                            OutlinedButton(
                              onPressed: () async {
                                SharedPreferences prefs = await _prefs;
                                prefs.setString('firstExtraPhotoLocation', firstExtraPhotoLocation);
                                prefs.setString('secondExtraPhotoLocation', secondExtraPhotoLocation);

                                Navigator.pushNamed(context, '/VehicleTyrePhotoPage');
                              },
                              style: ButtonStyle(

                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(borderRadiusButton),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                              ),
                              child: const Text("Yes, take photos",
                                style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                              ),
                            ), // backgroundColor: Colors.blue
                          // ),
                          ),
                        ]),

                  ),

                ]))


    );
  }
}