import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_exterior_addtitional_photo.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';

class VehicleExteriorPhotoPage extends StatefulWidget {
  const VehicleExteriorPhotoPage({Key? key}) : super(key: key);

  @override
  State<VehicleExteriorPhotoPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleExteriorPhotoPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  bool hideButton = false;


  String windscreenPhotoLocation = "";
  String roofRoofFrontPhotoLocation = "";
  String frontViewBonnetOpenPhotoLocation = "";
  String engineViewRightPhotoLocation = "";
  String engineViewFrontPhotoLocation = "";
  String engineViewLeftPhotoLocation = "";
  String frontViewBonnetClosedPhotoLocation = "";
  String frontBumperPhotoLocation = "";
  String underVehicleFrontPhotoLocation = "";
  String frontRightCornerPhotoLocation = "";
  String rightRightDoorClosedPhotoLocation = "";
  String rightRearDoorClosedPhotoLocation = "";
  String rightRearDoorDoorOpenPhotoLocation = "";
  String rearRightCornerPhotoLocation = "";
  String rearViewBootClosedPhotoLocation = "";
  String rearViewBootOpenPhotoLocation = "";
  String contentOfBootPhotoLocation = "";
  String rearBumperPhotoLocation = "";
  String backWindowPhotoLocation = "";
  String underVehicleRearPhotoLocation = "";
  String leftRearCornerPhotoLocation = "";
  String leftRearDoorClosedPhotoLocation = "";
  String leftRearDoorOpenPhotoLocation = "";
  String leftFrontDoorClosedPhotoLocation = "";
  String leftFrontDoorOpenPhotoLocation = "";
  String frontLeftCornerPhotoLocation = "";
  String roofViewRearPhotoLocation = "";


