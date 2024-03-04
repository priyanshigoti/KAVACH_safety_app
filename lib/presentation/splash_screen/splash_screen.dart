//
//
//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:permission_handler/permission_handler.dart';
//
// import '../../core/app_export.dart';
// import '../../core/utils/navigator_service.dart';
// import '../../routes/app_routes.dart';
// import 'provider/splash_provider.dart';
// import 'models/splash_model.dart';
//
// class SplashScreen extends StatefulWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//
//   @override
//   SplashScreenState createState() => SplashScreenState();
//
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//         create: (context) => SplashProvider(), child: SplashScreen());
//   }
// }
//
// class SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     _requestPermissions();
//     Future.delayed(const Duration(seconds: 4), () {
//       NavigatorService.popAndPushNamed(
//         AppRoutes.signUpLoginScreen,
//       );
//     });
//   }
//
//   void _requestPermissions() async {
//     await _requestContactsPermission();
//     await _requestPhoneCallPermission();
//     await _requestSMSPermission();
//   }
//
//   Future<void> _requestContactsPermission() async {
//     // Request permission to access contacts
//     PermissionStatus status = await Permission.contacts.request();
//     if (!status.isGranted) {
//       // Permission is denied
//       // You might want to inform the user why the permission is needed
//     }
//   }
//
//   Future<void> _requestPhoneCallPermission() async {
//     // Request permission to make phone calls
//     PermissionStatus status = await Permission.phone.request();
//     if (!status.isGranted) {
//       // Permission is denied
//       // You might want to inform the user why the permission is needed
//     }
//   }
//
//   Future<void> _requestSMSPermission() async {
//     // Request permission to send SMS
//     PermissionStatus status = await Permission.sms.request();
//     if (!status.isGranted) {
//       // Permission is denied
//       // You might want to inform the user why the permission is needed
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double screenHeight = size.height;
//     final double screenWidth = size.width;
//
//     return Scaffold(
//       //backgroundColor: appTheme.purple200,
//       body: SizedBox(
//         width: screenWidth,
//         child: Column(
//           children: [
//             SizedBox(height: screenHeight * 0.01),
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Container(
//                   height: screenHeight,
//                   width: screenWidth,
//                   margin: EdgeInsets.only(
//                     left: screenWidth * 0.00276,
//                     right: screenWidth * 0.00276,
//                     bottom: screenHeight * 0.01,
//                   ),
//                   child: Stack(
//                     alignment: Alignment.topCenter,
//                     children: [
//                       Align(
//                         alignment: Alignment.topCenter,
//                         child: Container(
//                           height: screenHeight * 0.4026,
//                           width: screenWidth * 0.7251,
//                           margin:
//                           EdgeInsets.only(top: screenHeight * 0.2570),
//                           child: Stack(
//                             alignment: Alignment.bottomLeft,
//                             children: [
//                               Image(
//                                 image: AssetImage("assets/log5.png"),
//                                 height: 500,
//                                 width: 500,
//                               ),
//                               // CustomImageView(
//                               //   imagePath: ImageConstant.imgLog61,
//                               //   height: screenHeight * 0.4026,
//                               //   width: screenWidth * 0.6956,
//                               //   radius: BorderRadius.circular(screenWidth * 0.3373),
//                               //   alignment: Alignment.center,
//                               // ),
//                               //
//                               // Align(
//                               //   alignment: Alignment.bottomLeft,
//                               //   child: Padding(
//                               //     padding: EdgeInsets.only(left: screenWidth * 0.1019),
//                               //     child: Text(
//                               //       "msg_your_security_our".tr,
//                               //       style: CustomTextStyles.bodyMediumKalamOnPrimary,
//                               //     ),
//                               //   ),
//                               // ),
//                               // Align(
//                               //   alignment: Alignment.bottomLeft,
//                               //   child: Padding(
//                               //     padding: EdgeInsets.only(left: screenWidth * 0.2182, bottom: screenHeight * 0.0918),
//                               //     child: Text(
//                               //       "lbl_kavach".tr,
//                               //       style: theme.textTheme.headlineMedium,
//                               //     ),
//                               //   ),
//                               // ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           height: screenHeight,
//                           width: screenWidth,
//                           decoration: BoxDecoration(
//                             borderRadius:
//                             BorderRadius.circular(screenWidth * 0.0138),
//                             // gradient: LinearGradient(
//                             //   begin: Alignment(0.5, 1),
//                             //   end: Alignment(0.5, 0.29),
//                             //   colors: [
//                             //     appTheme.purple50D1,
//                             //     appTheme.purple100C9,
//                             //     appTheme.blueGray10000,
//                             //   ],
//                             // ),
//                           ),
//                         ),
//                       ),
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
// }


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../core/app_export.dart';
import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';
import 'provider/splash_provider.dart';
import 'models/splash_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SplashProvider(), child: SplashScreen());
  }
}

