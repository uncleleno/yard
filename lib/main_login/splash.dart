import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:yardapp/main_login/permissions.dart';
import 'package:yardapp/main_login/main_login.dart';


class Splash extends StatefulWidget {

  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();

  }

  _navigateToHome() async{
    await Future.delayed(Duration(milliseconds: 2000), () {});

    Navigator.pushNamed(context, '/PermissionsPage');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
              "assets/images/splash_screen.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
