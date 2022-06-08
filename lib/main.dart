import 'package:flutter/material.dart';
import 'package:yardapp/main_app/check_in/sp_details.dart';
import 'package:yardapp/main_app/check_in/sp_drivers_license.dart';
import 'package:yardapp/main_app/check_in/sp_license_disk_details.dart';
import 'package:yardapp/main_app/check_in/sp_scan.dart';
import 'package:yardapp/main_app/check_in/sp_scan_license.dart';
import 'package:yardapp/main_app/check_in/sp_vehicle_identify.dart';
import 'package:yardapp/main_app/check_in/sp_wrong_license_disk.dart';
import 'package:yardapp/main_app/check_in/tow_slip_photo.dart';
import 'package:yardapp/main_app/check_in/vehicle_checklist.dart';
import 'package:yardapp/main_app/check_in/vehicle_delivered.dart';
import 'package:yardapp/main_app/check_in/vehicle_description.dart';
import 'package:yardapp/main_app/check_in/vehicle_exterior.dart';
import 'package:yardapp/main_app/check_in/vehicle_exterior_addtitional_photo.dart';
import 'package:yardapp/main_app/check_in/vehicle_exterior_photo.dart';
import 'package:yardapp/main_app/check_in/vehicle_identify.dart';
import 'package:yardapp/main_app/check_in/vehicle_interior.dart';
import 'package:yardapp/main_app/check_in/vehicle_interior_additional_photo.dart';
import 'package:yardapp/main_app/check_in/vehicle_interior_photo.dart';
import 'package:yardapp/main_app/check_in/vehicle_loose_items.dart';
import 'package:yardapp/main_app/check_in/vehicle_qr.dart';
import 'package:yardapp/main_app/check_in/vehicle_qr_scan.dart';
import 'package:yardapp/main_app/check_in/vehicle_radio.dart';
import 'package:yardapp/main_app/check_in/vehicle_scan_license.dart';
import 'package:yardapp/main_app/check_in/vehicle_tyre_photo.dart';
import 'package:yardapp/main_app/check_in/wrong_license_disk.dart';
import 'package:yardapp/main_app/main_app.dart';
import 'package:yardapp/main_app/release/client/client_select_yard.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_checklist.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_description.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_exterior.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_exterior_photo.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_exterior_photos_additional.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_identify.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_interior.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_interior_photo.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_interior_photo_additional.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_qr.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_qr_scan.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_radio.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_scan_license.dart';
import 'package:yardapp/main_app/release/client/client_vehicle_tyre_photo.dart';
import 'package:yardapp/main_app/release/client/client_wrong_license%20disk.dart';
import 'package:yardapp/main_login/main_login.dart';
import 'package:yardapp/main_login/permissions.dart';
import 'package:yardapp/main_login/splash.dart';
import 'package:yardapp/sign_in/enter_password.dart';
import 'package:yardapp/sign_in/sign_in.dart';
import 'package:yardapp/sign_up/create_password.dart';
import 'package:yardapp/sign_up/how_it_works.dart';
import 'package:yardapp/sign_up/otp.dart';
import 'package:yardapp/sign_up/select_yard.dart';
import 'package:yardapp/sign_up/sign_up.dart';
// import 'package:permission_handler/permission_handler.dart';


