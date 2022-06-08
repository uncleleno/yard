import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/sign_up/create_password.dart';
import 'package:yardapp/size.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final TextEditingController controllerOTP = TextEditingController();
  bool onInputValidated = true;

  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    getPhoneNumber();

  }

  void getPhoneNumber() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      phoneNumber = prefs.getString('phoneNumber') ?? '';
    });

  }

  void otpSwitch () {
    // print("-----");
    // print("controllerOTP.text: ${controllerOTP.text.isNotEmpty}");

    if (controllerOTP.text.isNotEmpty == true && controllerOTP.text.length < 5 == false && controllerOTP.text.length > 5 == false) {
      setState(() {
        onInputValidated = false;
      });
    } else {
      setState(() {
        onInputValidated = true;
      });
    }
    // print("onInputValidated: $onInputValidated");
    // print("+++++");
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
                padding: const EdgeInsets.only(top: 80,),
                child: const Center(
                  child: Text("Reset and create Password",
                    style: TextStyle(
                        color: textHeaderColor,
                        fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Raleway"),
                  ),
                ),
              ),

              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 20.0, left: 42.0, right: 42.0, bottom: 20.0),
                  child: Text("We've sent an SMS with the OTP code to: $phoneNumber "
                    ,style: TextStyle( fontSize: 15), ),
                ),
              ),


              const Padding(
                padding: EdgeInsets.only(top: 0.0, left: 32.0, right: 42.0, bottom: 5.0),
                child: Text('Enter OTP code:',
                    style: TextStyle(
                        fontSize: 18.0)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 22.0, right: 22.0, bottom: 20.0),
                child: Column(

                  children: [
                    TextFormField(
                      onChanged: (String nameText) {
                        otpSwitch();
                      },
                      keyboardType:
                      TextInputType.numberWithOptions(signed: true, decimal: false),
                      controller: controllerOTP,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePasswordPage()));
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
                        child: const Text("Continue",
                          style: TextStyle(
                              color: buttonColorText,
                              fontSize: buttonSizeText),
                        ), // backgroundColor: Colors.blue
                      ),
                    )),
              ),
              // Center(child:
              // GestureDetector(
              //     child: Padding(
              //       padding: const EdgeInsets.only(top: 40.0, left: 22.0, right: 22.0, bottom: 20.0),
              //       child: Text("I didn't receive the OTP code", style: TextStyle(fontSize: 14,
              //         color: underlineTextColor,
              //         decoration: TextDecoration.underline,)
              //       ),
              //     ),
              //     onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CreatePasswordPage()))
              // )
              // )
            ],

          )
      ),
    );
  }
}
