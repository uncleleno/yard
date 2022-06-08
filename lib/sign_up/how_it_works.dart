import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/sign_up/select_yard.dart';
import 'package:yardapp/size.dart';

class HowItWorksPage extends StatefulWidget {
  const HowItWorksPage({Key? key}) : super(key: key);

  @override
  State<HowItWorksPage> createState() => _HowItWorksPageState();
}

class _HowItWorksPageState extends State<HowItWorksPage> {

  @override
  void initState() {
    super.initState();
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
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text("How it Works",
                  style: TextStyle(
                    color: textHeaderColor,
                    fontSize: 25, fontWeight: FontWeight.bold, fontFamily: "Raleway.Bold"),
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                    Padding(
                      padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 8.0, bottom: 40),
                      child: Row(

                        children: [
                          Container(
                            alignment: Alignment.center,
                          width: 40,
                          height: 40,
                            decoration: const BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.circle,
                            ),
                            child: Text("1", textAlign: TextAlign.center, style: TextStyle(color: buttonColorText, fontSize: 30, fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                          ),
                          Flexible(
                            child: const Text( "Select your yard", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                            ),
                          ),


                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 8.0, bottom: 40),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.teal,
                                  shape: BoxShape.circle,
                                ),
                                child: Text("2", textAlign: TextAlign.center, style: TextStyle(color: buttonColorText, fontSize: 30, fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                              ),

                              Flexible(
                                child: const Text( "Use this app to add or release your vehicle from yard ", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                                ),
                              ),

                            ],
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 8.0, bottom: 40),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.teal,
                              shape: BoxShape.circle,
                            ),
                            child: Text("3", textAlign: TextAlign.center, style: TextStyle(color: buttonColorText, fontSize: 25, fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                          ),
                          Flexible(
                            child: const Text(
                               "To release a vehicle from your yard the release must first be authorized on the yard portal", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                            ),
                          ),



                        ],
                      ),
                    ),

                Padding(
                  padding: const EdgeInsets.only(left:8.0, right: 8.0, top: 8.0, bottom: 80),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,

                        decoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: Text("4", textAlign: TextAlign.center, style: TextStyle(color: buttonColorText, fontSize: 25, fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                      ),
                      Flexible(
                        child: const Text("Make sure the vehicle you add or release is uploaded to the yard portal", style: TextStyle(color: Colors.black, fontSize: 20, fontFamily: "Raleway", fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),


            Center(
              child:
              SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child:
                OutlinedButton
                  (onPressed: () {
                  Navigator.pushNamed(context, '/SelectYardPage');
                },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                        BorderSide(color: buttonColorBorder, width: borderWidth)
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadiusButton),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all<Color>(acceptButton)
                  ),
                  child: const Text("I've got it",
                    style: TextStyle(
                        color: buttonColorText,
                        //backgroundColor: Colors.blue,
                        fontSize: buttonSizeText),
                  ), // backgroundColor: Colors.blue
                ),

              ),
            ),

          ],
        )
      ),
    );
  }
}
