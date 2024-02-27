// import 'models/password_model.dart';
// import 'package:flutter/material.dart';
// import 'package:kavach/core/app_export.dart';
// import 'package:kavach/widgets/app_bar/appbar_subtitle_two.dart';
// import 'package:kavach/widgets/app_bar/custom_app_bar.dart';
// import 'package:kavach/widgets/custom_outlined_button.dart';
// import 'package:kavach/widgets/custom_text_form_field.dart';
// import 'provider/password_provider.dart';
//
// class PasswordScreen extends StatefulWidget {
//   const PasswordScreen({Key? key})
//       : super(
//           key: key,
//         );
//
//   @override
//   PasswordScreenState createState() => PasswordScreenState();
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => PasswordProvider(),
//       child: PasswordScreen(),
//     );
//   }
// }
//
// class PasswordScreenState extends State<PasswordScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: SizedBox(
//         width: double.maxFinite,
//         child: Column(
//           children: [
//             _buildAppBarStack(context),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: 20.h,
//                   vertical: 19.v,
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(left: 3.h),
//                       child: Text(
//                         "lbl_password".tr,
//                         style: CustomTextStyles.bodyLargePrimaryContainer,
//                       ),
//                     ),
//                     SizedBox(height: 16.v),
//                     Padding(
//                       padding: EdgeInsets.only(left: 3.h),
//                       child: Text(
//                         "lbl_enter_password".tr,
//                         style: theme.textTheme.bodyMedium,
//                       ),
//                     ),
//                     SizedBox(height: 9.v),
//                     Padding(
//                       padding: EdgeInsets.only(
//                         left: 3.h,
//                         right: 4.h,
//                       ),
//                       child: Consumer<PasswordProvider>(
//                         builder: (context, provider, child) {
//                           return CustomTextFormField(
//                             controller: provider.passwordController,
//                             textInputAction: TextInputAction.done,
//                             suffix: InkWell(
//                               onTap: () {
//                                 provider.changePasswordVisibility();
//                               },
//                               child: Container(
//                                 margin: EdgeInsets.fromLTRB(
//                                     30.h, 11.v, 13.h, 11.v),
//                                 child: CustomImageView(
//                                   imagePath: ImageConstant.imgHidden121978911,
//                                   height: 19.v,
//                                   width: 20.h,
//                                 ),
//                               ),
//                             ),
//                             suffixConstraints: BoxConstraints(
//                               maxHeight: 41.v,
//                             ),
//                             obscureText: provider.isShowPassword,
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 14.v),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: Text(
//                         "msg_forget_password".tr,
//                         style: theme.textTheme.bodySmall!.copyWith(
//                           decoration: TextDecoration.underline,
//                         ),
//                       ),
//                     ),
//                     Spacer(),
//                     SizedBox(height: 68.v),
//                     CustomOutlinedButton(
//                       width: 185.h,
//                       text: "lbl_login".tr,
//                       buttonTextStyle: CustomTextStyles.bodyLargeBlack900,
//                       alignment: Alignment.center,
//                     ),
//                   ],
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
//   Widget _buildAppBarStack(BuildContext context) {
//     return SizedBox(
//       height: 90.v,
//       width: double.maxFinite,
//       child: Stack(
//         alignment: Alignment.topRight,
//         children: [
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: EdgeInsets.only(bottom: 19.v),
//               child: SizedBox(
//                 width: double.maxFinite,
//                 child: Divider(),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.topRight,
//             child: Container(
//               height: 64.v,
//               width: 297.h,
//               decoration: BoxDecoration(
//                 color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
//               ),
//             ),
//           ),
//           CustomAppBar(
//             title: AppbarSubtitleTwo(
//               text: "lbl_kavach".tr,
//               margin: EdgeInsets.only(left: 101.h),
//             ),
//             styleType: Style.bgFill,
//           ),
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Container(
//               height: 90.v,
//               width: 116.h,
//               margin: EdgeInsets.only(left: 10.h),
//               child: Stack(
//                 alignment: Alignment.topLeft,
//                 children: [
//                   CustomImageView(
//                     imagePath: ImageConstant.imgLog6290x116,
//                     height: 90.v,
//                     width: 116.h,
//                     radius: BorderRadius.circular(
//                       58.h,
//                     ),
//                     alignment: Alignment.center,
//                   ),
//                   CustomImageView(
//                     imagePath: ImageConstant.imgRightArrow3682892,
//                     height: 22.v,
//                     width: 28.h,
//                     alignment: Alignment.topLeft,
//                     margin: EdgeInsets.only(top: 21.v),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:kavach_project/localization/app_localization.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/custom_image_view.dart';
import '../forget_pass_screen/forget_pass_screen.dart';
import '../home_page/home_page.dart';
import 'models/password_model.dart';
import 'package:flutter/material.dart';
import 'provider/password_provider.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key})
      : super(
    key: key,
  );

  @override
  PasswordScreenState createState() => PasswordScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PasswordProvider(),
      child: PasswordScreen(),
    );
  }
}

class PasswordScreenState extends State<PasswordScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenWidth = size.width;
    final double screenHeight = size.height;

    bool pass=true;


    final ThemeData theme = Theme.of(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          children: [
            _buildAppBarStack(context, screenWidth, screenHeight),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20 * screenWidth / 392,
                  vertical: 10 * screenHeight / 800,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 3 * screenWidth / 392),
                      child: Text(
                        "lbl_password".tr,
                        style: TextStyle(fontSize: 22.5),
                      ),
                    ),
                    SizedBox(height: 16 * screenHeight / 800),
                    Padding(
                      padding: EdgeInsets.only(left: 3 * screenWidth / 392),
                      child: Text(
                        "lbl_enter_password".tr,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                    SizedBox(height: 5 * screenHeight / 800),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 3 * screenWidth / 392,
                        right: 4 * screenWidth / 392,
                      ),
                      child: Consumer<PasswordProvider>(
                        builder: (context, provider, child) {
                          return TextFormField(
                            style: TextStyle(height: 1.2),
                            cursorColor: Colors.black,
                            controller: provider.passwordController,
                            obscureText: provider.isShowPassword,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
                              suffixIcon: IconButton(
                                icon: Icon(Icons.visibility_off,color: Colors.black,),
                                onPressed: () {
                                  provider.changePasswordVisibility();
                                },
                              ),                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 14 * screenHeight / 800),
                    Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPass()));
                        },
                        child: Text(
                          "msg_forget_password".tr,
                          style: theme.textTheme.bodySmall!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                   // Spacer(),
                    SizedBox(height: 400 * screenHeight / 800),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4C2659), // Set to transparent to make it look like an outlined button
                          side: BorderSide(color: Colors.black), // Border color
                          minimumSize: Size(185 * screenWidth / 392, 50), // Set the minimum size
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0), // Set border radius
                          ),
                        ),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAppBarStack(
      BuildContext context, double screenWidth, double screenHeight) {
    return SizedBox(
      height: 90 * screenHeight / 800,
      width: double.maxFinite,
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10 * screenHeight / 800),
              child: SizedBox(
                width: double.maxFinite,
                child: Divider(
                  color: Colors.grey.shade100,
                  thickness: 5,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              height: 64 * screenHeight / 800,
              width: 268 * screenWidth / 392,
              decoration: BoxDecoration(
                color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
           // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios_new,color: Color(0xFF4C2559),),
              ),
              Image(image: AssetImage("assets/log6.png")),
              Text("Kavach",style: TextStyle(fontSize: 20),),
            ],
          ),




        ],
      ),
    );
  }
}
