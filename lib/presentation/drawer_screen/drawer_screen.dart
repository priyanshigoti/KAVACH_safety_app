

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Feedback_screen/Feedback_screen.dart';
import '../add_friend.dart';
import '../history_two_screen/history_two_screen.dart';
import '../language.dart';
import '../legal.dart';
import '../settings.dart';
import '../sign_up_login_screen/sign_up_login_screen.dart';



class Drawerscreen extends StatefulWidget {
  const Drawerscreen({Key? key}) : super(key: key);

  @override
  State<Drawerscreen> createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {


  bool isSwitched = false;
  void logout() async {
    await FirebaseAuth.instance.signOut();
    Utils.showToast("Logged out successfully");
    // Navigate back to the login screen or any other screen as needed
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child:
            Container(
              width: double.infinity,
              height: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Color(0xFF4C2559)),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: 68,
                    child: Container(
                      width: 392,
                      height: 780,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF2DAF1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),),),),),),

                  Positioned(
                    left: 35,
                    top: 100,
                    child: Container(
                      width: 323,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 323,
                              height: 74,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFAF2FA),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.50,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    color: Color(0xFFDCBFE3),
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,)],),),),
                          Positioned(
                            left: 20,
                            top: 13,
                            child: Container(
                              width: 43,
                              height: 43,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/woman_4140047.png"),
                                  fit: BoxFit.fill,),),),),
                          Positioned(
                            left: 68,
                            top: 23,
                            child: SizedBox(
                              width: 44,
                              height: 14,
                              child: Text(
                                'Alice ',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF5C343E),
                                  fontSize: 11,
                                  fontFamily: 'Arial',
                                  //fontWeight: FontWeight.w400,
                                  height: 0,),),),),
                          Positioned(
                            left: 72,
                            top: 37,
                            child: SizedBox(
                              width: 80,
                              height: 14,
                              child: Text(
                                '+91 1234567890',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFA5A5A5),
                                  fontSize: 9,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 25,
                    child: Container(
                      width: 346,
                      height: 43,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 57,
                              height: 43,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/log6.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(162.19),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 43,
                            top: 11,
                            child: SizedBox(
                              width: 66,
                              height: 20.95,
                              child: Text(
                                'Kavach',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFFEBB9E9),
                                  fontSize: 19,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 320,
                            top: 10,
                            child: Container(
                              width: 26,
                              height: 25,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/woman_4140047.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    top: 190,
                    child: Container(
                      width: 163.66,
                      height: 67,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                              width: 163.66,
                              height: 67,
                              decoration: ShapeDecoration(
                                color: Color(0xFFFAF2FA),
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1.50,
                                    strokeAlign: BorderSide.strokeAlignOutside,
                                    color: Color(0xFFDCBFE3),
                                  ),
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                shadows: [
                                  BoxShadow(
                                    color: Color(0x3F000000),
                                    blurRadius: 4,
                                    offset: Offset(0, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            left: 31,
                            top: 16,
                            child: SizedBox(
                              width: 56.23,
                              height: 16.75,
                              child: Text(
                                'SOS Device',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF5C343E),
                                  fontSize: 9,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 15,
                            top: 40.68,
                            child: SizedBox(
                              width: 61,
                              height: 13.16,
                              child: Text(
                                'Disconnected',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF5C343E),
                                  fontSize: 10,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          // Positioned(
                          //   left: 144,
                          //   top: 7,
                          //   child: Container(
                          //     width: 12,
                          //     height: 12,
                          //     decoration: BoxDecoration(
                          //       image: DecorationImage(
                          //         image: AssetImage("assets/respect_1189183.png"),
                          //         fit: BoxFit.fill,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          Positioned(
                            left: 15,
                            top: 13,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/mirroring_10054636.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 121,
                            top: 34.70,
                            child: SizedBox(
                              width: 20,height: 20,
                              child: Switch(
                                  value: isSwitched,
                                  onChanged: (value){
                                    setState(() {
                                      isSwitched=value;
                                    });
                                  }),
                            ),
                            // ToggleButtons(
                            //   children: [
                            //
                            //   ],
                            //   // child: Container(
                            //   //   width: 25,
                            //   //   height: 25.12,
                            //   //   decoration: BoxDecoration(
                            //   //     image: DecorationImage(
                            //   //       image: AssetImage("assets/toggle-button_5720465.png"),
                            //   //       fit: BoxFit.fill,
                            //   //     ),
                            //   //   ),
                            //   // ),
                            // ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 275,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryTwoScreen()));
                      },
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 66,
                              top: 30,
                              child: SizedBox(
                                width: 44,
                                height: 14,
                                child: Text(
                                  'History',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 30,
                              top: 27,
                              child: Container(
                                width: 21,
                                height: 21,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/text_2878671.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210,
                    top: 275,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Addfriend()));
                      },
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 73,
                              top: 30,
                              child: SizedBox(
                                width: 44,
                                height: 14,
                                child: Text(
                                  'Friends',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 22,
                              top: 22,
                              child: Container(
                                width: 31,
                                height: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/respect_1189183.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 370,
                    child: Container(
                      width: 145,
                      height: 74,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Drawerscreen()));
                              },
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 73,
                            top: 30,
                            child: SizedBox(
                              width: 44,
                              height: 14,
                              child: Text(
                                'Blocklist',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF5C343E),
                                  fontSize: 11,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 25,
                            top: 27,
                            child: Container(
                              width: 26,
                              height: 26,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/delete-list_1201.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210,
                    top: 370,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedBackScreen()));
                      },
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 77,
                              top: 27,
                              child: SizedBox(
                                width: 51,
                                height: 14,
                                child: Text(
                                  'Feedback',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 17,
                              top: 21,
                              child: Container(
                                width: 36,
                                height: 32,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/social-engagement_12943518.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 465,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Legal()));
                      },
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 63,
                              top: 30,
                              child: SizedBox(
                                width: 44,
                                height: 14,
                                child: Text(
                                  'Legal',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 25,
                              child: Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/protected_2058324.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210,
                    top: 465,
                    child: GestureDetector(
                      onTap: (){
                       // Navigator.push(context, MaterialPageRoute(builder: (context)=>HistoryPage()));
                      },
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 70,
                              top: 30,
                              child: SizedBox(
                                width: 44,
                                height: 14,
                                child: Text(
                                  'Help',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 22,
                              top: 25,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/info_943933.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 35,
                    top: 560,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LangSetting()));
                      },
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 72,
                              top: 27,
                              child: SizedBox(
                                width: 50,
                                height: 14,
                                child: Text(
                                  'Language',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 25,
                              top: 21,
                              child: Container(
                                width: 26,
                                height: 28,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/translate_6490326.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 210,
                    top: 560,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                      },
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 77,
                              top: 27,
                              child: SizedBox(
                                width: 44,
                                height: 14,
                                child: Text(
                                  'Settings',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 22,
                              top: 21,
                              child: Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/settings_420216.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 120,
                    top: 665,
                    child: GestureDetector(
                      onTap: logout,
                      child: Container(
                        width: 145,
                        height: 74,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 0,
                              child: Container(
                                width: 145,
                                height: 74,
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFAF2FA),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.50,
                                      strokeAlign: BorderSide.strokeAlignOutside,
                                      color: Color(0xFFDCBFE3),
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0x3F000000),
                                      blurRadius: 4,
                                      offset: Offset(0, 4),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 73,
                              top: 30,
                              child: SizedBox(
                                width: 44,
                                height: 14,
                                child: Text(
                                  'Logout',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF5C343E),
                                    fontSize: 11,
                                    fontFamily: 'Arial',
                                    fontWeight: FontWeight.w400,
                                    height: 0,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              left: 28,
                              top: 23,
                              child: Container(
                                width: 25,
                                height: 28,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/logout_4400314.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 320,
                    top: 125,
                    child: Container(
                      width: 19,
                      height: 19,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/pencil_9440045 1.png"),
                          fit: BoxFit.fill,),),),),],),),),],),
    );
  }
}
