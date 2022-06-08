import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/check_in/vehicle_checklist_sign_off.dart';
import 'package:yardapp/size.dart';

class VehicleLooseItemsPage extends StatefulWidget {
  const VehicleLooseItemsPage({Key? key}) : super(key: key);


  @override
  State<VehicleLooseItemsPage> createState() => _VehicleQRScanPageState();
}

class _VehicleQRScanPageState extends State<VehicleLooseItemsPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final TextEditingController controllerLooseItem1Name = TextEditingController();
  final TextEditingController controllerLooseItem2Name = TextEditingController();
  final TextEditingController controllerLooseItem3Name = TextEditingController();

  //
  // File? photoLooseItem1File;
  // File? photoLooseItem2File;
  // File? photoLooseItem3File;
  // File? photoLooseItem4File;
  // File? photoLooseItem5File;
  // File? photoLooseItem6File;
  // File? photoLooseItem7File;
  // File? photoLooseItem8File;
  // File? photoLooseItem9File;

  String photoLocation = "";

  String looseItem1 = "";
  String looseItem2 = "";
  String looseItem3 = "";

  String looseItem1PhotoLocation = "";
  String looseItem2PhotoLocation = "";
  String looseItem3PhotoLocation = "";

  int _vehicleLooseItem1 = 0;
  int _vehicleLooseItem2 = 0;
  int _vehicleLooseItem3 = 0;

  bool looseItemText1 = false;
  bool looseItemText2 = false;
  bool looseItemText3 = false;

  @override
  void initState() {
    super.initState();
    getInitialValues();
  }

  void getInitialValues() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      _vehicleLooseItem1 = prefs.getInt('looseItem1') ?? 0;
      _vehicleLooseItem2 = prefs.getInt('looseItem2') ?? 0;
      _vehicleLooseItem3 = prefs.getInt('looseItem3') ?? 0;

      looseItem1 = prefs.getString('looseItem1Value') ?? '';
      looseItem2 = prefs.getString('looseItem2Value') ?? '';
      looseItem3 = prefs.getString('looseItem3Value') ?? '';

      looseItem1PhotoLocation = prefs.getString('looseItem1PhotoLocation') ?? '';
      looseItem2PhotoLocation = prefs.getString('looseItem2PhotoLocation') ?? '';
      looseItem3PhotoLocation = prefs.getString('looseItem3PhotoLocation') ?? '';

    });

    controllerLooseItem1Name.value = controllerLooseItem1Name.value.copyWith(text: looseItem1);
    controllerLooseItem2Name.value = controllerLooseItem2Name.value.copyWith(text: looseItem2);
    controllerLooseItem3Name.value = controllerLooseItem3Name.value.copyWith(text: looseItem3);
  }



  uploadCameraPhotoLooseItem1File() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        looseItem1PhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }


  uploadCameraPhotoLooseItem2File() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        looseItem2PhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoLooseItem3File() async {
    final _imagePicker = ImagePicker();
    XFile? image;

    //Select Image

    try {
      image = (await _imagePicker.pickImage(source: ImageSource.camera, imageQuality: 100));
    } catch(e) { print(e.toString()); }

    if (image != null) {
      var file = File(image.path);
      setState(() {
        looseItem3PhotoLocation = file.path.toString();
      });
    } else {
      print('No Image Path Received');
    }
  }
