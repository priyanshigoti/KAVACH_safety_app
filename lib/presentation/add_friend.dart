//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:kavach_pro/presentation/Feedback.dart';
//
// class Addfriend extends StatefulWidget {
//   const Addfriend({super.key});
//
//   @override
//   State<Addfriend> createState() => _AddfriendState();
// }
//
// class _AddfriendState extends State<Addfriend> {
//
//   final numcontroller=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:     SingleChildScrollView(
//         child: Column(
//           children: [
//             Container(
//               width: 392,
//               height: 825,
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(color: Colors.white),
//               child: Stack(
//                 children: [
//                   Positioned(
//                     left: 0,
//                     top: -15,
//                     child: Container(
//                       width: 392,
//                       height: 90,
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             left: 0,
//                             top: 82,
//                             child: Container(
//                               width: 392,
//                               decoration: ShapeDecoration(
//                                 shape: RoundedRectangleBorder(
//                                   side: BorderSide(
//                                     width: 2.50,
//                                     strokeAlign: BorderSide.strokeAlignCenter,
//                                     color: Colors.grey.shade100,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             left: 63,
//                             top: 13,
//                             child: Container(
//                               width: 297,
//                               height: 64,
//                               decoration: BoxDecoration(color: Colors.white),
//                             ),
//                           ),
//                           Positioned(
//                             left: 0,
//                             top: 13,
//                             child: Container(
//                               width: 360,
//                               height: 64,
//                               decoration: BoxDecoration(color: Color(0xFFFFFDFD)),
//                             ),
//                           ),
//                           Positioned(
//                             left: 90,
//                             top: 48,
//                             child: SizedBox(
//                               width: 69,
//                               height: 16,
//                               child: Text(
//                                 'Kavach',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   color: Color(0xFF5C343E),
//                                   fontSize: 20,
//                                   fontFamily: 'Arial',
//                                   fontWeight: FontWeight.w400,
//                                   height: 0,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Positioned(
//                             left: 5.52,
//                             top: 45,
//                             child: Container(
//                               width: 28.36,
//                               height: 22,
//                               child: Icon(Icons.arrow_back_ios_new_outlined,color: Color(0xFF4C2559),),
//                             ),
//                           ),
//                           Positioned(
//                             left: 18,
//                             top: 13,
//                             child: Container(
//                               width: 90,
//                               height: 90,
//                               decoration: ShapeDecoration(
//                                 image: DecorationImage(
//                                   image: AssetImage("assets/log6.png"),
//                                   fit: BoxFit.fill,
//                                 ),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(162.19),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 143,
//                     top: 95,
//                     child: Text(
//                       'Add Friend',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF683F72),
//                         fontSize: 22,
//                         fontFamily: 'Arial',
//                         fontWeight: FontWeight.w400,
//                         height: 0,
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 215,left: 40,right: 100),
//                     child: TextFormField(
//                       style: TextStyle(height: 1),
//                       controller: numcontroller,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           borderSide: BorderSide(color: Colors.red, width: 2.0),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.purple.shade100, width: 2.0),
//                         ),
//                         contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.01,horizontal: MediaQuery.of(context).size.width * 0.03),
//
//                         // hintText: "Plese Enter email",
//
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                     ),
//                   ),
//                   Positioned(
//                     left: 310,
//                     top: 215,
//                     child: GestureDetector(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>FeedBack()));
//                       },
//                       child: Container(
//                         width: 47,
//                         height: 47,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Image(image: AssetImage("assets/contact-book.png")),
//                         ),
//                         decoration: ShapeDecoration(
//                           color: Color(0xFFFBF2FB),
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(width: 1, color: Color(0xFFD8BEE1)),
//                             borderRadius: BorderRadius.circular(13),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 60,
//                     top: 290,
//                     child: SizedBox(
//                       width: 210,
//                       child: Text(
//                         'Make this person my SOS contact',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Color(0xFF683F72),
//                           fontSize: 13,
//                           fontFamily: 'Arial',
//                           fontWeight: FontWeight.w400,
//                           height: 0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   // Positioned(
//                   //   left: 59,
//                   //   top: 236,
//                   //   child: Container(
//                   //     width: 10,
//                   //     height: 10,
//                   //     decoration: BoxDecoration(
//                   //       image: DecorationImage(
//                   //         image: AssetImage("assets/log6.png"),
//                   //         fit: BoxFit.fill,
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
//                   Positioned(
//                     left: 38,
//                     top: 285.16,
//                     child: Container(
//                       width: 19,
//                       height: 19,
//                       child: Icon(Icons.star,color: Color(0xFF4C2559),size: 15,),
//                     ),
//                   ),
//                   Positioned(
//                     left: 39,
//                     top: 331,
//                     child: Container(
//                       width: 313,
//                       height: 178,
//                       decoration: ShapeDecoration(
//                         color: Color(0xFFFBF2FB),
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(width: 1, color: Color(0xFFA68CAF)),
//                           borderRadius: BorderRadius.circular(13),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 60,
//                     top: 346,
//                     child: Container(
//                       width: 25,
//                       height: 25,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/multiple-users-silhouette.png"),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 165,
//                     top: 125,
//                     child: Container(
//                       width: 60,
//                       height: 60,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/multiple-users-silhouette.png"),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 90,
//                     top: 353,
//                     child: SizedBox(
//                       width: 53,
//                       child: Text(
//                         'Friend',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Color(0xFF683F72),
//                           fontSize: 15,
//                           fontFamily: 'Arial',
//                           fontWeight: FontWeight.w400,
//                           height: 0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 92,
//                     top: 431,
//                     child: SizedBox(
//                       width: 79,
//                       child: Text(
//                         'SOS Contact',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           color: Color(0xFF683F72),
//                           fontSize: 13,
//                           fontFamily: 'Arial',
//                           fontWeight: FontWeight.w400,
//                           height: 0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 60,
//                     top: 376,
//                     child: SizedBox(
//                       width: 261,
//                       child: Text(
//                         'You can share your live location with your friends using the track me feature.',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontFamily: 'Arial',
//                           fontWeight: FontWeight.w400,
//                           height: 0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 60,
//                     top: 455,
//                     child: SizedBox(
//                       width: 261,
//                       child: Text(
//                         'You can send SOS alerts only to the SOS contacts durings on emergency.',
//                         style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 12,
//                           fontFamily: 'Arial',
//                           fontWeight: FontWeight.w400,
//                           height: 0,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     left: 78,
//                     top: 469,
//                     child: Container(width: 30, height: 30),
//                   ),
//                   Positioned(
//                     left: 60,
//                     top: 425,
//                     child: Container(
//                       width: 24,
//                       height: 24,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage("assets/sos.png"),
//                           fit: BoxFit.fill,
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 612,
//                     left: 37,
//                     child: Stack(
//                       children: [
//                         ElevatedButton(
//                           onPressed: () {
//                           //  Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordScreen()));
//                           },
//                           style: ElevatedButton.styleFrom(
//                             primary: Color(0xFF4C2559),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                             ),
//                             minimumSize: Size(
//                               MediaQuery.of(context).size.width * 0.80,
//                               MediaQuery.of(context).size.height * 0.06,
//                             ),
//                           ),
//                           child: Text(
//                             "Add SOS Contact",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 13,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//
//     );
//   }
// }
//


