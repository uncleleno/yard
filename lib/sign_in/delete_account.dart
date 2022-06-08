import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_login/main_login.dart';
import 'package:yardapp/sign_in/enter_password.dart';
import 'package:yardapp/sign_in/sign_in.dart';
import 'package:yardapp/size.dart';
import 'package:yardapp/texts.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue[800], size: 35.0,),
            onPressed: () =>
            Navigator
                .of(context)
                .pop,
          ),
          backgroundColor: buttonColorText,
          elevation: 0,
        ),
        body: Center(
            child: ListView(
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      top: headerPaddingTop, bottom: headerPaddingBottom),
                ),

                Container(
                  child: Center(child:
                  Image.asset('assets/images/img.png'),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 20.0, bottom: 1.0),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: const Center(
                    child: Text("Are you sure you want to delete your account?", style: TextStyle(fontSize: 25, fontFamily: "Raleway"),),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 75.0, bottom: 1.0),
                ),

                Container(
                  child: Center(
                    child:
                    SizedBox(
                      height: buttonHeight,
                      width: buttonWidth,
                      child:
                      OutlinedButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) => EnterPasswordPage()));
                      },
                        style: ButtonStyle(
                            side: MaterialStateProperty.all(
                                const BorderSide(color: buttonColorBorder,
                                    width: borderWidth)
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    borderRadiusButton),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                acceptButton)
                        ),
                        child: const Text("No",
                          style: TextStyle(
                              color: buttonColorText,
                              fontSize: buttonSizeText),
                        ),
                      ),
                    ),
                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                ),


                SizedBox(
                  height: buttonHeight,
                ),
                Center(
                  child:
                  SizedBox(
                    height: buttonHeight,
                    width: buttonWidth,
                    child:
                    OutlinedButton(onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (
                          context) => MainLoginPage()));
                    },
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(
                                  color: signUpButton, width: borderWidth)
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  borderRadiusButton),
                            ),
                          ),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red)
                      ),
                      child: const Text("Yes",
                        style: TextStyle(
                            color: buttonColorText,

                            fontSize: buttonSizeText),
                      ), // backgroundColor: Colors.blue
                    ),

                  ),
                ),

                Container(
                  padding: EdgeInsets.only(top: 1.0, bottom: 1.0),
                ),

              ],
            )
        ),
      ),
    );
  }
}
