import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_login/main_login.dart';
import 'package:yardapp/size.dart';

class PermissionsPage extends StatefulWidget {
  PermissionsPage({Key? key}) : super(key: key);

  @override
  State<PermissionsPage> createState() => _PermissionsPageState();
}


class _PermissionsPageState extends State<PermissionsPage> {

  void _checkPermission() async {
    final locationWhenInUseStatus = await Permission.locationWhenInUse.status;

    if (locationWhenInUseStatus.isDenied) {
      print('Turn on location services before requesting permission.');
      return;
    }

    final storageStatus = await Permission.storage.status;

    if (storageStatus.isDenied) {
      print('Turn on storageStatus services before requesting permission.');
      return;
    }

    final cameraStatus = await Permission.camera.status;

    if (cameraStatus.isDenied) {
      print('Turn on cameraStatus services before requesting permission.');
      return;
    }

    Navigator.pushNamed(context, '/MainLoginPage');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ListView(
            children: [

            Container(
            padding: const EdgeInsets.only(top: 70.0, bottom: 1.0),
            ),

              Image.asset('assets/images/img.png'),

              Container(
                padding: const EdgeInsets.only(top: 20.0, left: 22.0, right: 22.0, bottom: 1.0),
                child:
                  const Text("In order to fully utilise our yard app, we need you to allow the following permissions:",
                    style: TextStyle(
                        fontSize: 18,
                        color: permissionTextColor,
                        fontWeight: FontWeight.bold
                    ),),
              ),

              Container(
                padding: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0, bottom: 1.0),
                child:
                const Text("Camera:",
                  style: TextStyle(
                      fontSize: 16,
                      color: permissionTextColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 5.0, left: 22.0, right: 22.0, bottom: 1.0),
                child:
                const Text("To check in vehicles or released them from the respective yard.",
                  style: TextStyle(
                      fontSize: 14,
                      color: permissionTextColor,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0, bottom: 1.0),
                child:
                const Text("Location:",
                  style: TextStyle(
                      fontSize: 16,
                      color: permissionTextColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 5.0, left: 22.0, right: 22.0, bottom: 1.0),
                child:
                const Text("To verify the yard you're currently in.",
                  style: TextStyle(
                    fontSize: 14,
                    color: permissionTextColor,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 10.0, left: 22.0, right: 22.0, bottom: 1.0),
                child:
                const Text("Storage:",
                  style: TextStyle(
                      fontSize: 16,
                      color: permissionTextColor,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 5.0, left: 22.0, right: 22.0, bottom: 1.0),
                child:
                const Text("To store images captured from your phone.",
                  style: TextStyle(
                    fontSize: 14,
                    color: permissionTextColor,
                  ),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(top: 50.0, bottom: 1.0),
              ),

              Center(
                child:
                SizedBox(
                  height: buttonHeight,
                  width: buttonWidth,
                  child:

                  OutlinedButton(
                    onPressed: () async {

                      Map<Permission, PermissionStatus> statuses = await [
                        Permission.location, Permission.storage, Permission.camera
                      ].request();

                      _checkPermission();

                    },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                           const BorderSide(color: buttonColorBorder, width: borderWidth)
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiusButton),
                        ),

                      ),
                        backgroundColor: MaterialStateProperty.all<Color>(buttonColorBorder)
                    ),
                    child:
                    const Text("Allow",
                      style:
                      TextStyle(
                          color: buttonColorText,

                          fontSize: buttonSizeText, ),
                    ), //
                  ),
                ),
              ),
            ],
          )
      ),
    );
  }
}