class SplashScreenState extends State<SplashScreen> {
  bool _permissionsRequested = false;

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  void _requestPermissions() async {
    setState(() {
      _permissionsRequested = true;
    });

    await _requestContactsPermission();
    await _requestPhoneCallPermission();
    await _requestSMSPermission();

    // Navigating after permissions are requested
    NavigatorService.popAndPushNamed(AppRoutes.signUpLoginScreen);
  }

  Future<void> _requestContactsPermission() async {
    // Request permission to access contacts
    PermissionStatus status = await Permission.contacts.request();
    if (!status.isGranted) {
      // Permission is denied
      // You might want to inform the user why the permission is needed
    }
  }

  Future<void> _requestPhoneCallPermission() async {
    // Request permission to make phone calls
    PermissionStatus status = await Permission.phone.request();
    if (!status.isGranted) {
      // Permission is denied
      // You might want to inform the user why the permission is needed
    }
  }

  Future<void> _requestSMSPermission() async {
    // Request permission to send SMS
    PermissionStatus status = await Permission.sms.request();
    if (!status.isGranted) {
      // Permission is denied
      // You might want to inform the user why the permission is needed
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
      //backgroundColor: appTheme.purple200,
      body: Stack(
        children: [
          _buildContent(screenHeight, screenWidth),
          if (_permissionsRequested)
            Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _buildContent(double screenHeight, double screenWidth) {
    return SizedBox(
      width: screenWidth,
      child: Column(
        children: [
          SizedBox(height: screenHeight * 0.01),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                height: screenHeight,
                width: screenWidth,
                margin: EdgeInsets.only(
                  left: screenWidth * 0.00276,
                  right: screenWidth * 0.00276,
                  bottom: screenHeight * 0.01,
                ),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: screenHeight * 0.4026,
                        width: screenWidth * 0.7251,
                        margin:
                        EdgeInsets.only(top: screenHeight * 0.2570),
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image(
                              image: AssetImage("assets/log5.png"),
                              height: 500,
                              width: 500,
                            ),
                            // CustomImageView(
                            //   imagePath: ImageConstant.imgLog61,
                            //   height: screenHeight * 0.4026,
                            //   width: screenWidth * 0.6956,
                            //   radius: BorderRadius.circular(screenWidth * 0.3373),
                            //   alignment: Alignment.center,
                            // ),
                            //
                            // Align(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Padding(
                            //     padding: EdgeInsets.only(left: screenWidth * 0.1019),
                            //     child: Text(
                            //       "msg_your_security_our".tr,
                            //       style: CustomTextStyles.bodyMediumKalamOnPrimary,
                            //     ),
                            //   ),
                            // ),
                            // Align(
                            //   alignment: Alignment.bottomLeft,
                            //   child: Padding(
                            //     padding: EdgeInsets.only(left: screenWidth * 0.2182, bottom: screenHeight * 0.0918),
                            //     child: Text(
                            //       "lbl_kavach".tr,
                            //       style: theme.textTheme.headlineMedium,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Container(
                        height: screenHeight,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(screenWidth * 0.0138),
                          // gradient: LinearGradient(
                          //   begin: Alignment(0.5, 1),
                          //   end: Alignment(0.5, 0.29),
                          //   colors: [
                          //     appTheme.purple50D1,
                          //     appTheme.purple100C9,
                          //     appTheme.blueGray10000,
                          //   ],
                          // ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
