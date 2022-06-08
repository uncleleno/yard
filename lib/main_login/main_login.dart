import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/sign_in/sign_in.dart';
import 'package:yardapp/sign_up/sign_up.dart';
import 'package:yardapp/size.dart';
import 'package:yardapp/texts.dart';

class MainLoginPage extends StatefulWidget {
  const MainLoginPage({Key? key}) : super(key: key);

  @override
  State<MainLoginPage> createState() => _MainLoginPageState();
}

class _MainLoginPageState extends State<MainLoginPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context)  {
    return SizedBox(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.blue[800], size: 35.0,),
              onPressed: () => Navigator.of(context),
          ),
          backgroundColor: buttonColorText,
          elevation: 0,
        ),
        body: Center(
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.only(top: headerPaddingTop, bottom: headerPaddingBottom),
              ),

              Container(
              child: Center( child:
                Image.asset('assets/images/img.png'),
              ),
            ),
              Container(
                padding: EdgeInsets.only(top: 20.0, bottom: 1.0),
              ),
              const Center(
                child: subHeading,
              ),

              Container(
                padding: EdgeInsets.only(top: 95.0, bottom: 1.0),
              ),

              Container(
                child: Center(
                  child:
                  SizedBox(
                    height: buttonHeight,
                    width: buttonWidth,
                    child:
                    OutlinedButton(onPressed: () {
                      Navigator.pushNamed(context, '/SignInPage');
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
                        backgroundColor: MaterialStateProperty.all<Color>(acceptButton)
                      ),
                      child: const Text("Sign In",
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

              Center(
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(color: subtitle, fontSize: 12,),
                    children: <TextSpan>[
                      TextSpan(text: "Sign in if you have have an account", style: TextStyle(fontWeight: FontWeight.w500, )),
                    ],
                  ),
                ),
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
                    Navigator.pushNamed(context, '/SignUpPage');
                  },
                    style: ButtonStyle(
                      side: MaterialStateProperty.all(
                          BorderSide(color: signUpButton, width: borderWidth)
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(borderRadiusButton),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(signUpButton)
                    ),
                    child: const Text("Sign Up",
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

              Center(
                child: RichText(
                  text: const TextSpan(
                      style: TextStyle(color: subtitle, fontSize: 12,),
                      children: <TextSpan>[
                        TextSpan(text: "Sign up if you don't have an account", style: TextStyle(fontWeight: FontWeight.w500, )),
                      ],
                  ),
                ),
              ),



            ],
          )
        ),
      ),
    );
  }
}