  uploadCameraPhotoWindscreen() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        windscreenPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraRoofViewFront() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        roofRoofFrontPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraFrontViewBonnetOpen() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        frontViewBonnetOpenPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraEngineViewRight() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        engineViewRightPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraEngineViewFront() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        engineViewFrontPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraEngineViewLeft() async {
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
        engineViewLeftPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraFrontViewBonnetClosed() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        frontViewBonnetClosedPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraFrontBumperFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }
    if (image != null) {
      var file = File(image.path);
      setState(() {
        frontBumperPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraUnderVehicleFrontFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        underVehicleFrontPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraFrontRightCornerFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        frontRightCornerPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraFrontRightDoorClosedFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        rightRightDoorClosedPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraRightRearDoorClosedFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        rightRearDoorClosedPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraRightRearDoorOpenFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        rightRearDoorDoorOpenPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraRearRightCornerFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        rearRightCornerPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraRearViewBootClosedFile() async {
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
        rearViewBootClosedPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraRearViewBootOpenFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        rearViewBootOpenPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraContentOfBootFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        contentOfBootPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraRearBumperFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        rearBumperPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }


  uploadCameraBackWindowFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        backWindowPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraUnderVehicleRearFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        underVehicleRearPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraLeftRearCornerFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        leftRearCornerPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraLeftRearDoorClosedFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        leftRearDoorClosedPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }


  uploadCameraLeftRearDoorOpenFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        leftRearDoorOpenPhotoLocation = file.path.toString();
      });

    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraLeftFrontDoorClosedFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        leftFrontDoorClosedPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraLeftFrontDoorOpenFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        leftFrontDoorOpenPhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraFrontLeftCornerFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        frontLeftCornerPhotoLocation = file.path.toString();
      });

    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraRoofViewRearFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        roofViewRearPhotoLocation = file.path.toString();
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
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0, left: 10, right: 10),
                      child: Text("Take a few exterior photos of the vehicle", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text( "Windscreen",
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
                                child: windscreenPhotoLocation != "" ? Image.file(File(windscreenPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton(
                                  alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraPhotoWindscreen();
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
                                  uploadCameraPhotoWindscreen();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Roof View Front",
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
                                  child: roofRoofFrontPhotoLocation != "" ? Image.file(File(roofRoofFrontPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRoofViewFront();
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
                                      uploadCameraRoofViewFront();
                                    },
                                ),
                              // ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Front View Bonnet Open",
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
                                  child: frontViewBonnetOpenPhotoLocation != "" ? Image.file(File(frontViewBonnetOpenPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraFrontViewBonnetOpen();
                                    },
                                  ),
                              ),
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

                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Engine View Right",
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
                                  child: engineViewRightPhotoLocation != "" ? Image.file(File(engineViewRightPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton(
                                    alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraEngineViewRight();
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
                                  uploadCameraEngineViewRight();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Engine View Front",
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
                                  child: engineViewFrontPhotoLocation != "" ? Image.file(File(engineViewFrontPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraEngineViewFront();
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
                                  uploadCameraEngineViewFront();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Engine View Left",
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
                                  child: engineViewLeftPhotoLocation != "" ? Image.file(File(engineViewLeftPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraEngineViewLeft();
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
                                  uploadCameraEngineViewLeft();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Front View Bonnet Closed",
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
                                  child: frontViewBonnetClosedPhotoLocation != "" ? Image.file(File(frontViewBonnetClosedPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraFrontViewBonnetClosed();
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
                                  uploadCameraFrontViewBonnetClosed();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Front Bumper",
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
                                  child: frontBumperPhotoLocation != "" ? Image.file(File(frontBumperPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraFrontBumperFile();
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
                                  uploadCameraFrontBumperFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Under Vehicle Front",
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
                                  child: underVehicleFrontPhotoLocation != "" ? Image.file(File(underVehicleFrontPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraUnderVehicleFrontFile();
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
                                  uploadCameraUnderVehicleFrontFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Front Right Corner",
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
                                  child: frontRightCornerPhotoLocation != "" ? Image.file(File(frontRightCornerPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraFrontRightCornerFile();
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
                                  uploadCameraFrontRightCornerFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Front Right Door Closed",
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
                                  child: rightRightDoorClosedPhotoLocation != "" ? Image.file(File(rightRightDoorClosedPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraFrontRightDoorClosedFile();
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
                                  uploadCameraFrontRightDoorClosedFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Right Rear Door Closed",
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
                                  child: rightRearDoorClosedPhotoLocation != "" ? Image.file(File(rightRearDoorClosedPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRightRearDoorClosedFile();
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
                                  uploadCameraRightRearDoorClosedFile();
                                },
                              ),

                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Right Rear Door Open",
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
                                  child: rightRearDoorDoorOpenPhotoLocation != "" ? Image.file(File(rightRearDoorDoorOpenPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRightRearDoorOpenFile();
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
                                  uploadCameraRightRearDoorOpenFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Rear Right Corner",
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
                                  child: rearRightCornerPhotoLocation != "" ? Image.file(File(rearRightCornerPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRearRightCornerFile();
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
                                  uploadCameraRearRightCornerFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Rear View Boot Closed",
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
                                  child: rearViewBootClosedPhotoLocation != "" ? Image.file(File(rearViewBootClosedPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRearViewBootClosedFile();
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
                                  uploadCameraRearViewBootClosedFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Rear View Boot Open Photo",
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
                                  child: rearViewBootOpenPhotoLocation != "" ? Image.file(File(rearViewBootOpenPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRearViewBootOpenFile();
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
                                  uploadCameraRearViewBootOpenFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Content Of Boot",
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
                                  child: contentOfBootPhotoLocation != "" ? Image.file(File(contentOfBootPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraContentOfBootFile();
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
                                  uploadCameraContentOfBootFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Rear Bumper Photo",
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
                                  child: rearBumperPhotoLocation != "" ? Image.file(File(rearBumperPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRearBumperFile();
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
                                  uploadCameraRearBumperFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Back Window",
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
                                  child: backWindowPhotoLocation != "" ? Image.file(File(backWindowPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraBackWindowFile();
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
                                  uploadCameraBackWindowFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Under Vehicle Rear",
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
                                  child: underVehicleRearPhotoLocation != "" ? Image.file(File(underVehicleRearPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraUnderVehicleRearFile();
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
                                  uploadCameraUnderVehicleRearFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Left Rear Corner ",
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
                                  child: leftRearCornerPhotoLocation != "" ? Image.file(File(leftRearCornerPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraLeftRearCornerFile();
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
                                  uploadCameraLeftRearCornerFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Left Rear Door Closed",
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
                                  child: leftRearDoorClosedPhotoLocation != '' ? Image.file(File(leftRearDoorClosedPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraLeftRearDoorClosedFile();
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
                                  uploadCameraLeftRearDoorClosedFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Left Rear Door Open",
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
                                  child: leftRearDoorOpenPhotoLocation != "" ? Image.file(File(leftRearDoorOpenPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraLeftRearDoorOpenFile();
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
                                  uploadCameraLeftRearDoorOpenFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Left Front Door Closed",
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
                                  child: leftFrontDoorClosedPhotoLocation != "" ? Image.file(File(leftFrontDoorClosedPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraLeftFrontDoorClosedFile();
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
                                  uploadCameraLeftFrontDoorClosedFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Left Front Door Open",
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
                                  child: leftFrontDoorOpenPhotoLocation != "" ? Image.file(File(leftFrontDoorOpenPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraLeftFrontDoorOpenFile();
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
                                  uploadCameraLeftFrontDoorOpenFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Left Rear Corner",
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
                                  child: leftRearCornerPhotoLocation != "" ? Image.file(File(leftRearCornerPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraLeftRearCornerFile();
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
                                  uploadCameraLeftRearCornerFile();
                                },
                              ),
                            ]
                        )
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0),
                      child: Text("Roof View Rear",
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
                                  child: roofViewRearPhotoLocation != "" ? Image.file(File(roofViewRearPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraRoofViewRearFile();
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
                                  uploadCameraRoofViewRearFile();
                                },
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
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidthTwo,
                          child:
                          Visibility(
                            visible: hideButton,
                            child:
                          OutlinedButton(
                            child: const Text('Skip',
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
                                Navigator.pushNamed(context, '/VehicleExteriorPage');
                              }
                            },
                          ),
                          ),
                        ),

                        const SizedBox(width: 100),
                        SizedBox(
                          height: buttonHeight,
                          width: buttonWidthTwo,
                          child:
                            OutlinedButton(
                              onPressed: () async {
                            SharedPreferences prefs = await _prefs;

                            prefs.setString('windscreenPhotoLocation', windscreenPhotoLocation);
                            prefs.setString('roofRoofFrontPhotoLocation', roofRoofFrontPhotoLocation);
                            prefs.setString('frontViewBonnetOpenPhotoLocation', frontViewBonnetOpenPhotoLocation);
                            prefs.setString('engineViewRightPhotoLocation', engineViewRightPhotoLocation);
                            prefs.setString('engineViewFrontPhotoLocation', engineViewFrontPhotoLocation);
                            prefs.setString('engineViewLeftPhotoLocation', engineViewLeftPhotoLocation);
                            prefs.setString('frontViewBonnetClosedPhotoLocation', frontViewBonnetClosedPhotoLocation);
                            prefs.setString('frontBumperPhotoLocation', frontBumperPhotoLocation);
                            prefs.setString('underVehicleFrontPhotoLocation', underVehicleFrontPhotoLocation);
                            prefs.setString('frontRightCornerPhotoLocation', frontRightCornerPhotoLocation);
                            prefs.setString('rightRightDoorClosedPhotoLocation', rightRightDoorClosedPhotoLocation);
                            prefs.setString('rightRearDoorClosedPhotoLocation', rightRearDoorClosedPhotoLocation);
                            prefs.setString('rightRearDoorDoorOpenPhotoLocation', rightRearDoorDoorOpenPhotoLocation);
                            prefs.setString('rearRightCornerPhotoLocation', rearRightCornerPhotoLocation);
                            prefs.setString('rearViewBootClosedPhotoLocation', rearViewBootClosedPhotoLocation);
                            prefs.setString('rearViewBootOpenPhotoLocation', rearViewBootOpenPhotoLocation);
                            prefs.setString('contentOfBootPhotoLocation', contentOfBootPhotoLocation);
                            prefs.setString('rearBumperPhotoLocation', rearBumperPhotoLocation);
                            prefs.setString('backWindowPhotoLocation', backWindowPhotoLocation);
                            prefs.setString('underVehicleRearPhotoLocation', underVehicleRearPhotoLocation);
                            prefs.setString('leftRearCornerPhotoLocation', leftRearCornerPhotoLocation);
                            prefs.setString('leftRearDoorClosedPhotoLocation', leftRearDoorClosedPhotoLocation);
                            prefs.setString('leftRearDoorOpenPhotoLocation', leftRearDoorOpenPhotoLocation);
                            prefs.setString('leftFrontDoorClosedPhotoLocation', leftFrontDoorClosedPhotoLocation);
                            prefs.setString('leftFrontDoorOpenPhotoLocation', leftFrontDoorOpenPhotoLocation);
                            prefs.setString('frontLeftCornerPhotoLocation', frontLeftCornerPhotoLocation);
                            prefs.setString('roofViewRearPhotoLocation', roofViewRearPhotoLocation);


                            Navigator.pushNamed(context, '/VehicleExteriorAdditionalPhotoPage');
                              },
                              style: ButtonStyle(

                                  shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(borderRadiusButton),
                                    ),
                                  ),
                                  backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                              ),
                              child: const Text("Next",
                                style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                              ),
                            ), // backgroundColor: Colors.blue
                          ),
                        ]),

                    ),




        ])
      )
    );
  }
}