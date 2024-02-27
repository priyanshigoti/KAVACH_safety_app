//
//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:kavach_pro/localization/app_localization.dart';
// import 'package:kavach_pro/presentation/sign_up_login_screen/sign_up_login_screen.dart';
//
// import '../core/utils/image_constant.dart';
// import '../theme/custom_button_style.dart';
// import '../theme/custom_text_style.dart';
// import '../theme/theme_helper.dart';
// import '../widgets/custom_image_view.dart';
// import '../widgets/custom_outlined_button.dart';
//
// class Register extends StatefulWidget {
//   const Register({Key? key}) : super(key: key);
//
//   @override
//   State<Register> createState() => _RegisterState();
// }
//
// class _RegisterState extends State<Register> {
//   @override
//   Widget build(BuildContext context) {
//     String? selectedGender;
//
//
//     TextEditingController emailcontroller = TextEditingController();
//     TextEditingController phonecontroller = TextEditingController();
//     TextEditingController passcontroller = TextEditingController();
//     TextEditingController cpasscontroller = TextEditingController();
//     TextEditingController fnamecontroller = TextEditingController();
//
//     FirebaseAuth _auth=FirebaseAuth.instance;
//
//
//     bool pass = true;
//
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.00),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.04,top: MediaQuery.of(context).size.width * 0.04),
//                         child: InkWell(
//                           onTap: (){
//                             Navigator.pop(context);
//                           },
//                             child: Icon(Icons.arrow_back_ios_new_sharp, size: MediaQuery.of(context).size.width * 0.06, color: Color(0xFF4C2559))),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: MediaQuery.of(context).size.width * 0.04),
//                         child: Container(
//                           child: Image.asset(
//                             'assets/log6.png',
//                             fit: BoxFit.fitHeight,
//                             alignment: Alignment.center,
//                             width: MediaQuery.of(context).size.width * 0.15,
//                             height: MediaQuery.of(context).size.width * 0.20,
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.30,top: MediaQuery.of(context).size.width * 0.04),
//                         child: Text(
//                           "kavach",
//                           style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.050, color: Color(0xFF4C2559)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Divider(
//                     thickness: MediaQuery.of(context).size.width * 0.012,
//                     color: Colors.grey.shade100,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.015, left: MediaQuery.of(context).size.width * 0.06),
//                           child: Text(
//                             "Create Your Account",
//                             style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.055, color: Color(0xFF4C2559)),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.018, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child: TextFormField(
//                       style: TextStyle(height: 1.2),
//                       controller: fnamecontroller,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                         hintText: "Username",
//                         hintStyle: TextStyle(fontSize: 14),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                           prefixIcon: Icon(Icons.person)
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child: TextFormField(
//                       style: TextStyle(height: 1.2),
//                       controller: emailcontroller,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                         hintText: "Email",
//                         hintStyle: TextStyle(fontSize: 14),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                           prefixIcon: Icon(Icons.email)
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child: TextFormField(
//                       style: TextStyle(height: 1.2),
//                       controller: phonecontroller,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                         hintText: "Phone No",
//                         hintStyle: TextStyle(fontSize: 14),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                         prefixIcon: Icon(Icons.phone_android)
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child: TextFormField(
//                       style: TextStyle(height: 1.2),
//                       controller: passcontroller,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                         hintText: "Password",
//                         hintStyle: TextStyle(fontSize: 14),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                           prefixIcon: Icon(Icons.password)
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child: TextFormField(
//                       style: TextStyle(height: 1.2),
//                       controller: cpasscontroller,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                         hintText: "Confirm Password",
//                         hintStyle: TextStyle(fontSize:14),
//                         fillColor: Colors.grey.shade200,
//                         filled: true,
//                           prefixIcon: Icon(Icons.password)
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//
//                   // Add other form fields with similar modifications
//                   // Padding(
//                   //   padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                   //   child: Padding(
//                   //     padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.045),
//                   //     child:
//                   //     Row(
//                   //       children: [
//                   //         Text(
//                   //           'Gender:',
//                   //           style: TextStyle(),
//                   //         ),
//                   //         SizedBox(width: 10),
//                   //         // Row(
//                   //         //   children: [
//                   //         //     Radio<String>(
//                   //         //       value: 'Male',
//                   //         //       groupValue: selectedGender,
//                   //         //       onChanged: (value) {
//                   //         //         setState(() {
//                   //         //           selectedGender = value;
//                   //         //         });
//                   //         //       },
//                   //         //     ),
//                   //         //     Text('Male'),
//                   //         //     Radio<String>(
//                   //         //       value: 'Female',
//                   //         //       groupValue: selectedGender,
//                   //         //       onChanged: (value) {
//                   //         //         setState(() {
//                   //         //           selectedGender = value;
//                   //         //         });
//                   //         //       },
//                   //         //     ),
//                   //         //     Text('Female'),
//                   //         //   ],
//                   //         // ),
//                   //       ],
//                   //     )
//                   //
//                   //   ),
//                   // ),
//
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.030, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child:
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFF4C2559),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                         ),
//                         minimumSize: Size(
//                           MediaQuery.of(context).size.width * 0.90,
//                           MediaQuery.of(context).size.height * 0.06,
//                         ),
//                       ),
//                       child: Text(
//                         "SIGN UP",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 13,
//                         ),
//                       ),
//                     ),
//
//                   ),
//
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.021, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   top: MediaQuery.of(context).size.height * 0.004,
//                                   bottom: MediaQuery.of(context).size.height * 0.01,
//                                 ),
//                                 child: Divider(
//                                   color: appTheme.black900,
//                                 ),
//                               ),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.02),
//                               child: Text(
//                                 "lbl_or".tr,
//                                 style: CustomTextStyles.bodyMedium15,
//                               ),
//                             ),
//                             Expanded(
//                               child: Padding(
//                                 padding: EdgeInsets.only(
//                                   top: MediaQuery.of(context).size.height * 0.004,
//                                   bottom: MediaQuery.of(context).size.height * 0.01,
//                                 ),
//                                 child: Divider(
//                                   color: appTheme.black900,
//                                   // indent: MediaQuery.of(context).size.width * 0.02,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(left: 18,top: 11,right: 18),
//                     child: CustomOutlinedButton(
//                       text: "msg_continue_with_google".tr,
//                       margin: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.004,
//                         right: MediaQuery.of(context).size.width * 0.002,
//                         top: MediaQuery.of(context).size.height * 0.002,
//                         bottom: MediaQuery.of(context).size.height * 0.002,
//                       ),
//                       leftIcon: Container(
//                         margin: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03),
//                         child: CustomImageView(
//                           imagePath: ImageConstant
//                               .imgVecteezygooglelogoontransparentbackgroundpopularsearchengine292849641,
//                           height: MediaQuery.of(context).size.height * 0.02,
//                           width: MediaQuery.of(context).size.height * 0.02,
//                         ),
//                       ),
//                       buttonStyle: CustomButtonStyles.outlineErrorContainer,
//                       buttonTextStyle: CustomTextStyles.bodySmallBlack90012,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.080, left: MediaQuery.of(context).size.width * 0.06, right: MediaQuery.of(context).size.width * 0.06),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Already have an account?"),
//                         SizedBox( width: MediaQuery.of(context).size.height * 0.01,),
//                         InkWell(
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUpLoginScreen()));
//                           },
//                             child: Text("LOGIN",style: TextStyle(color: Color(0xFF4C2559),fontWeight: FontWeight.bold),)),
//                       ],
//                     ),
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
//
//