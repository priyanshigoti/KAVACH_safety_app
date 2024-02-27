// import 'models/splash_model.dart';
// import 'package:flutter/material.dart';
// import 'package:kavach/core/app_export.dart';
// import 'provider/splash_provider.dart';
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
//     Future.delayed(const Duration(milliseconds: 3000), () {
//       NavigatorService.popAndPushNamed(
//         AppRoutes.signUpLoginScreen,
//       );
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//             backgroundColor: appTheme.purple200,
//             body: SizedBox(
//                 width: 362.h,
//                 child: Column(children: [
//                   SizedBox(height: 1.v),
//                   Expanded(
//                       child: SingleChildScrollView(
//                           child: Container(
//                               height: SizeUtils.height,
//                               width: double.maxFinite,
//                               margin: EdgeInsets.only(
//                                   left: 1.h, right: 1.h, bottom: 1.v),
//                               child:
//                                   Stack(alignment: Alignment.center, children: [
//                                 Align(
//                                     alignment: Alignment.topCenter,
//                                     child: Container(
//                                         height: 244.v,
//                                         width: 253.h,
//                                         margin: EdgeInsets.only(top: 261.v),
//                                         child: Stack(
//                                             alignment: Alignment.bottomLeft,
//                                             children: [
//                                               CustomImageView(
//                                                   imagePath:
//                                                       ImageConstant.imgLog61,
//                                                   height: 244.v,
//                                                   width: 253.h,
//                                                   radius: BorderRadius.circular(
//                                                       122.h),
//                                                   alignment: Alignment.center),
//                                               Align(
//                                                   alignment:
//                                                       Alignment.bottomLeft,
//                                                   child: Padding(
//                                                       padding: EdgeInsets.only(
//                                                           left: 37.h),
//                                                       child: Text(
//                                                           "msg_your_security_our"
//                                                               .tr,
//                                                           style: CustomTextStyles
//                                                               .bodyMediumKalamOnPrimary))),
//                                               Align(
//                                                   alignment:
//                                                       Alignment.bottomLeft,
//                                                   child: Padding(
//                                                       padding: EdgeInsets.only(
//                                                           left: 79.h,
//                                                           bottom: 25.v),
//                                                       child: Text(
//                                                           "lbl_kavach".tr,
//                                                           style: theme.textTheme
//                                                               .headlineMedium)))
//                                             ]))),
//                                 Align(
//                                     alignment: Alignment.center,
//                                     child: Container(
//                                         height: SizeUtils.height,
//                                         width: double.maxFinite,
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                                 BorderRadius.circular(5.h),
//                                             gradient: LinearGradient(
//                                                 begin: Alignment(0.5, 1),
//                                                 end: Alignment(0.5, 0.29),
//                                                 colors: [
//                                                   appTheme.purple100C9,
//                                                   appTheme.purple50D1,
//                                                   appTheme.blueGray10000
//                                                 ]))))
//                               ]))))
//                 ]))));
//   }
// }

import '../../core/app_export.dart';
import '../../core/utils/navigator_service.dart';
import '../../routes/app_routes.dart';
import 'models/splash_model.dart';
import 'package:flutter/material.dart';
import 'provider/splash_provider.dart';

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
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      NavigatorService.popAndPushNamed(
        AppRoutes.signUpLoginScreen,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double screenHeight = size.height;
    final double screenWidth = size.width;

    return Scaffold(
     //backgroundColor: appTheme.purple200,
      body: SizedBox(
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
                          margin: EdgeInsets.only(top: screenHeight * 0.2570),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Image(image: AssetImage("assets/log5.png"),height:500,width: 500,),
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
                            borderRadius: BorderRadius.circular(screenWidth * 0.0138),
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
      ),
    );
  }
}