void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yard App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const Splash(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/PermissionsPage': (context) => PermissionsPage(),
        '/MainLoginPage': (context) => const MainLoginPage(),

        '/SignInPage': (context) => const SignInPage(),
        '/SignUpPage': (context) => const SignUpPage(),

        // Sign Up Section
        '/OtpPage': (context) => const OtpPage(),
        '/CreatePasswordPage': (context) => const CreatePasswordPage(),
        '/HowItWorksPage': (context) => const HowItWorksPage(),
        '/SelectYardPage': (context) => const SelectYardPage(),
        '/MainAppPage': (context) => const MainAppPage(),

        // Sign In Section
        '/EnetPasswordPage': (context) => const EnterPasswordPage(),

        // Check In
        '/VehicleQRScanPage': (context) => const VehicleQRScanPage(),
        '/VehicleQRPage': (context) => const VehicleQRPage(),
        '/VehicleIdentifyPage': (context) => const VehicleIdentifyPage(),
        '/VehicleDescriptionPage': (context) => const VehicleDescriptionPage(),
        '/VehicleScanLicensePage': (context) => const VehicleScanLicensePage(),
        '/VehicleDeliveredPage': (context) => const VehicleDeliveredPage(),
        '/SPDetailsPage': (context) => const SPDetailsPage(),
        '/SPScanPage': (context) => const SPScanPage(),
        '/WrongLicenseDiskPage': (context) => const WrongLicenseDiskPage(),
        '/SPVehicleIdentifyPage': (context) => const SPVehicleIdentifyPage(),
        '/SPScanLicensePage': (context) => const SPScanLicensePage(),
        '/SPDriversLicensePage': (context) => const SPLicenseDiskPage(),
        '/SPWrongLicenseDiskPage': (context) => const SPWrongLicenseDiskPage(),
        '/TowSlipPhotoPage': (context) => const TowSlipPhotoPage(),
        '/SPDriversLicense': (context) => const SPDriversLicense(),
        '/VehicleExteriorPage': (context) => const VehicleExteriorPage(),
        '/VehicleExteriorPhotoPage': (context) => const VehicleExteriorPhotoPage(),
        '/VehicleExteriorAdditionalPhotoPage': (context) => const VehicleExteriorAdditionalPhotoPage(),
        '/VehicleTyrePhotoPage': (context) => const VehicleTyrePhotoPage(),
        '/VehicleInteriorPage': (context) => const VehicleInteriorPage(),
        '/VehicleInteriorPhotoPage': (context) => const VehicleInteriorPhotoPage(),
        '/VehicleRadioPage': (context) => const VehicleRadioPage(),
        '/VehicleInteriorAdditionalPhotoPage': (context) => const VehicleInteriorAdditionalPhotoPage(),
        '/VehicleChecklistPage': (context) => const VehicleChecklistPage(),
        '/VehicleLooseItemsPage': (context) => const VehicleLooseItemsPage(),



        //Client Release
        '/ClientSelectYardPage': (context) => const ClientSelectYardPage(),
        '/ClientQRCodePage': (context) => const ClientQRCodePage(),
        '/ClientVehicleIdentifyPage': (context) => ClientVehicleIdentifyPage(),
        '/ClientVehicleQRScanPage': (context) => ClientVehicleQRScanPage(),
        '/ClientVehicleDescriptionPage': (context) => ClientVehicleDescriptionPage(),
        '/ClientVehicleScanLicensePage': (context) => ClientVehicleScanLicensePage(),
        '/ClientWrongLicenseDiskPage': (context) => ClientWrongLicenseDiskPage(),
        '/ClientVehicleExteriorPhotoPage': (context) => ClientVehicleExteriorPhotoPage(),
        '/ClientVehicleExteriorPage': (context) => ClientVehicleExteriorPage(),
        '/ClientVehicleTyrePhotoPage': (context) => ClientVehicleTyrePhotoPage(),
        '/ClientVehicleExteriorAdditionalPhotoPage': (context) => ClientVehicleExteriorAdditionalPhotoPage(),
        '/ClientVehicleInteriorPage': (context) => ClientVehicleInteriorPage(),
        '/ClientVehicleInteriorPhotoPage': (context) => ClientVehicleInteriorPhotoPage(),
        '/ClientVehicleRadioPage': (context) => ClientVehicleRadioPage(),
        '/ClientVehicleInteriorAdditionalPhotoPage': (context) => ClientVehicleInteriorAdditionalPhotoPage(),
        '/ClientVehicleChecklistPage': (context) => ClientVehicleChecklistPage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),
        // '/SPScanLicensePage': (context) => SPScanLicensePage(),







      },
      // home: Splash(),
    );
  }
}

