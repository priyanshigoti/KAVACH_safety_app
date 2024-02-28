

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kavach_project/presentation/invite_friend/invite_friend.dart';

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
                    top: 85,
                    child: Container(
                      width: 392,
                      height: 780,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF2DAF1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            topRight: Radius.circular(25),),),),),),

                  Padding(
                    padding: const EdgeInsets.only(top: 250),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/file.png"), height: MediaQuery.of(context).size.width * 0.1, width: MediaQuery.of(context).size.width * 0.1),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("History", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/support.png"), height: MediaQuery.of(context).size.width * 0.12, width: MediaQuery.of(context).size.width * 0.13),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text("Friends", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/to-do-list.png"), height: MediaQuery.of(context).size.width * 0.085, width: MediaQuery.of(context).size.width * 0.085),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: Text("Blocklist", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 35,
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
                  Padding(
                    padding: const EdgeInsets.only(top: 400),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/chat.png"), height: MediaQuery.of(context).size.width * 0.1, width: MediaQuery.of(context).size.width * 0.1),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("Feedback", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/insurance.png"), height: MediaQuery.of(context).size.width * 0.12, width: MediaQuery.of(context).size.width * 0.13),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text("Legal", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/to-do-list.png"), height: MediaQuery.of(context).size.width * 0.085, width: MediaQuery.of(context).size.width * 0.085),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: Text("Help", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 550),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/file.png"), height: MediaQuery.of(context).size.width * 0.1, width: MediaQuery.of(context).size.width * 0.1),
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text("E-learning", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/settings.png"), height: MediaQuery.of(context).size.width * 0.12, width: MediaQuery.of(context).size.width * 0.13),
                              Padding(
                                padding: const EdgeInsets.only(top: 7),
                                child: Text("Settings", style: TextStyle(fontSize: 15, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(image: AssetImage("assets/to-do-list.png"), height: MediaQuery.of(context).size.width * 0.085, width: MediaQuery.of(context).size.width * 0.085),
                              Padding(
                                padding: const EdgeInsets.only(top: 9),
                                child: Text("Log-out", style: TextStyle(fontSize: 15, color: Color(0xFF4C2559))),
                              ),
                            ],
                          ),
                          height: MediaQuery.of(context).size.width * 0.28,
                          width: MediaQuery.of(context).size.width * 0.28,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            color: Colors.purple.shade50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),)
          ,],
      ),
    );
  }
}
