import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_loose_items.dart';
import 'package:yardapp/size.dart';

class VehicleChecklistPage extends StatefulWidget {
  const VehicleChecklistPage({Key? key}) : super(key: key);

  @override
  State<VehicleChecklistPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleChecklistPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerBatteryName = TextEditingController();

  File? photoJackAndSpannerFile;
  File? photoSpareWheelFile;
  File? photoBatteryFile;
  File? photoOdometerFile;
  File? photoKeysFile;
  File? photoETagFile;
  File? photoDashCamFile;
  File? photoSDCardFile;
  File? photoGPSFile;
  File? photoPillarAFile;
  File? photoPillarBFile;


  String photoLocation = "";

  int vehicleEngine = 0;
  int vehicleDashCam = 0;
  int vehicleOdometer = 0;
  int vehicleKeys = 0;
  int vehicleETag = 0;
  int vehicleSDCard = 0;
  int vehicleGPS = 0;
  int vehicleChassis = 0;
  int vehiclePillarA = 0;
  int vehiclePillarB = 0;
  int vehicleStarts = 0;
  int vehicleBurnout = 0;
  int vehicleWriteOff = 0;
  int vehicleBonnet = 0;
  int  vehicleDamaged = 0;
  int  vehicleAirbag = 0;
  int  vehicleRolled = 0;
  int  vehicleBoot = 0;
  int  vehicleJackAndSpanner = 0;
  int  vehicleSpareWheel = 0;
  int  vehicleBattery = 0;
  int  vehicleFuel = 0;


  bool identify = false;


