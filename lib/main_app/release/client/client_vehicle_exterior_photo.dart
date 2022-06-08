import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_exterior_addtitional_photo.dart';
import 'package:yardapp/screen_size.dart';
import 'package:yardapp/size.dart';

class ClientVehicleExteriorPhotoPage extends StatefulWidget {
  const ClientVehicleExteriorPhotoPage({Key? key}) : super(key: key);

  @override
  State<ClientVehicleExteriorPhotoPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<ClientVehicleExteriorPhotoPage> {
  File? photoLocationFile;
  File? photoWindscreenFile;
  File? photoRoofViewFrontFile;
  File? photoFrontViewBonnetOpenFile;
  File? photoEngineViewRightFile;
  File? photoEngineViewFrontFile;
  File? photoEngineViewLeftFile;
  File? photoFrontViewBonnetClosedFile;
  File? photoFrontBumperFile;
  File? photoUnderVehicleFrontFile;
  File? photoFrontRightCornerFile;
  File? photoFrontRightDoorClosedFile;
  File? photoRightRearDoorClosedFile;
  File? photoRightRearDoorOpenFile;
  File? photoRearRightCornerFile;
  File? photoRearViewBootClosedFile;
  File? photoRearViewBootOpenFile;
  File? photoContentOfBootFile;
  File? photoRearBumperFile;
  File? photoBackWindowFile;
  File? photoUnderVehicleRearFile;
  File? photoLeftRearCornerFile;
  File? photoLeftRearDoorClosedFile;
  File? photoLeftRearDoorOpenFile;
  File? photoLeftFrontDoorClosedFile;
  File? photoLeftFrontDoorOpenFile;
  File? photoFrontLeftCornerFile;
  File? photoRoofViewRearFile;

  bool hideButton = false;

  String photoLocation = "";



  uploadCameraphotoWindscreen() async {
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
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoWindscreenFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRoofViewFrontFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoFrontViewBonnetOpenFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoEngineViewRightFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoEngineViewFrontFile = imageTemporary);
      // Navigator.of(context);
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
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoEngineViewLeftFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoFrontViewBonnetClosedFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoFrontBumperFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoUnderVehicleFrontFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoFrontRightCornerFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoFrontRightDoorClosedFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRightRearDoorClosedFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRightRearDoorOpenFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRearRightCornerFile = imageTemporary);
      // Navigator.of(context);
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
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRearViewBootClosedFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRearViewBootOpenFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoContentOfBootFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRearBumperFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoBackWindowFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoUnderVehicleRearFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoLeftRearCornerFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoLeftRearDoorClosedFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoLeftRearDoorOpenFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoLeftFrontDoorClosedFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoLeftFrontDoorOpenFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoFrontLeftCornerFile = imageTemporary);
      // Navigator.of(context);
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
      List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      final imageTemporary = File(image.path);
      setState(() => photoRoofViewRearFile = imageTemporary);
      // Navigator.of(context);
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
                Text("Vehicle client release", style: TextStyle(color:buttonColorText)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Exterior Photos Of The Vehicle", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                                child: photoWindscreenFile != null ? Image.file(photoWindscreenFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton(
                                  alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraphotoWindscreen();
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
                                  uploadCameraphotoWindscreen();
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
                                child: photoRoofViewFrontFile != null ? Image.file(photoRoofViewFrontFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoFrontViewBonnetOpenFile != null ? Image.file(photoFrontViewBonnetOpenFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoEngineViewRightFile != null ? Image.file(photoEngineViewRightFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoEngineViewFrontFile != null ? Image.file(photoEngineViewFrontFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoEngineViewLeftFile != null ? Image.file(photoEngineViewLeftFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoFrontViewBonnetClosedFile != null ? Image.file(photoFrontViewBonnetClosedFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoFrontBumperFile != null ? Image.file(photoFrontBumperFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoUnderVehicleFrontFile != null ? Image.file(photoUnderVehicleFrontFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoFrontRightCornerFile != null ? Image.file(photoFrontRightCornerFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoFrontRightDoorClosedFile != null ? Image.file(photoFrontRightDoorClosedFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoRightRearDoorClosedFile != null ? Image.file(photoRightRearDoorClosedFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoRightRearDoorOpenFile != null ? Image.file(photoRightRearDoorOpenFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoRearRightCornerFile != null ? Image.file(photoRearRightCornerFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoRearViewBootClosedFile != null ? Image.file(photoRearViewBootClosedFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoRearViewBootOpenFile != null ? Image.file(photoRearViewBootOpenFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoContentOfBootFile != null ? Image.file(photoContentOfBootFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoRearBumperFile != null ? Image.file(photoRearBumperFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoBackWindowFile != null ? Image.file(photoBackWindowFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoUnderVehicleRearFile != null ? Image.file(photoUnderVehicleRearFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoLeftRearCornerFile != null ? Image.file(photoLeftRearCornerFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoLeftRearDoorClosedFile != null ? Image.file(photoLeftRearDoorClosedFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoLeftRearDoorOpenFile != null ? Image.file(photoLeftRearDoorOpenFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoLeftFrontDoorClosedFile != null ? Image.file(photoLeftFrontDoorClosedFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoLeftFrontDoorOpenFile != null ? Image.file(photoLeftFrontDoorOpenFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoLeftRearDoorOpenFile != null ? Image.file(photoLeftRearDoorOpenFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                child: photoRoofViewRearFile != null ? Image.file(photoRoofViewRearFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                                  uploadCameraLeftFrontDoorOpenFile();
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
                              onPressed: () {
                               // if (photoLocationFile != null)
                               //  if (photoWindscreenFile != null)
                               //  if (photoRoofViewFrontFile != null)
                               //  if (photoFrontViewBonnetOpenFile != null)
                               //  if (photoEngineViewRightFile != null)
                               //  if (photoEngineViewFrontFile != null)
                               //  if (photoEngineViewLeftFile != null)
                               //  if (photoFrontViewBonnetClosedFile != null)
                               //  if (photoFrontBumperFile != null)
                               //  if (photoUnderVehicleFrontFile != null)
                               //  if (photoFrontRightCornerFile != null)
                               //  if (photoFrontRightDoorClosedFile != null)
                               //  if (photoRightRearDoorClosedFile != null)
                               //  if (photoRightRearDoorOpenFile != null)
                               //  if (photoRearRightCornerFile != null)
                               //  if (photoRearViewBootClosedFile != null)
                               //  if (photoRearViewBootOpenFile != null)
                               //  if (photoContentOfBootFile != null)
                               //  if (photoRearBumperFile != null)
                               //  if (photoBackWindowFile != null)
                               //  if (photoUnderVehicleRearFile != null)
                               //  if (photoLeftRearCornerFile != null)
                               //  if (photoLeftRearDoorClosedFile != null)
                               //  if (photoLeftRearDoorOpenFile != null)
                               //  if (photoLeftFrontDoorClosedFile != null)
                               //  if (photoLeftFrontDoorOpenFile != null)
                               //  if (photoFrontLeftCornerFile != null)
                               //  if (photoRoofViewRearFile != null)

                                Navigator.pushNamed(context, '/ClientVehicleExteriorAdditionalPhotoPage');
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