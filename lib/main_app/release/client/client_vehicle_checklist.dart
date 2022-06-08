import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_loose_items.dart';
import 'package:yardapp/size.dart';

class ClientVehicleChecklistPage extends StatefulWidget {
  const ClientVehicleChecklistPage({Key? key}) : super(key: key);

  @override
  State<ClientVehicleChecklistPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<ClientVehicleChecklistPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerBatteryName = TextEditingController();
  
  String photoLocation = "";
  
  int _vehicleLeak = 0;


  int _vehicleEngine = 0;
  String _vehicleEnginePhotoLocation = "";

  int _vehicleDashCam = 0;
  String _vehicleDashCamPhotoLocation = "";


  int _vehicleOdometer = 0;
  String _vehicleOdometerPhotoLocation = "";

  int _vehicleKeys = 0;
  String _vehicleKeysPhotoLocation = "";


  int _vehicleETag = 0;
  String _vehicleETagPhotoLocation = "";

  int _vehicleSDCard = 0;
  String _vehicleSDCardPhotoLocation = "";

  int _vehicleGPS = 0;
  String _vehicleGPSPhotoLocation = "";

  int _vehicleChassis = 0;


  int _vehiclePillarA = 0;
  String _vehiclePillarAPhotoLocation = "";

  int _vehiclePillarB = 0;
  String _vehiclePillarBPhotoLocation = "";

  int _vehicleStarts = 0;
  int _vehicleBurnout = 0;
  int _vehicleWriteOff = 0;


  int _vehicleBonnet = 0;
  int _vehicleDamaged = 0;
  int _vehicleAirbag = 0;
  String _vehicleAirbagPhotoLocation = "";

  int _vehicleRolled = 0;
  int _vehicleBoot = 0;

  int _vehicleJackAndSpanner = 0;
  String _vehicleJackAndSpannerPhotoLocation = "";

  int _vehicleSpareWheel = 0;
  String _vehicleSpareWheelPhotoLocation = "";

  int _vehicleBattery = 0;
  String _vehicleBatteryPhotoLocation = "";

