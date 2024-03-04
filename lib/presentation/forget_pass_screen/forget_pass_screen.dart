

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pin_code_text_field/pin_code_text_field.dart';
//
// class ForgetPass extends StatefulWidget {
//   const ForgetPass({Key? key}) : super(key: key);
//
//   @override
//   State<ForgetPass> createState() => _ForgetPassState();
// }
//
// class _ForgetPassState extends State<ForgetPass> {
//   @override
//   Widget build(BuildContext context) {
//     String enteredPin = "";
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center, // Center vertically
//           crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.00),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center, // Center vertically
//                 crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start, // Center horizontally
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(left: 15),
//                         child:
//                         Container(
//                           decoration: BoxDecoration(
//                             image: DecorationImage(image: AssetImage("assets/left-arrow_11819409 2.png"),),
//                           ),
//                           height: 30,width: 22,
//                         ),
//                       ),
//                       Container(
//                         child: Image.asset(
//                           'assets/log6.png',fit: BoxFit.fitHeight,
//                           alignment: Alignment.topLeft,
//                           width: 90, // Adjust width as needed
//                           height: 90, // Adjust height as needed
//                         ),
//                       ),
//                     //  SizedBox(width: 10), // Adjust spacing as needed
//                       Padding(
//                         padding: const EdgeInsets.only(top: 9),
//                         child: Text(
//                           "kavach",
//                           style: TextStyle(fontSize: 23, color: Color(0xFF4C2559)), // Adjust style as needed
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     thickness: 5,
//                     color: Colors.grey.shade100,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
//                       children: [
//                         Text(
//                           "Verification",
//                           style: TextStyle(fontSize: 23, color: Color(0xFF4C2559)),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 10,right: 10),
//                     child: Text(
//                       'A 4 digit OTP is sent to your registered mobile number in few minutes.',
//                       style: TextStyle(fontSize: 15.0),
//                       textAlign: TextAlign.center, // Align text at the center
//                     ),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//                   PinCodeTextField(
//                     keyboardType: TextInputType.number,
//                     pinBoxBorderWidth: 1.5,
//                     pinBoxHeight: MediaQuery.of(context).size.height * 0.06,
//                     pinBoxWidth: MediaQuery.of(context).size.width * 0.12,
//                     pinBoxRadius: MediaQuery.of(context).size.width * 0.02,
//                     pinTextStyle: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.04),
//                     defaultBorderColor: Colors.purple.shade100,
//                     pinBoxOuterPadding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
//                     maxLength: 4,
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//                   Column(
//                     mainAxisAlignment: MainAxisAlignment.center, // Center vertically
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPass()));
//                         },
//                         style: ElevatedButton.styleFrom(
//                           primary: Color(0xFF4C2559),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           ),
//                           minimumSize: Size(
//                             MediaQuery.of(context).size.width * 0.50,
//                             MediaQuery.of(context).size.height * 0.06,
//                           ),
//                         ),
//                         child: Text(
//                           "Verify",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//                   Text(
//                     'Didn\'t you receive any code?',
//                     style: TextStyle(fontSize: 14.0, color: Color(0xFF4C2559)),
//                   ),
//                   SizedBox(height: MediaQuery.of(context).size.height * 0.01),
//                   Text(
//                     'RESEND OTP',
//                     style: TextStyle(fontSize: 14.0, color: Color(0xFF4C2559),decoration: TextDecoration.underline,decorationColor: Color(0xFF4C2559)),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:kavach_project/presentation/Newpassword_screen/Newpassword_screen.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
  @override
  Widget build(BuildContext context) {
    String enteredPin = "";
    final pinController=TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
          children: [
            Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.00),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start, // Center horizontally
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Icon(Icons.arrow_back_ios_new_sharp,size: 25,color: Color(0xFF4C2559),),
                      ),
                      // Padding(
                      //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.02),
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         image: AssetImage("assets/left-arrow_11819409 2.png"),
                      //       ),
                      //     ),
                      //     height: MediaQuery.of(context).size.height * 0.04,
                      //     width: MediaQuery.of(context).size.width * 0.06,
                      //   ),
                      // ),
                      Container(
                        child: Image.asset(
                          'assets/log6.png',
                          fit: BoxFit.fitHeight,
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 150),
                        child: Text(
                          "kavach",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050, color: Color(0xFF4C2559)),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: MediaQuery.of(context).size.width * 0.012,
                    color: Colors.grey.shade100,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                      children: [
                        Text(
                          "Get Your Code",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.065, color: Color(0xFF4C2559)),
                        ),
                      ],
                    ),
                  ),
                //  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.03, right: MediaQuery.of(context).size.width * 0.03),
                    child: Text(
                      'Plese enter the 3 didgits code which send you to your email address'  ,
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.040),
                      textAlign: TextAlign.center, // Align text at the center
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  OtpTextField(
                    numberOfFields: 4, // Number of OTP fields
                    borderColor: Colors.grey,
                    cursorColor: Colors.black,
                    fillColor: Colors.black,// Border color of OTP fields
                    keyboardType: TextInputType.number,
                    focusedBorderColor: Color(0xFF4C2559), // Border color of focused OTP field
                    textStyle: TextStyle(fontSize: 16), // Text style of OTP text
                    //width: MediaQuery.of(context).size.width, // Width of OTP field
                    fieldWidth: 40, // Width of each OTP field
                    obscureText: false, // Hide OTP text
                    onCodeChanged: (String value) {
                      // Handle OTP value changes
                      print(value);
                    },
                    // onSubmit: (String value) {
                    //   // Handle OTP submission
                    // },
                  ),


                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NewPassword()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4C2559),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(17),
                          ),
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.50,
                            MediaQuery.of(context).size.height * 0.06,
                          ),
                        ),
                        child: Text(
                          "Verify",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.width * 0.035,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Text(
                    'Didn\'t you receive any code?',
                    style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, color: Color(0xFF4C2559)),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPass()));
                    },
                    child: Text(
                      'RESEND OTP',
                      style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.035, color: Color(0xFF4C2559),decoration: TextDecoration.underline,decorationColor: Color(0xFF4C2559)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// import 'package:flutter/material.dart';
// import 'package:pin_code_text_field/pin_code_text_field.dart';
//
// class PinCodePage extends StatefulWidget {
//   @override
//   _PinCodePageState createState() => _PinCodePageState();
// }
//
// class _PinCodePageState extends State<PinCodePage> {
//   String enteredPin = "";
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pin Code Input'),
//       ),
//       body: Center(
//         child:
//         PinCodeTextField(
//           maxLength: 4, // Length of the PIN code
//           keyboardType: TextInputType.number,
//           hideCharacter: true, // Mask PIN code with bullets
//           highlight: true, // Highlight current pin
//           highlightColor: Colors.blue,
//           defaultBorderColor: Colors.grey,
//           hasTextBorderColor: Colors.green,
//           pinBoxDecoration:
//           ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
//           pinTextStyle: TextStyle(fontSize: 20.0),
//           onTextChanged: (text) {
//             setState(() {
//               enteredPin = text;
//             });
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Validate PIN code or perform an action
//           if (enteredPin.length == 4) {
//             print("Entered PIN: $enteredPin");
//             // You can perform your action here
//           } else {
//             print("Please enter a valid PIN");
//           }
//         },
//         child: Icon(Icons.check),
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: PinCodePage(),
//   ));
// }
