import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/main_app.dart';
import 'package:yardapp/sign_in/enter_password.dart';
import 'package:yardapp/sign_up/sign_up.dart';
import 'package:yardapp/size.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
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
  void otpSwitch () {
    // print("-----------");
    // print("controllerName.text: ${controllerName.text.isNotEmpty}");
    // print("controllerMobile.text: ${controllerMobile.text.isNotEmpty}");

    if ( controllerMobile.text.isNotEmpty == true) {
      setState(() {
        onInputValidated = false;
      });
    } else {
      setState(() {
        onInputValidated = true;
      });
    }
    // print("onInputValidated: $onInputValidated");
    // print("++++++++++++");
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
            Container(
              padding: const EdgeInsets.only(top: 55.0, bottom: 1.0),
            ),

            Center(
              child: const Text("Welcome back",
                style: TextStyle(
                    color: textHeaderColor,
                    fontSize: 25, fontFamily: "Raleway.Bold", fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: const Text("Sign in by entering your cellphone number.",
                  style: TextStyle(
                      color: textHeaderColor,
                      fontSize: 15, fontFamily: "Raleway", fontWeight: FontWeight.bold),
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
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
                      otpSwitch();
                    } else {
                      setState(() {
                        onInputValidated = true;
                      });
                    }
                  },
                  onSaved: (PhoneNumber number) {
                    // print('On Saved: $number');
                  },
                ),
              ),
            ),



            Center(
                child:
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: SizedBox(
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
                            await prefs.setString('phoneNumber', controllerMobile.text);


                            Navigator.push(context, MaterialPageRoute(builder: (context) => EnterPasswordPage()));
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
                          child: const Text("Next",
                            style: TextStyle(
                                color: buttonColorText,
                                fontSize: buttonSizeText, fontFamily: "Raleway.Bold"),
                          ), // backgroundColor: Colors.blue
                        ),
                      )),
                )
            ),
            Center(
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Text("Don't have an account?",
                      softWrap: true,
                      style: TextStyle(
                          fontSize: 14,
                          color: underlineTextColor,
                          fontFamily: "Raleway.Bold"
                      ),
                    ),
                  ),

                  GestureDetector(
                      child:
                      Container(
                        padding: const EdgeInsets.only(left: 3.0, top: 80),
                        child:
                        const Text("Create Account",
                          style: TextStyle(
                              fontSize: 14,
                              color: underlineTextColor,
                              decoration: TextDecoration.underline,
                              fontFamily: "Raleway.Bold"
                          ),
                        ),
                      ),

                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()))
                  ),

                ],
              ),
            ),

          ],
        )
    ]),
    )
    );
  }
}