  int _vehicleFuel = 0;


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
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        _vehicleJackAndSpannerPhotoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }

  uploadCameraPhotoSpareWheelFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }
  uploadCameraPhotoBatteryFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }

  uploadCameraPhotoOdometerFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }

  uploadCameraPhotoKeysFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }

  uploadCameraPhotoETagFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }

  uploadCameraPhotoDashCamFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }

  uploadCameraPhotoSDCardFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }

  uploadCameraPhotoGPSFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
      debugPrint('No Image Path Received');
    }
  }
  uploadCameraPhotoPillarAFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
    }
  }
  uploadCameraPhotoPillarBFile() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { debugPrint(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      // List<int> imageBytes = await file.readAsBytes();
      setState(() {
        photoLocation = file.path.toString();
      });
    } else {
      debugPrint('No Image Path Received');
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
                          _vehicleStarts,
                          onChanged: (value) {
                            setState(() {
                              _vehicleStarts = value!;
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
                            groupValue: _vehicleStarts,
                            onChanged: (value) {
                              setState(() {
                                _vehicleStarts = value!;
                              });
                            }
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  if (_vehicleStarts == 1)
                    const Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("Burnout?",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if (_vehicleStarts == 1)
                    Row(
                      children: [
                        Radio<int>(
                            value: 1,
                            groupValue: _vehicleBurnout,
                            onChanged: (value) {
                              setState(() {
                                _vehicleBurnout = value!;
                              });
                            }
                        ),
                        SizedBox(width: 10.0,),
                        Text('Yes'),
                      ],
                    ),

                  if (_vehicleStarts == 1)
                    Row(
                      children: [
                        Radio<int>(
                            value: 2,
                            groupValue: _vehicleBurnout,
                            onChanged: (value) {
                              setState(() {
                                _vehicleBurnout = value!;
                              });
                            }
                        ),
                        SizedBox(width: 10.0,),
                        Text('Partial'),
                      ],
                    ),


                  if (_vehicleStarts == 1)
                    Row(
                      children: [
                        Radio<int>(
                            value: 3,
                            groupValue: _vehicleBurnout,
                            onChanged: (value) {
                              setState(() {
                                _vehicleBurnout = value!;
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
                          _vehicleWriteOff,
                          onChanged: (value) {
                            setState(() {
                              _vehicleWriteOff = value!;
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
                          groupValue: _vehicleWriteOff,
                          onChanged: (value) {
                            setState(() {
                              _vehicleWriteOff = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Any fluid leaking??",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                          _vehicleLeak,
                          onChanged: (value) {
                            setState(() {
                              _vehicleLeak = value!;
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
                          groupValue: _vehicleLeak,
                          onChanged: (value) {
                            setState(() {
                              _vehicleLeak = value!;
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
                          _vehicleBonnet,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBonnet = value!;
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
                          groupValue: _vehicleBonnet,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBonnet = value!;
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
                          _vehicleDamaged,
                          onChanged: (value) {
                            setState(() {
                              _vehicleDamaged = value!;
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
                          groupValue: _vehicleDamaged,
                          onChanged: (value) {
                            setState(() {
                              _vehicleDamaged = value!;
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
                          _vehicleAirbag,
                          onChanged: (value) {
                            setState(() {
                              _vehicleAirbag = value!;
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
                          groupValue: _vehicleAirbag,
                          onChanged: (value) {
                            setState(() {
                              _vehicleAirbag = value!;
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
                          _vehicleRolled,
                          onChanged: (value) {
                            setState(() {
                              _vehicleRolled = value!;
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
                          groupValue: _vehicleRolled,
                          onChanged: (value) {
                            setState(() {
                              _vehicleRolled = value!;
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
                          _vehicleBoot,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBoot = value!;
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
                          groupValue: _vehicleBoot,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBoot = value!;
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
                          groupValue: _vehicleBoot,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBoot = value!;
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
                          _vehicleJackAndSpanner,
                          onChanged: (value) {
                            setState(() {
                              _vehicleJackAndSpanner = value!;
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
                          groupValue: _vehicleJackAndSpanner,
                          onChanged: (value) {
                            setState(() {
                              _vehicleJackAndSpanner = value!;
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
                          groupValue: _vehicleJackAndSpanner,
                          onChanged: (value) {
                            setState(() {
                              _vehicleJackAndSpanner = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Unverifiable'),
                    ],
                  ),

                  if (_vehicleJackAndSpanner == 1)
                    const  Padding(
                      padding: EdgeInsets.all( 28.0,),
                      child: Text("Take a photo of both jack and wheel spanner",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if (_vehicleJackAndSpanner == 1)
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
                                  child: _vehicleJackAndSpannerPhotoLocation != "" ? Image.file(File(_vehicleJackAndSpannerPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                          _vehicleSpareWheel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleSpareWheel = value!;
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
                          groupValue: _vehicleSpareWheel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleSpareWheel = value!;
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
                          groupValue: _vehicleSpareWheel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleSpareWheel = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Unverifiable'),
                    ],
                  ),

                  if (_vehicleSpareWheel == 1)
                    const  Padding(
                      padding: EdgeInsets.all( 28.0,),
                      child: Text("Take a photo of the spare wheel",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if (_vehicleSpareWheel == 1)
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

                                // Container(
                                //   child: photoSpareWheelFile != null ? Image.file(photoSpareWheelFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoSpareWheelFile();
                                //     },
                                //   ),
                                // ),


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
                          _vehicleBattery,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBattery = value!;
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
                          groupValue: _vehicleBattery,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBattery = value!;
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
                          groupValue: _vehicleBattery,
                          onChanged: (value) {
                            setState(() {
                              _vehicleBattery = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('Unverifiable'),
                    ],
                  ),

                  if (_vehicleBattery == 1)
                    const  Padding(
                      padding: EdgeInsets.all( 28.0,),
                      child: Text("Take a photo of the battery",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if (_vehicleBattery == 1)
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

                                // Container(
                                //   child: photoBatteryFile != null ? Image.file(photoBatteryFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoBatteryFile();
                                //     },
                                //   ),
                                // ),


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

                  if (_vehicleBattery == 1)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 28.0, bottom: 18.0, left: 10, right: 10),
                        child: Text("Enter the make of the battery:", textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold,),
                        ),
                      ),
                    ),

                  if (_vehicleBattery == 1)
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
                          _vehicleOdometer,
                          onChanged: (value) {
                            setState(() {
                              _vehicleOdometer = value!;
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
                          groupValue: _vehicleOdometer,
                          onChanged: (value) {
                            setState(() {
                              _vehicleOdometer = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  if (_vehicleOdometer == 1)
                    const  Padding(
                      padding: EdgeInsets.all( 28.0,),
                      child: Text("Take a photo of the instrument cluster to show the odometer reading and the amount of fuel inside the vehicle",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),



                  if (_vehicleOdometer == 1)
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

                                // Container(
                                //   child: photoOdometerFile != null ? Image.file(photoOdometerFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoOdometerFile();
                                //     },
                                //   ),
                                // ),


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
                          _vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleFuel = value!;
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
                          groupValue: _vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleFuel = value!;
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
                          groupValue: _vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleFuel = value!;
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
                          groupValue: _vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleFuel = value!;
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
                          groupValue: _vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleFuel = value!;
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
                          groupValue: _vehicleFuel,
                          onChanged: (value) {
                            setState(() {
                              _vehicleFuel = value!;
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
                          _vehicleKeys,
                          onChanged: (value) {
                            setState(() {
                              _vehicleKeys = value!;
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
                          groupValue: _vehicleKeys,
                          onChanged: (value) {
                            setState(() {
                              _vehicleKeys = value!;
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
                          groupValue: _vehicleKeys,
                          onChanged: (value) {
                            setState(() {
                              _vehicleKeys = value!;
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
                          _vehicleKeys,
                          onChanged: (value) {
                            setState(() {
                              _vehicleKeys = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No, key is absent'),
                    ],
                  ),
                  if(_vehicleKeys != 4)
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

                                // Container(
                                //   child: photoKeysFile != null ? Image.file(photoKeysFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoKeysFile();
                                //     },
                                //   ),
                                // ),


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
                          _vehicleETag,
                          onChanged: (value) {
                            setState(() {
                              _vehicleETag = value!;
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
                          groupValue: _vehicleETag,
                          onChanged: (value) {
                            setState(() {
                              _vehicleETag = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if(_vehicleETag == 1)
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

                                // Container(
                                //   child: photoETagFile != null ? Image.file(photoETagFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoETagFile();
                                //     },
                                //   ),
                                // ),
                                //

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
                          _vehicleDashCam,
                          onChanged: (value) {
                            setState(() {
                              _vehicleDashCam = value!;
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
                          groupValue: _vehicleDashCam,
                          onChanged: (value) {
                            setState(() {
                              _vehicleETag = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if(_vehicleDashCam == 1)
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
                                  child: _vehicleDashCamPhotoLocation != "" ? Image.file(File(_vehicleDashCamPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                          _vehicleSDCard,
                          onChanged: (value) {
                            setState(() {
                              _vehicleSDCard = value!;
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
                          groupValue: _vehicleSDCard,
                          onChanged: (value) {
                            setState(() {
                              _vehicleSDCard = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if(_vehicleSDCard == 1)
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
                                  child: _vehicleSDCardPhotoLocation != "" ? Image.file(File(_vehicleSDCardPhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
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
                          _vehicleGPS,
                          onChanged: (value) {
                            setState(() {
                              _vehicleGPS = value!;
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
                          groupValue: _vehicleGPS,
                          onChanged: (value) {
                            setState(() {
                              _vehicleGPS = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if(_vehicleGPS == 1)
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

                                // Container(
                                //   child: photoGPSFile != null ? Image.file(photoGPSFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoGPSFile();
                                //     },
                                //   ),
                                // ),


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
                          _vehicleEngine,
                          onChanged: (value) {
                            setState(() {
                              _vehicleEngine = value!;
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
                          groupValue: _vehicleEngine,
                          onChanged: (value) {
                            setState(() {
                              _vehicleEngine = value!;
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
                          _vehicleChassis,
                          onChanged: (value) {
                            setState(() {
                              _vehicleChassis = value!;
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
                          groupValue: _vehicleChassis,
                          onChanged: (value) {
                            setState(() {
                              _vehicleChassis = value!;
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
                          _vehiclePillarA,
                          onChanged: (value) {
                            setState(() {
                              _vehiclePillarA = value!;
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
                          groupValue: _vehiclePillarA,
                          onChanged: (value) {
                            setState(() {
                              _vehiclePillarA = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if(_vehiclePillarA == 1)
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

                                // Container(
                                //   child: photoPillarAFile != null ? Image.file(photoPillarAFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoPillarAFile();
                                //     },
                                //   ),
                                // ),


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
                          _vehiclePillarB,
                          onChanged: (value) {
                            setState(() {
                              _vehiclePillarB = value!;
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
                          groupValue: _vehiclePillarB,
                          onChanged: (value) {
                            setState(() {
                              _vehiclePillarB = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),


                  if(_vehiclePillarB == 1)
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

                                // Container(
                                //   child: photoPillarBFile != null ? Image.file(photoPillarBFile!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                                //       :
                                //   IconButton( alignment: Alignment.center,
                                //     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                //     onPressed: () {
                                //       uploadCameraPhotoPillarBFile();
                                //     },
                                //   ),
                                // ),


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
                      onPressed: () async {
                        SharedPreferences prefs = await _prefs;

                        // prefs.setInt('vehicleJackAndSpanner', _vehicleBattery);
                        // prefs.setString('vehicleJackAndSpannerPhoto', _vehicleBatteryPhotoLocation);

                        prefs.setInt('vehicleJackAndSpanner', _vehicleJackAndSpanner);
                        prefs.setString('vehicleJackAndSpannerPhoto', _vehicleJackAndSpannerPhotoLocation);

                        // prefs.setInt('vehicleJackAndSpanner', _vehicleSDCard);
                        // prefs.setString('vehicleJackAndSpannerPhoto', _vehicleSDCardPhotoLocation);

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