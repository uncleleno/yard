import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/sign_in/sign_in.dart';
import 'package:yardapp/sign_up/otp.dart';
import 'package:yardapp/size.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/lib/texts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController controllerName = TextEditingController();
  final TextEditingController controllerMobile = TextEditingController();

  String initialCountry = 'ZA';
  PhoneNumber number = PhoneNumber(isoCode: 'ZA');
  bool isSwitched = false;
  bool onInputValidated = true;

  @override
  void initState() {
    super.initState();
  }

  void toggleSwitch(bool value) {
    // print("controllerName.text: ${controllerName.text.isNotEmpty}");

    // controllerName.text.isNotEmpty

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;
      });
      // print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;
      });
      // print('Switch Button is OFF');
    }
  }
  void nameAndNumber () {


    if (controllerName.text.isNotEmpty == true && controllerMobile.text.isNotEmpty == true) {
      setState(() {
        onInputValidated = false;
      });
    } else {
      setState(() {
        onInputValidated = true;
      });
    }

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
            const Center(
              child: Text("Sign up",
                  style: TextStyle(
                      color: textHeaderColor,
                      fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30.0, bottom: 1.0),
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.only(top: 0.0, left: 22.0, right: 22.0, bottom: 1.0),
                  child:const Text('Name and Surname:',
                      style: TextStyle(
                          fontSize: 18.0)
                  ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
                child: TextFormField(
                  onChanged: (String nameText) {
                    nameAndNumber();
                  },
                  controller: controllerName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ),
            ),

        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Mobile Number:",
             // softWrap: true,
              style: TextStyle(
                fontSize: 14,
                color: otpButtonBackground,
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 5.0, bottom: 1.0, left: 29, right: 19),
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    // // print(number.phoneNumber);
                  },
                  selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  textFieldController: controllerMobile,
                  formatInput: false,
                  keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: false),
                  inputBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                  onInputValidated: (bool valueValid) {
                    if (valueValid == true) {
                      nameAndNumber();
                    } else {
                      setState(() {
                        onInputValidated = true;
                      });
                    }
                  },
                  onSaved: (PhoneNumber number) {

                  },
                ),
            ),


            Container(
              padding: EdgeInsets.only(top: 5.0, bottom: 1.0),
            ),

            Center(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("I'd like to help improve the app.",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 14,
                      color: otpButtonBackground,

                    ),
                  ),

                  Container(
                    child: Switch(
                      onChanged: toggleSwitch,
                      value: isSwitched,
                      activeColor: Colors.blue,
                      activeTrackColor: otpButtonBackground,
                      inactiveThumbColor: Colors.grey,
                      inactiveTrackColor: otpButtonBackground,
                    ),
                  )
                ],
              ),
            ),

            Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 1.0),
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
                    // onFocusChange: toggleSwitch,
                    onPressed: () async {
                      final SharedPreferences prefs = await _prefs;
                      // Save an integer value to 'counter' key.
                      // await prefs.setInt('counter', 10);
                      // Save an boolean value to 'repeat' key.
                      // await prefs.setBool('repeat', true);
                      // Save an double value to 'decimal' key.
                      // await prefs.setDouble('decimal', 1.5);
                      // Save an String value to 'action' key.
                      await prefs.setString('firstName', controllerName.text);
                      await prefs.setString('phoneNumber', controllerMobile.text);


                      Navigator.pushNamed(context, '/OtpPage');
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
                    child: const Text("Get OTP",
                      style: TextStyle(
                          color: buttonColorText,
                          fontSize: buttonSizeText, fontFamily: "Raleway.Bold"),
                    ), // backgroundColor: Colors.blue
                  ),
                    ))
                ),


            Container(
              padding: EdgeInsets.only(top: 15.0, bottom: 1.0),
            ),


            Center(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("By creating your Dreamtec Yard account",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 14,
                      color: otpButtonBackground,
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("you agree to our ",
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 14,
                          color: otpButtonBackground,
                             ),
                      ),

                      GestureDetector(
                          child:
                          Container(
                            padding: const EdgeInsets.only(left: 3.0,),
                            child:
                            const Text("terms and conditions",
                              style: TextStyle(
                                fontSize: 14,fontFamily: "Raleway.Bold",
                                color: underlineTextColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),

                          onTap: () {
                          }
                      ),
                    ],
                  ),
                ],
              ),
            ),




            Container(
              padding: EdgeInsets.only(top: 80.0, bottom: 1.0),
            ),


            Center(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Have an account?",
                    softWrap: true,
                    style: TextStyle(
                      fontSize: 14,
                      color: underlineTextColor,
                        fontFamily: "Raleway.Bold"
                    ),
                  ),

                  GestureDetector(
                      child:
                      Container(
                        padding: const EdgeInsets.only(left: 3.0,),
                        child:
                        const Text("Sign In",
                          style: TextStyle(
                            fontSize: 14,
                            color: underlineTextColor,
                            decoration: TextDecoration.underline,
                              fontFamily: "Raleway.Bold"
                          ),
                        ),
                      ),

                      onTap: () => Navigator.pushNamed(context, '/SignInPage')
                  ),

                ],
              ),
            ),


          ],

            ),
          ]
        )
      )
    );
  }
}
