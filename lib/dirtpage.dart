// Container(
// width: 650,
// height: 488,
// margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
// padding: const EdgeInsets.only(top: 0, left: 0, right: 0, bottom: 0),
// decoration: BoxDecoration(
// color: buttonColorText,
// border: Border.all(
// color: Colors.black,
// width: 0.5,
// ), borderRadius: BorderRadius.circular(15.0)
// ),
//
// // child: Center(
// child: ListView(
// children: [Container( padding: rowBetweenLoginPadding,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: const [
// Text("Does the below license disk details match the actual vehicle?",
// style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)
// ),
// ],
// ),
// ),
// Container( padding: rowBetweenLoginPadding,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text("Make/model:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
// Container(
// child: TextFormField(
// // controller: textarea,
// decoration: InputDecoration(
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
// ),
// ),
// ),
// ),
//
// ],
// ),
// ),
// Container( padding: rowBetweenLoginPadding,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text("Colour:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
// Container(
// child: TextFormField(
// // controller: textarea,
// decoration: InputDecoration(
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
// ),
// ),
// ),
// ),
//
// ],
// ),
// ),
// Container( padding: rowBetweenLoginPadding,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text("Vin:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
// Container(
// child: TextFormField(
// // controller: textarea,
// decoration: InputDecoration(
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
// ),
// ),
// ),
// ),
//
// ],
// ),
// ),
// Container( padding: rowBetweenLoginPadding,
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const Text("License Plate Number:", style: TextStyle( fontFamily: "Raleway", fontWeight: FontWeight.bold)),
// Container(
// child: TextFormField(
// // controller: textarea,
// decoration: InputDecoration(
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
// ),
// ),
// ),
// ),
//
// ],
// ),
// ),
// ],
// )
// ),
//
// Padding(
// padding: const EdgeInsets.only(top: 510),
// child: Row(
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.end,
// children: <Widget>[
// SizedBox(
// height: buttonHeight,
// width: buttonWidthTwo,
// child: OutlinedButton(
// child: Text("No it's wrong",
// style: TextStyle(fontSize: 15, color: Colors.red, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
// ),
// style: ButtonStyle(
// side: MaterialStateProperty.all(
// BorderSide(color: signUpButton, width: borderWidth)
// ),
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(borderRadiusButton),
// ),
// ),
// backgroundColor: MaterialStateProperty.all<Color>(buttonColorText)
// ),
// onPressed: () {
// {
// Navigator.pushNamed(context, '/WrongLicenseDiskPage');
// }
// },
// ),
// // ),
// SizedBox(width: 100),
// SizedBox(
// height: buttonHeight,
// width: buttonWidthTwo,
// child:
// OutlinedButton(onPressed: () {
// Navigator.pushNamed(context, '/VehicleDeliveredPage');
// },
// style: ButtonStyle(
//
// shape: MaterialStateProperty.all(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(borderRadiusButton),
// ),
// ),
// backgroundColor: MaterialStateProperty.all<Color>(secondaryOneColor)
// ),
// child: const Text("Yes, it's correct",
// style: TextStyle(fontSize: 15, color: buttonColorText, fontFamily: 'Raleway', fontWeight: FontWeight.bold),
//
// ),
// ), // backgroundColor: Colors.blue
// ),
//
//
// ],
// ),
// ),
