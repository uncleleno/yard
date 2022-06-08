import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/size.dart';

class ClientSelectYardPage extends StatefulWidget {
  const ClientSelectYardPage({Key? key}) : super(key: key);

  @override
  State<ClientSelectYardPage> createState() => _ClientSelectYardPageState();
}

class _ClientSelectYardPageState extends State<ClientSelectYardPage> {
  bool onInputValidated = true;
  
  void selectVehicle() {
    // print("-----");
    // print("controllerPassword.text: ${controllerPassword.text.isNotEmpty}");

    if (dropdownyard != "Select Item" ) {
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
  String dropdownyard = 'Select Item';

  // List of items in our dropdown menu
  List<String> vehicletype = [
    'Select Item',
    'Vehicle',
    'Boat',
    'Truck',

  ];
  
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
      Center(
        child: Container(
          padding: EdgeInsets.only(bottom: 300),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
                  child: const Text("Select the vehicle unit type that you are releasing from your yard", textAlign: TextAlign.center,
                      style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold,)),
                ),
                Container(
                  height: 50,
                  width: 500.0,
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    // Initial Value
                    value: dropdownyard,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down, ),

                    // Array list of items
                    items: vehicletype.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownyard = newValue!;
                        if (dropdownyard != "Select Item" ) {
                          setState(() {
                            onInputValidated = false;
                          });
                        } else {
                          setState(() {
                            onInputValidated = true;
                          });
                        }});
                    },
                  ),

                ),
                SizedBox(
                    height: buttonHeight,
                    width: buttonWidth,
                    child:
                    AbsorbPointer(
                      absorbing: onInputValidated,
                      child:
                      OutlinedButton(
                        onPressed: () {

                          Navigator.pushNamed(context, '/ClientQRCodePage');
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
                              fontSize: buttonSizeText, fontFamily: "Raleway",fontWeight: FontWeight.bold),
                        ), // backgroundColor: Colors.blue
                      ),
                    )),
              ]),

        ),
  ),
    );
  }
}
