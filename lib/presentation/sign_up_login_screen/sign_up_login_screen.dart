// import 'package:kavach/presentation/drawer_screen/drawer_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:kavach/core/app_export.dart';
// import 'package:kavach/widgets/app_bar/appbar_subtitle_two.dart';
// import 'package:kavach/widgets/app_bar/custom_app_bar.dart';
// import 'package:kavach/widgets/custom_outlined_button.dart';
// import 'provider/sign_up_login_provider.dart';
//
// class SignUpLoginScreen extends StatefulWidget {
//   const SignUpLoginScreen({Key? key})
//       : super(
//           key: key,
//         );
//   @override
//   SignUpLoginScreenState createState() => SignUpLoginScreenState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => SignUpLoginProvider(),
//       child: SignUpLoginScreen(),
//     );
//   }
// }
//
// class SignUpLoginScreenState extends State<SignUpLoginScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//   //  final numcontroller=TextEditingController();
//
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SizedBox(
//         width: double.infinity,
//         height: double.infinity,
//         child: Column(
//           children: [
//             _buildAppBar(context),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 20.h),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         "lbl_sign_up_login".tr,
//                         style: theme.textTheme.titleLarge,
//                       ),
//                       SizedBox(height: 23.v),
//                       Text(
//                         "msg_enter_your_mobile".tr,
//                         style: theme.textTheme.bodyMedium,
//                       ),
//                       SizedBox(height: 15.v),
//                       Padding(
//                         padding: EdgeInsets.only(right: 5.h),
//                         child: Selector<SignUpLoginProvider,
//                             TextEditingController?>(
//                           selector: (
//                             context,
//                             provider,
//                           ) =>
//                               provider.mobileNumberController,
//                           builder: (context, mobileNumberController, child) {
//                             return TextFormField(
//                               style: TextStyle(height: 1.2),
//                               controller: mobileNumberController,
//                               decoration: InputDecoration(
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                 ),
//                                 contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
//
//                                 // hintText: "Plese Enter email",
//
//                               ),
//                               keyboardType: TextInputType.emailAddress,
//                             );
//                             //   CustomTextFormField(
//                             //   controller: mobileNumberController,
//                             //   textInputAction: TextInputAction.done,
//                             // );
//                           },
//                         ),
//                       ),
//                       SizedBox(height: 35.v),
//                       CustomOutlinedButton(
//                         onPressed: (){
//                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Drawerscreen()));
//                         },
//                         width: 218.h,
//                         text: "lbl_continue".tr,
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                           color: Colors.purple.shade100,
//                           borderRadius: BorderRadius.circular(20.0)
//                         ),
//                       ),
//                       SizedBox(height: 22.v),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 35.h),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 6.v,
//                                   bottom: 10.v,
//                                 ),
//                                 child: SizedBox(
//                                   width: 113.h,
//                                   child: Divider(
//                                     color: appTheme.black900,
//                                   ),
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(left: 4.h),
//                                 child: Text(
//                                   "lbl_or".tr,
//                                   style:CustomTextStyles.bodyMedium15,
//                                 ),
//                               ),
//                               Padding(
//                                 padding: EdgeInsets.only(
//                                   top: 6.v,
//                                   bottom: 10.v,
//                                 ),
//                                 child: SizedBox(
//                                   width: 117.h,
//                                   child: Divider(
//                                     color: appTheme.black900,
//                                     indent: 4.h,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 12.v),
//                       CustomOutlinedButton(
//                         text: "msg_continue_with_google".tr,
//                         margin: EdgeInsets.only(
//                           left: 4.h,
//                           right: 2.h,
//                           top: 2.h,
//                           bottom: 2.h,
//                         ),
//                         leftIcon: Container(
//                           margin: EdgeInsets.only(right: 30.h),
//                           child: CustomImageView(
//                             imagePath: ImageConstant
//                                 .imgVecteezygooglelogoontransparentbackgroundpopularsearchengine292849641,
//                             height: 20.adaptSize,
//                             width: 20.adaptSize,
//                           ),
//                         ),
//                         buttonStyle: CustomButtonStyles.outlineErrorContainer,
//                         buttonTextStyle: CustomTextStyles.bodySmallBlack90012,
//                       ),
//                     SizedBox(height: 350,),
//                     //  Spacer(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Center(
//                             child: Text("By continuing, you agree that you have read and accepted our",
//                               style: TextStyle(
//                               fontSize: 10.5,
//                                   color: Colors.grey,
//                             ),),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Center(
//                             child: Text("T&Cs",
//                               style: TextStyle(
//                                   fontSize: 12,
//                                 color: Color(0xFF4C2659),
//                               ),),
//                           ),
//                           SizedBox(width: 5,),
//                           Center(
//                             child: Text("and",
//                               style: TextStyle(
//                                 fontSize: 10,
//                                 color: Colors.grey,
//                               ),),
//                           ),
//                           SizedBox(width: 5,),
//                           Center(
//                             child: Text("Privacy Policy",
//                               style: TextStyle(
//                                 fontSize: 12,
//                                 color: Color(0xFF4C2659),
//                               ),),
//                           ),
//                         ],
//                       ),
//                       // Align(
//                       //   alignment: Alignment.center,
//                       //   child: Container(
//                       //     width: 258.h,
//                       //     margin: EdgeInsets.symmetric(horizontal: 30.h),
//                       //     child: Text(
//                       //       "msg_by_continuing_you".tr,
//                       //       maxLines: 2,
//                       //       overflow: TextOverflow.ellipsis,
//                       //       textAlign: TextAlign.center,
//                       //       style: CustomTextStyles.bodySmallGray500039,
//                       //     ),
//                       //   ),
//                       // ),
//                       // Padding(
//                       //   padding: EdgeInsets.only(left: 120.h),
//                       //   child: Text(
//                       //     "lbl_t_cs".tr,
//                       //     style: CustomTextStyles.bodySmallGray700,
//                       //   ),
//                       // ),
//                       // SizedBox(height: 35.v),
//                       // Align(
//                       //   alignment: Alignment.centerRight,
//                       //   child: Padding(
//                       //     padding: EdgeInsets.only(right: 87.h),
//                       //     child: Text(
//                       //       "lbl_privacy_policy".tr,
//                       //       style: CustomTextStyles.bodySmallGray700,
//                       //     ),
//                       //   ),
//                       // ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildStackWithAppBar(BuildContext context) {
//     return Align(
//       alignment: Alignment.topCenter,
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: 64.v,
//             width: double.maxFinite,
//             child: Stack(
//               alignment: Alignment.centerRight,
//               children: [
//                 CustomAppBar(
//                   title: AppbarSubtitleTwo(
//                     text: "lbl_kavach".tr,
//                     margin: EdgeInsets.only(left: 76.h),
//                   ),
//                   styleType: Style.bgFill,
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: Container(
//                     height: 64.v,
//                     width: 297.h,
//                     decoration: BoxDecoration(
//                       color:
//                           theme.colorScheme.onPrimaryContainer.withOpacity(1),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 5.v),
//           Divider(),
//         ],
//       ),
//     );
//   }
//
//   /// Section Widget
//   Widget _buildAppBar(BuildContext context) {
//     return SizedBox(
//       height: 90.v,
//       width: double.maxFinite,
//       child: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           Container(
//             height: 20,width: 20,
//             color: Colors.black,
//           ),
//           // CustomImageView(
//           //   imagePath: ImageConstant.imgLog62,
//           //   height: 90.v,
//           //   width: 103.h,
//           //   radius: BorderRadius.circular(
//           //     58.h,
//           //   ),
//           //   alignment: Alignment.centerLeft,
//           // ),
//           Positioned(
//             left: 0,
//             top: 0,
//             child: Container(
//               width: 116,
//               height: 116,
//               decoration: ShapeDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/log6.png"),
//                   fit: BoxFit.fill,
//                 ),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(162.19),
//                 ),
//               ),
//             ),
//           ),
//           _buildStackWithAppBar(context),
//         ],
//       ),
//     );
//   }
// }



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kavach_project/localization/app_localization.dart';
import '../../core/app_export.dart';
import '../../theme/theme_helper.dart';
import '../Sign_up_screen/Sign_up_screen.dart';
import '../home_page/home_page.dart';
import 'provider/sign_up_login_provider.dart';

class SignUpLoginScreen extends StatefulWidget {
  const SignUpLoginScreen({Key? key})
      : super(
    key: key,
  );
  @override
  SignUpLoginScreenState createState() => SignUpLoginScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignUpLoginProvider(),
      child: SignUpLoginScreen(),
    );
  }
}

