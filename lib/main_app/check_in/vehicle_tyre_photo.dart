import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_interior.dart';
import 'package:yardapp/size.dart';

class VehicleTyrePhotoPage extends StatefulWidget {
  const VehicleTyrePhotoPage({Key? key}) : super(key: key);

  @override
  State<VehicleTyrePhotoPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleTyrePhotoPage> {
  // String photoLocation = "";
  String leftFrontTyrePhotoLocation = "";
  String leftBackTyrePhotoLocation = "";
  String rightFrontTyrePhotoLocation = "";
  String rightBackTyrePhotoLocation = "";


  uploadCameraFrontLeftTyre() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        leftFrontTyrePhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraRightFrontTyre() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }
    if (image != null) {
      var file = File(image.path);
      setState(() {
        rightFrontTyrePhotoLocation = file.path.toString();
      });

    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraLeftBackTyre() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        leftBackTyrePhotoLocation = file.path.toString();
      });

    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraRightBackTyre() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        rightBackTyrePhotoLocation = file.path.toString();
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
                  child: Text("Photograph The Vehicle's Tyre Treads", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      child: Text("Take photo's of the vehicle's tyre treads.", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                     Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 65,
                            width: buttonWidthTwo,
                            child:
                            //    Front Left Tyre
                            Container(
                              height: 65,
                              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                                          child: leftFrontTyrePhotoLocation != "" ? Image.file(File(leftFrontTyrePhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                              :
                                          IconButton(
                                            alignment: Alignment.center,
                                            icon: const Icon(Icons.camera_alt_rounded, size: 30, color: secondaryOverlayColor),
                                            onPressed: () {
                                              uploadCameraFrontLeftTyre();
                                            },
                                          ),
                                        ),

                                        GestureDetector(
                                          child:
                                          // Container(
                                          //   padding: const EdgeInsets.only(left: 3.0, top: 80),
                                          //   child:

                                          Text('Front',
                                              style: TextStyle(
                                                backgroundColor: secondaryOverlayColor,
                                                color: buttonColorText,
                                              ),
                                              textAlign: TextAlign.center
                                          ),

                                          // ),

                                          onTap: () {
                                            uploadCameraFrontLeftTyre();
                                          },
                                        ),
                                      ]
                                  )
                              ),
                            ),
                          ),
                          // ),

                          const SizedBox(width: 60),
                          SizedBox(
                            height: 65,
                            width: buttonWidthTwo,
                            child:
                            //    Front Right Tyre
                            Container(
                              height: 0,
                              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                                          child: rightFrontTyrePhotoLocation != "" ? Image.file(File(rightFrontTyrePhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                              :
                                          IconButton(
                                            alignment: Alignment.center,
                                            icon: const Icon(Icons.camera_alt_rounded, size: 30, color: secondaryOverlayColor),
                                            onPressed: () {
                                              uploadCameraRightFrontTyre();
                                            },
                                          ),
                                        ),

                                        GestureDetector(
                                          child:
                                          // Container(
                                          //   padding: const EdgeInsets.only(left: 3.0, top: 80),
                                          //   child:

                                          Text('Front',
                                              style: TextStyle(
                                                backgroundColor: secondaryOverlayColor,
                                                color: buttonColorText,
                                              ),
                                              textAlign: TextAlign.center
                                          ),

                                          // ),

                                          onTap: () {
                                            uploadCameraRightFrontTyre();
                                          },
                                        ),
                                      ]
                                  )
                              ),
                            ),// backgroundColor: Colors.blue
                            ),
                        ]),


                  Center(
                    child: Container(
                      child: SizedBox( height: 300, width: 400,
                          child: Image.asset('assets/images/carTyre.PNG')
                      ),
                    ),
                  ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 65,
                            width: buttonWidthTwo,
                            child:
                            //   Left BAck Tyre
                            Container(
                              height: 65,
                              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                                          child: leftBackTyrePhotoLocation != "" ? Image.file(File(leftBackTyrePhotoLocation)!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                              :
                                          IconButton(
                                            alignment: Alignment.center,
                                            icon: const Icon(Icons.camera_alt_rounded, size: 30, color: secondaryOverlayColor),
                                            onPressed: () {
                                              uploadCameraLeftBackTyre();
                                            },
                                          ),
                                        ),

                                        GestureDetector(
                                          child:
                                          // Container(
                                          //   padding: const EdgeInsets.only(left: 3.0, top: 80),
                                          //   child:

                                          Text('Back',
                                              style: TextStyle(
                                                backgroundColor: secondaryOverlayColor,
                                                color: buttonColorText,
                                              ),
                                              textAlign: TextAlign.center
                                          ),

                                          // ),

                                          onTap: () {
                                            uploadCameraLeftBackTyre();
                                          },
                                        ),
                                      ]
                                  )
                              ),
                            ),
                          ),
                          // ),

                          const SizedBox(width: 60),
                          SizedBox(
                            height: 65,
                            width: buttonWidthTwo,
                            child:
                            //    Right Back Tyre
                            Container(
                              height: 0,
                              margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                                          child: photoRightBackTyreFile != null ? Image.file(photoRightBackTyreFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                              :
                                          IconButton(
                                            alignment: Alignment.center,
                                            icon: const Icon(Icons.camera_alt_rounded, size: 30, color: secondaryOverlayColor),
                                            onPressed: () {
                                              uploadCameraRightBackTyre();
                                            },
                                          ),
                                        ),

                                        GestureDetector(
                                          child:
                                          // Container(
                                          //   padding: const EdgeInsets.only(left: 3.0, top: 80),
                                          //   child:

                                          Text('Back',
                                              style: TextStyle(
                                                backgroundColor: secondaryOverlayColor,
                                                color: buttonColorText,
                                              ),
                                              textAlign: TextAlign.center
                                          ),

                                          // ),

                                          onTap: () {
                                            uploadCameraRightBackTyre();
                                          },
                                        ),
                                      ]
                                  )
                              ),
                            ),// backgroundColor: Colors.blue
                          ),
                        ]),


                  SizedBox(
                    height: buttonHeight,
                    width: buttonWidthTwo,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/VehicleInteriorPage');
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
                    ),
                  ),

                ])
        )
    );
  }
}