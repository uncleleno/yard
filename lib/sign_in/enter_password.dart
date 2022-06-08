
import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/main_app.dart';
import 'package:yardapp/sign_in/delete_account.dart';
import 'package:yardapp/sign_in/forgot_password.dart';
import 'package:yardapp/sign_up/how_it_works.dart';
import 'package:yardapp/size.dart';

class EnterPasswordPage extends StatefulWidget {
  const EnterPasswordPage({Key? key}) : super(key: key);

  @override
  State<EnterPasswordPage> createState() => _EnterPasswordPageState();
}

class _EnterPasswordPageState extends State<EnterPasswordPage> {
  final TextEditingController controllerPassword = TextEditingController();
  bool onInputValidated = true;

  @override
  void initState() {
    super.initState();
  }
  void otpSwitch () {
    print("-----");
    print("controllerPassword.text: ${controllerPassword.text.isNotEmpty}");

    if (controllerPassword.text.isNotEmpty == true && controllerPassword.text.length < 4 == false && controllerPassword.text.length > 4 == false) {
      setState(() {
        onInputValidated = false;
      });
    } else {
      setState(() {
        onInputValidated = true;
      });
    }
    // print("onInputValidated: $onInputValidated");
    // print("++++");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.blue[800], size: 35.0,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: buttonColorText,
        elevation: 0,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 85, bottom: 30),
              child: Center(
                child: Text("Enter Password",
                  style: TextStyle(
                      color: textHeaderColor,
                      fontSize: 25, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 22.0, right: 22.0, bottom: 20.0),
              child: Column(

                children: [
                  const Text('Enter your pin:', style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                  TextFormField(
                    onChanged: (String nameText) {
                      otpSwitch();
                    },
                    keyboardType:
                    TextInputType.numberWithOptions(signed: true, decimal: false),
                    controller: controllerPassword,
                    decoration: InputDecoration( suffixIcon: Icon(Icons.remove_red_eye_rounded),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  GestureDetector(
                      child:
                      Container(
                        padding: const EdgeInsets.only(left: 3.0, top: 20),
                        child:
                        const Text("Forgot Password?",
                          style: TextStyle(
                              fontSize: 14,
                              color: underlineTextColor,
                              decoration: TextDecoration.underline,
                              fontFamily: "Raleway.Bold"
                          ),
                        ),
                      ),

                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPasswordPage()))
                  ),
                ],
              ),
            ),
            Center(
              child:
              SizedBox(
                  height: buttonHeight,
                  width: buttonWidth,
                  child:
                  AbsorbPointer(
                    absorbing: onInputValidated,
                    child:
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => MainAppPage()));
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
                          backgroundColor: (onInputValidated == true)? MaterialStateProperty.all<Color>(otpButtonBackground): MaterialStateProperty.all<Color>(acceptButton)
                      ),
                      child: const Text("Sign In",
                        style: TextStyle(
                            color: buttonColorText,
                            fontSize: buttonSizeText, fontFamily: "Raleway",fontWeight: FontWeight.bold),
                      ), // backgroundColor: Colors.blue
                    ),
                  )),
            ),
            Center(
                child:
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, left: 22.0, right: 22.0, bottom: 20.0),
                  child: Text("Delete my account", style: TextStyle(fontSize: 14,
                    color: underlineTextColor,
                    decoration: TextDecoration.underline,)
                  ),
                ),
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DeleteAccountPage()))
            )
            )
          ],
        )
      ),
    );
  }
}
