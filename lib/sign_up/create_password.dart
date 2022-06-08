import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/sign_up/how_it_works.dart';
import 'package:yardapp/size.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({Key? key}) : super(key: key);

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
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
    print("onInputValidated: $onInputValidated");
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
            Center(
              child: Text("Create Password",
                    style: TextStyle(
                        color: textHeaderColor,
                        fontSize: 25, fontWeight: FontWeight.bold)
              ),
            ),

            Center(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text("Enter a password of your choice. Use it to sign in if you're signed out of the app",
                  style: TextStyle(fontSize: 16, ),
                ),
              ),
            ),

        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 22.0, right: 22.0, bottom: 20.0),
          child: Column(

            children: [
              const Text('Enter your 4 digit pin:', style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
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
                      Navigator.pushNamed(context, '/HowItWorksPage');
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
                    child: const Text("Save",
                      style: TextStyle(
                          color: buttonColorText,
                          fontSize: buttonSizeText, fontFamily: "Raleway",fontWeight: FontWeight.bold),
                    ), // backgroundColor: Colors.blue
                  ),
                )),
              ),
          ],
        )
      ),
    );
  }
}