  Future eTagDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("What is an eTag?", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Text("An e-Tag is a device fitted the windscreen of a vehicle allowing the driver to pay toll fees automatically.",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
             Image.asset('assets/images/eTag-938.jpg'),
              ],
            ),

          ],
        )

    ),
  );

  Future dashCamDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("What is a dash cam?", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Text("A dash cam is a device attached to your windsreen to record the road, traffic, or an accident.",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/dashcam.jpg'),
              ],
            ),

          ],
        )

    ),
  );
  Future sdCardDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("What is a SD card?", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Text("It's a memory card that's used in digital cameras to store photos and videos.",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/sdCard.jpg'),
              ],
            ),

          ],
        )

    ),
  );

  Future gpsDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("What is a GPS device?", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Text("It's a device that gives a driver directions on how to get to a specified address.",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/gps.jpg'),
              ],
            ),

          ],
        )

    ),
  );

  Future chassisDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("What is the chassis?", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Text("The chassis is the bottom framework of your vehicle",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/chassis.jpg'),
              ],
            ),

          ],
        )

    ),
  );

  Future pillarADialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("What is a pillar A?", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Text("The first vertical var of your vehicle that supports the windscreen.",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/carPillars.png'),
              ],
            ),

          ],
        )

    ),
  );

  Future pillarBDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog( title: Text("What is a pillar B?", style: TextStyle(fontSize: 15, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold, ),
          ),
        content: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                const Text("The second vertical bar that's in between your front and rear vehicle doors.",textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                ),
                Image.asset('assets/images/carPillars.png'),
              ],
            ),

          ],
        )

    ),
  );

  uploadCameraPhotoJackAndSpannerFile() async {
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
      setState(() => photoJackAndSpannerFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoSpareWheelFile() async {
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
      setState(() => photoSpareWheelFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraPhotoBatteryFile() async {
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
      setState(() => photoBatteryFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoOdometerFile() async {
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
      setState(() => photoOdometerFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoKeysFile() async {
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
      setState(() => photoKeysFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoETagFile() async {
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
      setState(() => photoETagFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoDashCamFile() async {
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
      setState(() => photoDashCamFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoSDCardFile() async {
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
      setState(() => photoSDCardFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoGPSFile() async {
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
      setState(() => photoGPSFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraPhotoPillarAFile() async {
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
      setState(() => photoPillarAFile = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraPhotoPillarBFile() async {
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
      setState(() => photoPillarBFile = imageTemporary);
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
                Text("Check into yard", style: TextStyle(color:buttonColorText)),
                subtitle: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text("Vehicle Checklist", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      padding: EdgeInsets.all(28.0),
                      child: Text("Tell us more about the condition of the vehicle you will add to your yard:",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("Vehicle starts?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleStarts,
                          onChanged: (value) {
                            setState(() {
                               vehicleStarts = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      AbsorbPointer(
                        absorbing: identify,
                        child:
                        Radio<int>(
                            value: 2,
                            groupValue:  vehicleStarts,
                            onChanged: (value) {
                              setState(() {
                                 vehicleStarts = value!;
                              });
                            }
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  if ( vehicleStarts == 1)
                  const Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("Burnout?",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if ( vehicleStarts == 1)
                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:  vehicleBurnout,
                          onChanged: (value) {
                            setState(() {
                               vehicleBurnout = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),

                  if ( vehicleStarts == 1)
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleBurnout,
                          onChanged: (value) {
                            setState(() {
                               vehicleBurnout = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Partial'),
                    ],
                  ),


                  if ( vehicleStarts == 1)
                  Row(
                    children: [
                      Radio<int>(
                          value: 3,
                          groupValue:  vehicleBurnout,
                          onChanged: (value) {
                            setState(() {
                               vehicleBurnout = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Suspected write-off?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleWriteOff,
                          onChanged: (value) {
                            setState(() {
                               vehicleWriteOff = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                        Radio<int>(
                            value: 2,
                            groupValue:  vehicleWriteOff,
                            onChanged: (value) {
                              setState(() {
                                 vehicleWriteOff = value!;
                              });
                            }
                        ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Can the bonnet open?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleBonnet,
                          onChanged: (value) {
                            setState(() {
                               vehicleBonnet = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleBonnet,
                          onChanged: (value) {
                            setState(() {
                               vehicleBonnet = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Undercarriage damaged?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleDamaged,
                          onChanged: (value) {
                            setState(() {
                               vehicleDamaged = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleDamaged,
                          onChanged: (value) {
                            setState(() {
                               vehicleDamaged = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Airbags deployed?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleAirbag,
                          onChanged: (value) {
                            setState(() {
                               vehicleAirbag = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleAirbag,
                          onChanged: (value) {
                            setState(() {
                               vehicleAirbag = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Vehicle rolled?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleRolled,
                          onChanged: (value) {
                            setState(() {
                               vehicleRolled = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleRolled,
                          onChanged: (value) {
                            setState(() {
                               vehicleRolled = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Can the boot open?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleBoot,
                          onChanged: (value) {
                            setState(() {
                               vehicleBoot = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleBoot,
                          onChanged: (value) {
                            setState(() {
                               vehicleBoot = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 3,
                          groupValue:  vehicleBoot,
                          onChanged: (value) {
                            setState(() {
                               vehicleBoot = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Unverifiable'),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Jack and wheel spanner present?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleJackAndSpanner,
                          onChanged: (value) {
                            setState(() {
                               vehicleJackAndSpanner = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleJackAndSpanner,
                          onChanged: (value) {
                            setState(() {
                               vehicleJackAndSpanner = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 3,
                          groupValue:  vehicleJackAndSpanner,
                          onChanged: (value) {
                            setState(() {
                               vehicleJackAndSpanner = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Unverifiable'),
                    ],
                  ),

                if ( vehicleJackAndSpanner == 1)
                  const  Padding(
                      padding: EdgeInsets.all( 28.0,),
                      child: Text("Take a photo of both jack and wheel spanner",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if ( vehicleJackAndSpanner == 1)
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
                                child: photoJackAndSpannerFile != null ? Image.file(photoJackAndSpannerFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton( alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraPhotoJackAndSpannerFile();
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
                                  uploadCameraPhotoJackAndSpannerFile();
                                },
                              ),
                              // ),
                            ]
                        )
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Spare wheel present?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleSpareWheel,
                          onChanged: (value) {
                            setState(() {
                               vehicleSpareWheel = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleSpareWheel,
                          onChanged: (value) {
                            setState(() {
                               vehicleSpareWheel = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 3,
                          groupValue:  vehicleSpareWheel,
                          onChanged: (value) {
                            setState(() {
                               vehicleSpareWheel = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Unverifiable'),
                    ],
                  ),

                  if ( vehicleSpareWheel == 1)
                  const  Padding(
                    padding: EdgeInsets.all( 28.0,),
                    child: Text("Take a photo of the spare wheel",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  if ( vehicleSpareWheel == 1)
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
                                child: photoSpareWheelFile != null ? Image.file(photoSpareWheelFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton( alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraPhotoSpareWheelFile();
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
                                  uploadCameraPhotoBatteryFile();
                                },
                              ),
                              // ),
                            ]
                        )
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Battery present?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleBattery,
                          onChanged: (value) {
                            setState(() {
                               vehicleBattery = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleBattery,
                          onChanged: (value) {
                            setState(() {
                               vehicleBattery = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 3,
                          groupValue:  vehicleBattery,
                          onChanged: (value) {
                            setState(() {
                               vehicleBattery = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Unverifiable'),
                    ],
                  ),

                  if ( vehicleBattery == 1)
                  const  Padding(
                    padding: EdgeInsets.all( 28.0,),
                    child: Text("Take a photo of the battery",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  if ( vehicleBattery == 1)
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
                                child: photoBatteryFile != null ? Image.file(photoBatteryFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton( alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraPhotoBatteryFile();
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
                                  uploadCameraPhotoBatteryFile();
                                },
                              ),
                              // ),
                            ]
                        )
                    ),
                  ),

                  if ( vehicleBattery == 1)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 28.0, bottom: 18.0, left: 10, right: 10),
                      child: Text("Enter the make of the battery:", textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),

                  if ( vehicleBattery == 1)
                  Container(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      onChanged: (String nameText) {

                      },
                      controller: controllerBatteryName,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Are you able to take a photo of the instrument cluster?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleOdometer,
                          onChanged: (value) {
                            setState(() {
                               vehicleOdometer = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleOdometer,
                          onChanged: (value) {
                            setState(() {
                               vehicleOdometer = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  if ( vehicleOdometer == 1)
                  const  Padding(
                    padding: EdgeInsets.all( 28.0,),
                    child: Text("Take a photo of the instrument cluster to show the odometer reading and the amount of fuel inside the vehicle",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),



                  if ( vehicleOdometer == 1)
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
                                child: photoOdometerFile != null ? Image.file(photoOdometerFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton( alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraPhotoOdometerFile();
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
                                  uploadCameraPhotoOdometerFile();
                                },
                              ),
                              // ),
                            ]
                        )
                    ),
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Select the fuel gauge reading",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                               vehicleFuel = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Empty'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                               vehicleFuel = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('1/4'),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<int>(
                        value: 3,
                        groupValue:  vehicleFuel,
                        onChanged: (value) {
                          setState(() {
                             vehicleFuel = value!;
                         });
                      }
                    ),

                      SizedBox(width: 10.0,),
                      Text('1/2'),
                    ],
                  ),

                    Row(
                      children: [
                        Radio<int>(
                            value: 4,
                            groupValue:  vehicleFuel,
                            onChanged: (value) {
                            setState(() {
                               vehicleFuel = value!;
                            });
                          }
                        ),

                        SizedBox(width: 10.0,),
                        Text('3/4'),
                        ],
                      ),

                    Row(
                      children: [
                        Radio<int>(
                          value: 5 ,
                          groupValue:  vehicleFuel,
                          onChanged: (value) {
                          setState(() {
                             vehicleFuel = value!;
                         });
                      }
                    ),

                    SizedBox(width: 10.0,),
                    Text('Full'),
                    ],
                    ),

                    Row(
                      children: [
                        Radio<int>(
                          value: 6,
                          groupValue:  vehicleFuel,
                          onChanged: (value) {
                          setState(() {
                             vehicleFuel = value!;
                        });
                      }
                    ),

                        SizedBox(width: 10.0,),
                          Text('Unverifiable'),
                    ],
                    ),

                  const Padding(
                          padding: EdgeInsets.all(28.0),
                            child: Text("Keys present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                            ),
                        ),

                      Row(
                        children: [
                          Radio<int>(
                              value: 1,
                              groupValue:
                               vehicleKeys,
                                  onChanged: (value) {
                                  setState(() {
                                   vehicleKeys = value!;
                                  });
                                }
                            ),
                              SizedBox(width: 10.0,),
                              Text('Yes, key is present'),
                              ],
                              ),
                      Row(
                        children: [
                          Radio<int>(
                            value: 2,
                            groupValue:  vehicleKeys,
                            onChanged: (value) {
                              setState(() {
                               vehicleKeys = value!;
                          });
                        }
                      ),

                          SizedBox(width: 10.0,),
                          Text('Broken key'),
                        ],
                      ),

                      Row(
                        children: [
                          Radio<int>(
                            value: 3,
                            groupValue:  vehicleKeys,
                            onChanged: (value) {
                              setState(() {
                               vehicleKeys = value!;
                          });
                        }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Spare key'),
                      ],
                      ),

                      Row(
                        children: [
                          Radio<int>(
                            value: 4,
                            groupValue:
                             vehicleKeys,
                            onChanged: (value) {
                              setState(() {
                               vehicleKeys = value!;
                              });
                        }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No, key is absent'),
                      ],
                      ),
                  if( vehicleKeys != 4)
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
                                child: photoKeysFile != null ? Image.file(photoKeysFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                    :
                                IconButton( alignment: Alignment.center,
                                  icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                  onPressed: () {
                                    uploadCameraPhotoKeysFile();
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
                                  uploadCameraPhotoKeysFile();
                                },
                              ),
                              // ),
                            ]
                        )
                    ),
                  ),



                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 200),
                        child: Text("e-Tag present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox( height: checklistFloatingButtonSize,
                        child: FloatingActionButton(
                          onPressed: () {
                            eTagDialog();
                          },
                          child: const Icon(Icons.question_mark, size: checklistQuestionMarkSize),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleETag,
                          onChanged: (value) {
                            setState(() {
                               vehicleETag = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleETag,
                          onChanged: (value) {
                            setState(() {
                               vehicleETag = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                    if( vehicleETag == 1)
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
                                    child: photoETagFile != null ? Image.file(photoETagFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                        :
                                    IconButton( alignment: Alignment.center,
                                      icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                      onPressed: () {
                                        uploadCameraPhotoETagFile();
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
                                      uploadCameraPhotoETagFile();
                                    },
                                  ),
                                  // ),
                                ]
                            )
                        ),
                      ),


                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 170),
                        child: Text("Dash cam present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox( height: checklistFloatingButtonSize,
                        child: FloatingActionButton(
                          onPressed: () {
                            dashCamDialog();
                          },
                          child: const Icon(Icons.question_mark, size: checklistQuestionMarkSize),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleDashCam,
                          onChanged: (value) {
                            setState(() {
                               vehicleDashCam = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleDashCam,
                          onChanged: (value) {
                            setState(() {
                               vehicleETag = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if( vehicleDashCam == 1)
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
                                  child: photoDashCamFile != null ? Image.file(photoDashCamFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraPhotoDashCamFile();
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
                                    uploadCameraPhotoDashCamFile();
                                  },
                                ),
                                // ),
                              ]
                          )
                      ),
                    ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 180),
                        child: Text("SD card present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox( height: checklistFloatingButtonSize,
                        child: FloatingActionButton(
                          onPressed: () {
                            sdCardDialog();
                          },
                          child: const Icon(Icons.question_mark, size: checklistQuestionMarkSize),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleSDCard,
                          onChanged: (value) {
                            setState(() {
                               vehicleSDCard = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleSDCard,
                          onChanged: (value) {
                            setState(() {
                               vehicleSDCard = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if( vehicleSDCard == 1)
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
                                  child: photoSDCardFile != null ? Image.file(photoSDCardFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraPhotoSDCardFile();
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
                                    uploadCameraPhotoSDCardFile();
                                  },
                                ),
                                // ),
                              ]
                          )
                      ),
                    ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 155),
                        child: Text("GPS device present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox( height: checklistFloatingButtonSize,
                        child: FloatingActionButton(
                          onPressed: () {
                            gpsDialog();
                          },
                          child: const Icon(Icons.question_mark, size: checklistQuestionMarkSize),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleGPS,
                          onChanged: (value) {
                            setState(() {
                               vehicleGPS = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleGPS,
                          onChanged: (value) {
                            setState(() {
                               vehicleGPS = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if( vehicleGPS == 1)
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
                                  child: photoGPSFile != null ? Image.file(photoGPSFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraPhotoGPSFile();
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
                                    uploadCameraPhotoGPSFile();
                                  },
                                ),
                                // ),
                              ]
                          )
                      ),
                    ),

                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 155),
                        child: Text("Engine of the car present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleEngine,
                          onChanged: (value) {
                            setState(() {
                               vehicleEngine = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleEngine,
                          onChanged: (value) {
                            setState(() {
                               vehicleEngine = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 115),
                        child: Text("Chassis of vehicle present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox( height: checklistFloatingButtonSize,
                        child: FloatingActionButton(
                          onPressed: () {
                            chassisDialog();
                          },
                          child: const Icon(Icons.question_mark, size: checklistQuestionMarkSize),
                        ),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehicleChassis,
                          onChanged: (value) {
                            setState(() {
                               vehicleChassis = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehicleChassis,
                          onChanged: (value) {
                            setState(() {
                               vehicleChassis = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),



                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 95),
                        child: Text("Pillar A of the vehicle present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox( height: checklistFloatingButtonSize,
                        child: FloatingActionButton(
                          onPressed: () {
                            pillarADialog();
                          },
                          child: const Icon(Icons.question_mark, size: checklistQuestionMarkSize),
                        ),
                      ),
                    ],
                  ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehiclePillarA,
                          onChanged: (value) {
                            setState(() {
                               vehiclePillarA = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehiclePillarA,
                          onChanged: (value) {
                            setState(() {
                               vehiclePillarA = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if( vehiclePillarA == 1)
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
                                  child: photoPillarAFile != null ? Image.file(photoPillarAFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraPhotoPillarAFile();
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
                                    uploadCameraPhotoPillarAFile();
                                  },
                                ),
                                // ),
                              ]
                          )
                      ),
                    ),


                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top:28.0, left: 28, bottom: 28, right: 95),
                        child: Text("Pillar B of the vehicle present?",
                          style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),


                      SizedBox( height: checklistFloatingButtonSize,
                        child: FloatingActionButton(
                          onPressed: () {
                            pillarBDialog();
                          },
                          child: const Icon(Icons.question_mark, size: checklistQuestionMarkSize),
                        ),
                      ),
                    ],
                  ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                           vehiclePillarB,
                          onChanged: (value) {
                            setState(() {
                               vehiclePillarB = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),


                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue:  vehiclePillarB,
                          onChanged: (value) {
                            setState(() {
                               vehiclePillarB = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if( vehiclePillarB == 1)
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
                                  child: photoPillarBFile != null ? Image.file(photoPillarBFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraPhotoPillarBFile();
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
                                    uploadCameraPhotoPillarBFile();
                                  },
                                ),
                                // ),
                              ]
                          )
                      ),
                    ),

                  SizedBox(
                    height: buttonHeight,
                    width: buttonWidth,
                    child: OutlinedButton(
                      // onFocusChange: toggleSwitch,
                      onPressed: ()  {
                        Navigator.pushNamed(context, '/VehicleLooseItemsPage');
                      },
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: otpButtonBackground, width: borderWidth)
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(borderRadiusButton),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(acceptButton)
                      ),
                      child: const Text("Continue",
                        style: TextStyle(
                            color: buttonColorText,
                            fontSize: buttonSizeText, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ), // backgroundColor: Colors.blue
                    ),
                  ),

                ])));

  }


}