class SignUpLoginScreenState extends State<SignUpLoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  final FirebaseAuth _auth=FirebaseAuth.instance;

  final emailcontroller=TextEditingController();
  final passcontroller=TextEditingController();
  final _formkey=GlobalKey<FormState>();


  void login(){

    _auth.signInWithEmailAndPassword(
        email: emailcontroller.text,
        password: passcontroller.text.toString()).then((value){
          Utils.showToast(value.user!.email.toString());
          Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      Utils.showToast(error.toString());
    });

  }


  @override
  Widget build(BuildContext context) {

    //  final numcontroller=TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              _buildAppBar(context),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "lbl_sign_up_login".tr,
                          style: theme.textTheme.titleLarge,
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
                          child: Selector<SignUpLoginProvider,
                              TextEditingController?>(
                            selector: (
                                context,
                                provider,
                                ) =>
                            provider.emailcontroller,
                            builder: (context, emailcontroller, child) {
                              return
                                TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Enter Email";
                                    }
                                    return null;
                                  },
                                style: TextStyle(height: 1),
                                controller: emailcontroller,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                                    borderSide: BorderSide.none
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02,horizontal: MediaQuery.of(context).size.width * 0.03),
                                   fillColor: Colors.grey.shade100,
                                   focusColor: Colors.black,
                                   filled: true,
                                   hintText: "Email",
                                  hintStyle: TextStyle(fontSize: 15),
                                  prefixIcon: Icon(Icons.email,size: 16,)

                                ),
                                keyboardType: TextInputType.emailAddress,
                              );
                            },
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
                          child: Selector<SignUpLoginProvider,
                              TextEditingController?>(
                            selector: (
                                context,
                                provider,
                                ) =>
                            provider.passcontroller,
                            builder: (context, passcontroller, child) {
                              return
                                TextFormField(
                                  validator: (value){
                                    if(value!.isEmpty){
                                      return "Enter Password";
                                    }
                                    return null;
                                  },
                                  style: TextStyle(height: 1),
                                  controller: passcontroller,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
                                        borderSide: BorderSide.none
                                    ),
                                    contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.02,horizontal: MediaQuery.of(context).size.width * 0.03),

                                      fillColor: Colors.grey.shade100,
                                      focusColor: Colors.black,
                                      filled: true,
                                      hintText: "Password",
                                      hintStyle: TextStyle(fontSize: 15),
                                      prefixIcon: Icon(Icons.password,size: 16,)

                                  ),
                                  keyboardType: TextInputType.visiblePassword,
                                );
                            },
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                        ElevatedButton(
                          onPressed: () {
                            if(_formkey.currentState!.validate()){
                              login();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4C2559),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                            ),
                            minimumSize: Size(
                              MediaQuery.of(context).size.width * 0.90,
                              MediaQuery.of(context).size.height * 0.06,
                            ),
                          ),
                          child: Text(
                            "Continue",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                            ),
                          ),
                        ),


                        SizedBox(height: MediaQuery.of(context).size.height * 0.03),




                        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Didn't have an account?"),
                          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                            },
                              child: Text("SIGN UP",style: TextStyle(fontWeight: FontWeight.bold),))
                        ],
                      ),
                        SizedBox(height: MediaQuery.of(context).size.height * 0.40,),
                        //  Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("By continuing, you agree that you have read and accepted our",
                                style: TextStyle(
                                  fontSize: 10.5,
                                  color: Colors.grey,
                                ),),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text("T&Cs",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4C2659),
                                ),),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.005,),
                            Center(
                              child: Text("and",
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                ),),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.005,),
                            Center(
                              child: Text("Privacy Policy",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF4C2659),
                                ),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildStackWithAppBar(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.09,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              alignment: Alignment.centerRight,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*0.09,
                  width: MediaQuery.of(context).size.width*0.09,
                  color: Colors.purple,
                ),
                // ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.09,
                    width: MediaQuery.of(context).size.width * 0.297,
                    decoration: BoxDecoration(
                      color:
                      theme.colorScheme.onPrimaryContainer.withOpacity(1),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.0001),
          Divider(
            thickness: 5,
            color: Colors.grey.shade100,
          ),
        ],
      ),
    );
  }




  // Widget _buildAppBar(BuildContext context) {
  //   return SizedBox(
  //     height: MediaQuery.of(context).size.height * 0.1,
  //     width: MediaQuery.of(context).size.width,
  //     child: Stack(
  //       alignment: Alignment.topLeft,
  //       children: [
  //         Positioned(
  //           left: 0,
  //           top: 0,
  //           child: Container(
  //             width: MediaQuery.of(context).size.width * 0.200,
  //             height: MediaQuery.of(context).size.height * 0.200,
  //           ),
  //         ),
  //         Image(
  //           image: AssetImage("assets/log6.png"),
  //           width: MediaQuery.of(context).size.width * 0.280, // Adjust width as needed
  //           height: MediaQuery.of(context).size.height * 0.400, // Adjust height as needed
  //         ),
  //         Positioned(
  //           left: MediaQuery.of(context).size.width * 0.170 + 9.0, // Adjust the offset as needed
  //           top: 30,
  //           child: Text(
  //             "kavach",
  //             style: TextStyle(fontSize: 20,), // Adjust font size as needed
  //           ),
  //         ),
  //         _buildStackWithAppBar(context),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Positioned(
            left: 0,
            top: 0,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.260, // Adjust container size
              height: MediaQuery.of(context).size.height * 0.260, // Adjust container size
            ),
          ),
          Image(
            image: AssetImage("assets/log6.png"),
            width: MediaQuery.of(context).size.width * 0.200, // Adjust width as needed
            height: MediaQuery.of(context).size.height * 0.380, // Adjust height as needed
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.150 + 9.0, // Adjust the offset as needed
            top: MediaQuery.of(context).size.height * 0.037, // Adjust top position to align with the image
            child: Text(
              "kavach",
              style: TextStyle(fontSize: 22,fontWeight: FontWeight.w600,fontFamily: 'kalam'), // Adjust font size as needed
            ),
          ),
          _buildStackWithAppBar(context),
        ],
      ),
    );
  }


}

class Utils {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black.withOpacity(0.8),
      textColor: Colors.white,
    );
  }

  void toastMessage(String string) {}
}