import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Feedback_screen/Feedback_screen.dart';
import 'contactlist.dart';

class Addfriend extends StatefulWidget {
  const Addfriend({Key? key}) : super(key: key);

  @override
  State<Addfriend> createState() => _AddfriendState();
}

class _AddfriendState extends State<Addfriend> {
  final numcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: screenWidth * 0.98,
              height: screenHeight * 0.98,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(color: Colors.white),
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    top: -15,
                    child: Container(
                      width: screenWidth * 0.98,
                      height: screenHeight * 0.4,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: screenHeight * 0.1 - 4,
                            child: Container(
                              width: screenWidth * 0.98,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 2.50,
                                    color: Colors.grey.shade100,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: screenWidth * 0.16,
                            top: screenHeight * 0.016,
                            child: Container(
                              width: screenWidth * 0.76,
                              height: screenHeight * 0.065,
                              decoration: BoxDecoration(color: Colors.white),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: screenHeight * 0.016,
                            child: Container(
                              width: screenWidth * 0.87,
                              height: screenHeight * 0.065,
                              decoration: BoxDecoration(color: Color(0xFFFFFDFD)),
                            ),
                          ),
                          Positioned(
                            left: screenWidth * 0.27,
                            top: screenHeight * 0.052,
                            child: SizedBox(
                              width: screenWidth * 0.18,
                              height: screenHeight * 0.025,
                              child: Text(
                                'Kavach',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF5C343E),
                                  fontSize: screenHeight * 0.025,
                                  fontFamily: 'Arial',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: screenWidth * 0.035,
                            top: screenHeight * 0.049,
                            child: Container(
                              width: screenWidth * 0.07,
                              height: screenWidth * 0.07,
                              child: InkWell(
                                onTap: (){
                                  Navigator.pop(context);
                                },
                                  child: Icon(Icons.arrow_back_ios_new_outlined, color: Color(0xFF4C2559))),
                            ),
                          ),
                          Positioned(
                            left: screenWidth * 0.085,
                            top: screenHeight * 0.018,
                            child: Container(
                              width: screenWidth * 0.21,
                              height: screenWidth * 0.21,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/log6.png"),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(screenWidth * 0.14 / 2),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.35,
                    top: screenHeight * 0.11,
                    child: Text(
                      'Add Friend',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF683F72),
                        fontSize: screenHeight * 0.027,
                        fontFamily: 'Arial',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.27, left: screenWidth * 0.06, right: screenWidth * 0.20),
                    child: TextFormField(
                      style: TextStyle(height: 1),
                      controller: numcontroller,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(screenWidth * 0.04),
                          // borderSide: BorderSide(color: Colors.red, width: 2.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.purple.shade100, width: 2.0),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: screenHeight * 0.01, horizontal: screenWidth * 0.03),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.82,
                    top: screenHeight * 0.27,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => FeedBackScreen()));
                      },
                      child: Container(
                        width: screenWidth * 0.12,
                        height: screenWidth * 0.12,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image(image: AssetImage("assets/contact-book.png")),
                        ),
                        decoration: ShapeDecoration(
                          color: Color(0xFFFBF2FB),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(width: 1, color: Color(0xFFD8BEE1)),
                            borderRadius: BorderRadius.circular(screenWidth * 0.03),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.10,
                    top: screenHeight * 0.36,
                    child: SizedBox(
                      width: screenWidth * 0.70,
                      child: Text(
                        'Make this person my SOS contact',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF683F72),
                          fontSize: 16,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    top: screenHeight * 0.355,
                    child: Container(
                      width: screenWidth * 0.055,
                      height: screenHeight * 0.036,
                      child: Icon(Icons.star, color: Color(0xFF4C2559), size: screenHeight * 0.023),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.05,
                    top: screenHeight * 0.413,
                    child: Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.22,
                      decoration: ShapeDecoration(
                        color: Color(0xFFFBF2FB),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFA68CAF)),
                          borderRadius: BorderRadius.circular(screenWidth * 0.027),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 45,
                    top: screenHeight * 0.45,
                    child: Container(
                      width: screenWidth * 0.065,
                      height: screenWidth * 0.065,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/multiple-users-silhouette.png"),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.412,
                    top: screenHeight * 0.15,
                    child: Container(
                      width: screenWidth * 0.15,
                      height: screenWidth * 0.15,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/multiple-users-silhouette.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.09,
                    top: screenHeight * 0.428,
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      child: Text(
                        'Friend',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF683F72),
                          fontSize: screenHeight * 0.022,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 55,
                    top: screenHeight * 0.535,
                    child: SizedBox(
                      width: screenWidth * 0.412,
                      child: Text(
                        'SOS Contact',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF683F72),
                          fontSize: screenHeight * 0.018,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 85,
                    top: screenHeight * 0.46,
                    child: SizedBox(
                      width: screenWidth * 0.658,
                      child: Text(
                        'You can share your live location with your friends using the track me feature.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 91,
                    top: screenHeight * 0.56,
                    child: SizedBox(
                      width: screenWidth * 0.712,
                      child: Text(
                        'You can send SOS alerts only to the SOS contacts durings on emergency.',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Arial',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: screenWidth * 0.07,
                    top: screenHeight * 0.6,
                    child: Container(width: screenWidth * 0.1, height: screenWidth * 0.09),
                  ),
                  Positioned(
                    left: 45,
                    top: screenHeight * 0.55,
                    child: Container(
                      width: screenWidth * 0.070,
                      height: screenWidth * 0.070,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/sos.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: screenHeight * 0.76,
                    left: screenWidth * 0.19,
                    child: Stack(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => ContactSearch()));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4C2559),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(screenWidth * 0.04),
                            ),
                            minimumSize: Size(
                              screenWidth * 0.60,
                              screenHeight * 0.06,
                            ),
                          ),
                          child: Text(
                            "Add SOS Contact",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenHeight * 0.018,
                            ),
                          ),
                        ),
                      ],
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