/*

  uploadCameraPhotoLooseItem4File() async {
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
      setState(() => photoLooseItem4File = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoLooseItem5File() async {
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
      setState(() => photoLooseItem5File = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }
  uploadCameraPhotoLooseItem6File() async {
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
      setState(() => photoLooseItem6File = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoLooseItem7File() async {
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
      setState(() => photoLooseItem7File = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoLooseItem8File() async {
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
      setState(() => photoLooseItem8File = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }

  uploadCameraPhotoLooseItem9File() async {
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
      setState(() => photoLooseItem9File = imageTemporary);
      // Navigator.of(context);
    } else {
      print('No Image Path Received');
    }
  }
*/

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
                  child: Text("Other Loose items in Vehicle", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
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
                      child: Text("Look for other loose items inside this vehicle to prove that nothing that belongs to the owner goes missing",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),

                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("Hint: A loose item may be sunglasses, USB sticks, clothing, baby seats, etc.",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),


                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Can you find any loose items?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                          _vehicleLooseItem1,
                          onChanged: (value) {
                            setState(() {
                              _vehicleLooseItem1 = value!;
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
                          groupValue: _vehicleLooseItem1,
                          onChanged: (value) {
                            setState(() {
                              _vehicleLooseItem1 = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  if (_vehicleLooseItem1 == 1)
                  const  Padding(
                    padding: EdgeInsets.all( 28.0,),
                    child: Text("Loose item description ",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  if (_vehicleLooseItem1 == 1)
                    Container(
                      padding: EdgeInsets.all(16),
                      child: TextFormField(
                        // onChanged: (String nameText) {
                        //   getLooseItem1();
                        // },
                        controller: controllerLooseItem1Name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),

                  if (_vehicleLooseItem1 == 1)
                    Padding(
                      padding: EdgeInsets.all( 28.0,),
                      child: Text("Take a photo of the $looseItem1 ",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if (_vehicleLooseItem1 == 1)
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
                                  child: looseItem1PhotoLocation != '' ? Image.file(File(looseItem1PhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                      :
                                  IconButton( alignment: Alignment.center,
                                    icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                    onPressed: () {
                                      uploadCameraPhotoLooseItem1File();
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
                                    uploadCameraPhotoLooseItem1File();
                                  },
                                ),
                                // ),
                              ]
                          )
                      ),
                    ),


                  if(looseItem1PhotoLocation != '')
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text("Any more loose items?",
                      style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  if(looseItem1PhotoLocation != '')
                  Row(
                    children: [
                      Radio<int>(
                          value: 1,
                          groupValue:
                          _vehicleLooseItem2,
                          onChanged: (value) {
                            setState(() {
                              _vehicleLooseItem2 = value!;
                            });
                          }
                      ),
                      SizedBox(width: 10.0,),
                      Text('Yes'),
                    ],
                  ),

                  if(looseItem1PhotoLocation != '')
                  Row(
                    children: [
                      Radio<int>(
                          value: 2,
                          groupValue: _vehicleLooseItem2,
                          onChanged: (value) {
                            setState(() {
                              _vehicleLooseItem2 = value!;
                            });
                          }
                      ),

                      SizedBox(width: 10.0,),
                      Text('No'),
                    ],
                  ),

                  if(_vehicleLooseItem2 == 1)
                  const  Padding(
                    padding: EdgeInsets.all( 28.0,),
                    child: Text("Loose item description ",
                      style: TextStyle(
                          fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                    ),
                  ),

                  if(_vehicleLooseItem2 == 1)
                  Container(
                    padding: EdgeInsets.all(16),
                    child: TextFormField(
                      // onChanged: (String nameText) {
                      //   getLooseItem2();
                      // },
                      controller: controllerLooseItem2Name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                    ),
                  ),


                  if(_vehicleLooseItem2 == 1)
                  OutlinedButton(
                    // onFocusChange: toggleSwitch,
                    onPressed: () async {
                      setState(() {
                        looseItemText2 = true;
                      });

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
                        backgroundColor:  MaterialStateProperty.all<Color>(acceptButton)
                    ),
                    child: const Text("Enter",
                      style: TextStyle(
                          color: buttonColorText,
                          fontSize: buttonSizeText, fontFamily: "Raleway.Bold"),
                    ), // backgroundColor: Colors.blue
                  ),



                  if(_vehicleLooseItem2 == 1)
                    Visibility(
                      visible: looseItemText2,
                      child:
                      Padding(
                        padding: EdgeInsets.all( 28.0,),
                        child: Text("Take a photo of the $looseItem2 ",
                          style: TextStyle(
                              fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  if(_vehicleLooseItem2 == 1)
                    Visibility(
                      visible: looseItemText2,
                      child:
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
                                    child: looseItem2PhotoLocation != '' ? Image.file(File(looseItem2PhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                        :
                                    IconButton( alignment: Alignment.center,
                                      icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                      onPressed: () {
                                        uploadCameraPhotoLooseItem2File();
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
                                      uploadCameraPhotoLooseItem2File();
                                    },
                                  ),
                                  // ),
                                ]
                            )
                        ),
                      ),
                    ),

                  if(looseItem2PhotoLocation != '')
                    const Padding(
                      padding: EdgeInsets.all(28.0),
                      child: Text("Any more loose items?",
                        style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if(looseItem2PhotoLocation != '')
                    Row(
                      children: [
                        Radio<int>(
                            value: 1,
                            groupValue:
                            _vehicleLooseItem3,
                            onChanged: (value) {
                              setState(() {
                                _vehicleLooseItem3 = value!;
                              });
                            }
                        ),
                        SizedBox(width: 10.0,),
                        Text('Yes'),
                      ],
                    ),

                  if(looseItem2PhotoLocation != '')
                    Row(
                      children: [
                        Radio<int>(
                            value: 2,
                            groupValue: _vehicleLooseItem3,
                            onChanged: (value) {
                              setState(() {
                                _vehicleLooseItem3 = value!;
                              });
                            }
                        ),

                        SizedBox(width: 10.0,),
                        Text('No'),
                      ],
                    ),

                  if(_vehicleLooseItem3 == 1)
                    const  Padding(
                      padding: EdgeInsets.all( 28.0,),
                      child: Text("Loose item description ",
                        style: TextStyle(
                            fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                      ),
                    ),

                  if(_vehicleLooseItem3 == 1)
                    Container(
                      padding: EdgeInsets.all(16),
                      child: TextFormField(
                        controller: controllerLooseItem3Name,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                      ),
                    ),


                  if(_vehicleLooseItem3 == 1)
                    OutlinedButton(
                      // onFocusChange: toggleSwitch,
                      onPressed: () async {
                        setState(() {
                          looseItemText3 = true;
                        });

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
                          backgroundColor:  MaterialStateProperty.all<Color>(acceptButton)
                      ),
                      child: const Text("Enter",
                        style: TextStyle(
                            color: buttonColorText,
                            fontSize: buttonSizeText, fontFamily: "Raleway.Bold"),
                      ), // backgroundColor: Colors.blue
                    ),



                  if(_vehicleLooseItem3 == 1)
                    Visibility(
                      visible: looseItemText3,
                      child:
                      Padding(
                        padding: EdgeInsets.all( 28.0,),
                        child: Text("Take a photo of the $looseItem3 ",
                          style: TextStyle(
                              fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  if(_vehicleLooseItem3 == 1)
                    Visibility(
                      visible: looseItemText3,
                      child:
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
                                    child: looseItem3PhotoLocation != '' ? Image.file(File(looseItem3PhotoLocation), width: 150, height: 150, fit: BoxFit.fitWidth,)
                                        :
                                    IconButton( alignment: Alignment.center,
                                      icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                                      onPressed: () {
                                        uploadCameraPhotoLooseItem3File();
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
                                      uploadCameraPhotoLooseItem3File();
                                    },
                                  ),
                                  // ),
                                ]
                            )
                        ),
                      ),
                    ),

                  // if(photoLooseItem3File != null)
                  //   const Padding(
                  //     padding: EdgeInsets.all(28.0),
                  //     child: Text("Any more loose items?",
                  //       style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                  //     ),
                  //   ),

                  // if(photoLooseItem3File != null)
                  //   Row(
                  //     children: [
                  //       Radio<int>(
                  //           value: 1,
                  //           groupValue:
                  //           _vehicleLooseItem4,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               _vehicleLooseItem4 = value!;
                  //             });
                  //           }
                  //       ),
                  //       SizedBox(width: 10.0,),
                  //       Text('Yes'),
                  //     ],
                  //   ),
                  //
                  // if(photoLooseItem3File != null)
                  //   Row(
                  //     children: [
                  //       Radio<int>(
                  //           value: 2,
                  //           groupValue: _vehicleLooseItem4,
                  //           onChanged: (value) {
                  //             setState(() {
                  //               _vehicleLooseItem4 = value!;
                  //             });
                  //           }
                  //       ),
                  //
                  //       SizedBox(width: 10.0,),
                  //       Text('No'),
                  //     ],
                  //   ),
                  //
                  // if(_vehicleLooseItem4 == 1)
                  //   const  Padding(
                  //     padding: EdgeInsets.all( 28.0,),
                  //     child: Text("Loose item description ",
                  //       style: TextStyle(
                  //           fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  //
                  // if(_vehicleLooseItem4 == 1)
                  //   Container(
                  //     padding: EdgeInsets.all(16),
                  //     child: TextFormField(
                  //       onChanged: (String nameText) {
                  //         getLooseItem3();
                  //       },
                  //       controller: controllerLooseItem4Name,
                  //       decoration: InputDecoration(
                  //         border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  //
                  //
                  // if(_vehicleLooseItem4 == 1)
                  //   OutlinedButton(
                  //     // onFocusChange: toggleSwitch,
                  //     onPressed: () async {
                  //       final SharedPreferences prefs = await _prefs4;
                  //       // Save an integer value to 'counter' key.
                  //       // await prefs.setInt('counter', 10);
                  //       // Save an boolean value to 'repeat' key.
                  //       // await prefs.setBool('repeat', true);
                  //       // Save an double value to 'decimal' key.
                  //       // await prefs.setDouble('decimal', 1.5);
                  //       // Save an String value to 'action' key.
                  //       await prefs.setString('looseItem4', controllerLooseItem4Name.text);
                  //       setState(() {
                  //         looseItemText4 = true;
                  //       });
                  //
                  //     },
                  //     style: ButtonStyle(
                  //         side: MaterialStateProperty.all(
                  //             BorderSide(color: otpButtonBackground, width: borderWidth)
                  //         ),
                  //         shape: MaterialStateProperty.all(
                  //           RoundedRectangleBorder(
                  //             borderRadius: BorderRadius.circular(borderRadiusButton),
                  //           ),
                  //         ),
                  //         backgroundColor:  MaterialStateProperty.all<Color>(acceptButton)
                  //     ),
                  //     child: const Text("Enter",
                  //       style: TextStyle(
                  //           color: buttonColorText,
                  //           fontSize: buttonSizeText, fontFamily: "Raleway.Bold"),
                  //     ), // backgroundColor: Colors.blue
                  //   ),
                  //
                  //
                  //
                  // if(_vehicleLooseItem4 == 1)
                  //   Visibility(
                  //     visible: looseItemText4,
                  //     child:
                  //     Padding(
                  //       padding: EdgeInsets.all( 28.0,),
                  //       child: Text("Take a photo of the $looseItem4 ",
                  //         style: TextStyle(
                  //             fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                  //       ),
                  //     ),
                  //   ),
                  //
                  // if(_vehicleLooseItem4 == 1)
                  //   Visibility(
                  //     visible: looseItemText4,
                  //     child:
                  //     Container(
                  //       width: buttonPhotoBoxWidth,
                  //       height: buttonPhotoBoxHeight,
                  //       margin: const EdgeInsets.fromLTRB(140, 0, 140, 0),
                  //       padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
                  //       decoration: BoxDecoration(
                  //           color: buttonColorText,
                  //           border: Border.all(
                  //             color: Colors.black,
                  //             width: 0.5,
                  //           ), borderRadius: BorderRadius.circular(0.0)
                  //       ),
                  //
                  //       child: Center(
                  //           child: ListView(
                  //               children: [
                  //
                  //                 Container(
                  //                   child: photoLooseItem4File != null ? Image.file(photoLooseItem4File!, width: 150, height: 150, fit: BoxFit.fitWidth,)
                  //                       :
                  //                   IconButton( alignment: Alignment.center,
                  //                     icon: const Icon(Icons.camera_alt_rounded, size: buttonIconSize, color: secondaryOverlayColor),
                  //                     onPressed: () {
                  //                       uploadCameraPhotoLooseItem4File();
                  //                     },
                  //                   ),
                  //                 ),
                  //
                  //
                  //                 // const Padding(
                  //                 //   padding: EdgeInsets.only(top: buttonTextPadding),
                  //                 //   child:
                  //                 GestureDetector(
                  //                   child:
                  //                   // Container(
                  //                   //   padding: const EdgeInsets.only(left: 3.0, top: 80),
                  //                   //   child:
                  //                   const Padding(
                  //                     padding: EdgeInsets.only(top: buttonTextPadding),
                  //                     child: Text('Take Photo',
                  //                         style: TextStyle(
                  //                           backgroundColor: secondaryOverlayColor,
                  //                           color: buttonColorText,
                  //                         ),
                  //                         textAlign: TextAlign.center
                  //                     ),
                  //                   ),
                  //                   // ),
                  //
                  //                   onTap: () {
                  //                     uploadCameraPhotoLooseItem4File();
                  //                   },
                  //                 ),
                  //
                  //
                  //
                  //                 // ),
                  //               ]
                  //           )
                  //       ),
                  //     ),
                  //   ),
                  //
                  // if(photoLooseItem4File != null)
                  //   const Padding(
                  //     padding: EdgeInsets.all(28.0),
                  //     child: Text("All Done!",
                  //       style: TextStyle(fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                  //     ),
                  //   ),


                  OutlinedButton(
                    onPressed: () async {

                      SharedPreferences prefs = await _prefs;

                      // prefs.setInt('vehicleJackAndSpanner', _vehicleBattery);
                      // prefs.setString('vehicleJackAndSpannerPhoto', _vehicleBatteryPhotoLocation);

                      prefs.setInt('looseItem1', _vehicleLooseItem1);
                      prefs.setInt('looseItem2', _vehicleLooseItem2);
                      prefs.setInt('looseItem3', _vehicleLooseItem3);

                      prefs.setString('looseItem1Value', controllerLooseItem1Name.text);
                      prefs.setString('looseItem2Value', controllerLooseItem2Name.text);
                      prefs.setString('looseItem3Value', controllerLooseItem3Name.text);

                      prefs.setString('looseItem1PhotoLocation', looseItem1PhotoLocation);
                      prefs.setString('looseItem2PhotoLocation', looseItem2PhotoLocation);
                      prefs.setString('looseItem3PhotoLocation', looseItem3PhotoLocation);


                    Navigator.push(context, MaterialPageRoute(builder: (context) => VehicleCheckListSignOffPage()));
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