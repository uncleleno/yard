import 'package:flutter/material.dart';
import 'package:yardapp/color.dart';
import 'package:yardapp/main_app/main_app.dart';
import 'package:yardapp/size.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectYardPage extends StatefulWidget {
  const SelectYardPage({Key? key}) : super(key: key);

  @override
  State<SelectYardPage> createState() => _SelectYardPageState();
}

class _SelectYardPageState extends State<SelectYardPage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String firstName = "";
  // Initial Selected Value

  String dropdownvalue = 'Dreamtec Yard';

  // List of items in our dropdown menu
  var items = [
  'Dreamtec Yard',
  'The Other Yard',
  'The Other Other Yard',

  ];
  @override
  void initState() {
    super.initState();
    getFirstName();
  }



  void getFirstName() async {
    final SharedPreferences prefs = await _prefs;

    setState(() {
      firstName = prefs.getString('firstName') ?? '';
    });

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
                padding: const EdgeInsets.only(top: headerPaddingTop, bottom: headerPaddingBottom),
              ),

              Container(
                child: Center( child:
                Image.asset('assets/images/img.png'),
                ),
              ),
              Center(
                child: Container(
                  padding: const EdgeInsets.only(top: 20.0, left: 42.0, right: 42.0, bottom: 20.0),
                  child: Text("Hi, $firstName "
                    ,style: TextStyle( fontSize: 25),
                  ),
                ),
              ),
              Center(
                child: Container( padding: EdgeInsets.only(bottom: 300),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Select Your Yard:", style: TextStyle( fontFamily: "Raleway")),
                  DropdownButton(

                    // Initial Value
                    value: dropdownvalue,

                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),

                    // Array list of items
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                  ]),
                ),
              ),

            Center(
              child:
              SizedBox(
                height: buttonHeight,
                width: buttonWidth,
                child: OutlinedButton(

                  onPressed: () {
                    Navigator.pushNamed(context, '/MainAppPage');
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
                  child: const Text("Save",
                    style: TextStyle(
                        color: buttonColorText,
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
