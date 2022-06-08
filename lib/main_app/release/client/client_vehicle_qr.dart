import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/size.dart';

class ClientQRCodePage extends StatefulWidget {
  const ClientQRCodePage({Key? key}) : super(key: key);

  @override
  State<ClientQRCodePage> createState() => _ClientQRCodePageState();
}

class _ClientQRCodePageState extends State<ClientQRCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(90.0),
        child: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back, color: buttonColorText, size: 35.0,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: secondaryOverlayColor,
            elevation: 5, shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
            title:
            const ListTile(
              title:
              Text("Check client release", style: TextStyle(color:buttonColorText)),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("Vehicle, Truck or Boat", style: TextStyle(color:buttonColorText, fontFamily: "Raleway", fontWeight: FontWeight.bold ),
                ),
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
        Container(
          padding: EdgeInsets.only(bottom: 00),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 35, right: 35, bottom: 00),
                  child: const Text("Scan the QR Code attached to the vehicles' windscreen.",
                      style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
                ),
                Center(
                  child: Container(
                    child: SizedBox( height: 400, width: 400,
                        child: Image.asset('assets/images/barcode.PNG')
                    ),
                  ),
                ),
                Center(
                    child:
                    SizedBox(
                      height: buttonHeight,
                      width: buttonWidth,
                      child:
                      OutlinedButton(
                        child: Text('Scan Auction Nation QR Code',
                          style: TextStyle(fontSize: 20, color: backgroundColor, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(borderRadius),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed('/ClientVehicleQRScanPage');
                          // }
                        },
                      ),
                    )
                )]
          ),
        )
    );
  }
}
