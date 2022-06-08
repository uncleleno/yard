import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/size.dart';

class SPDetailsPage extends StatefulWidget {
  const SPDetailsPage({Key? key}) : super(key: key);

  @override
  State<SPDetailsPage> createState() => _SPDetailsPage();
}

class _SPDetailsPage extends State<SPDetailsPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  final TextEditingController controllerSPName = TextEditingController();
  final TextEditingController controllerSPSurname = TextEditingController();
  final TextEditingController controllerSPMobile = TextEditingController();
  String initialCountry = 'ZA';
  PhoneNumber number = PhoneNumber(isoCode: 'ZA');
  bool isSwitched = false;
  bool onInputValidated = true;

  void nameAndNumber () {

    if (controllerSPName.text.isNotEmpty == true && controllerSPMobile.text.isNotEmpty == true) {
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90.0),
          child: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back, color: buttonColorText, size: 35.0,
                ),
                onPressed: () => Navigator.of(context).pop,
              ),
              backgroundColor: secondaryOverlayColor,
              elevation: 5, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
              title:
              const ListTile(
                title:
                Text("Check into yard \n ", style: TextStyle(color:buttonColorText)),
                subtitle: Text("Service Provider's Contact Details", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold),
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

                Container(
                  padding: const EdgeInsets.only(top: headerPaddingTop, bottom: headerPaddingBottom),
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(top: 20.0, left: 42.0, right: 42.0, bottom: 20.0),
                    child: const Text("Enter the contact details of the service provider that delivered the vehicle to you.",
                      style: TextStyle(fontSize: 15,
                        fontFamily: "Raleway-Bold",
                      ),
                    ),
                  ),
                ),
                 Container(
                    child: Column(
                        children: const [
                          Text("Service provider's contact details:",
                              style: TextStyle( fontFamily: "Raleway.Bold",
                                  )
                              ),
                             ]
                            ),
                          ),
               Container(
                  child:const Padding(
                    padding:  EdgeInsets.only(left: 20),
                    child:  Text('Name:',
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
                    controller: controllerSPName,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),
                 Container(
                    child:const Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text('Surname:',
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
                    controller: controllerSPSurname,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                ),

                Column(
                  children: [
                    Text("Mobile Number:",
                      style: TextStyle(
                        fontSize: 14,
                         fontFamily: "Raleway.Bold"
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
                        textFieldController: controllerSPMobile,
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
                          // print('On Saved: $number');
                        },
                      ),
                    ),
                  ]
                ),

            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: buttonHeight,
                        width: buttonWidthTwo,
                        child: OutlinedButton(
                          child: Text('Skip',
                            style: TextStyle(fontSize: 15, color: Colors.red, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                          ),
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  BorderSide(color: signUpButton, width: borderWidth)
                              ),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(borderRadiusButton),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(buttonColorText)
                          ),
                          onPressed: () {
                            {
                              Navigator.pushNamed(context, '/SPScanPage');
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 100),
                      SizedBox(
                        height: buttonHeight,
                        width: buttonWidthTwo,
                        child:
                        OutlinedButton(onPressed: () {
                          Navigator.pushNamed(context, '/SPScanPage');
                        },
                          style: ButtonStyle(

                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(borderRadiusButton),
                                ),
                              ),
                              backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                          ),
                          child: const Text("Continue",
                            style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),

                          ),
                        ), // backgroundColor: Colors.blue
                      ),


                    ],

                  ),
            ),
              ],
            )
        )
    );
  }
}