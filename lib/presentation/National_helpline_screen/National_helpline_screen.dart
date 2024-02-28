import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kavach_project/presentation/National_helpline_screen/provider/National_helpline_screeen_provider.dart';
import 'package:provider/provider.dart';

import '../Emergency_helplinecall_screen/Emergency_helplinecall_screen.dart';
import '../Newpassword_screen/Newpassword_screen.dart';
import '../drawer_screen/drawer_screen.dart';
import '../home_page/home_page.dart';
import '../profile_screen/profile_screen.dart';
import 'models/National_helpline_screen_,model.dart';

class Helpline extends StatefulWidget {
  const Helpline({Key? key}) : super(key: key);

  @override
  State<Helpline> createState() => _HelplineState();
}

class _HelplineState extends State<Helpline> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final helplineProvider = Provider.of<HelplineProvider>(context);
    final List<HelplineModel> helplines = helplineProvider.helplines;

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.70,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: -3,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.097,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: screenHeight * 0.092,
                          child: Container(
                            width: screenWidth,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: screenWidth * 0.0124,
                                  color: Colors.grey.shade100,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.1607,
                          top: 0,
                          child: Container(
                            width: screenWidth * 0.7589,
                            height: screenHeight * 0.0806,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: screenWidth * 0.9184,
                            height: screenHeight * 0.0806,
                            decoration: BoxDecoration(color: Color(0xFFFFFDFD)),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.1456,
                          top: screenHeight * 0.052,
                          child: SizedBox(
                            width: screenWidth * 0.1786,
                            height: screenHeight * 0.0279,
                            child: Text(
                              'Kavach',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF5C343E),
                                fontSize: screenWidth * 0.0530,
                                fontFamily: 'kalam',
                                fontWeight: FontWeight.w600,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.0625,
                          top: screenHeight * 0.055,
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios_new_sharp,
                              color: Color(0xFF4C2559),
                              size: screenWidth * 0.06,
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.8929,
                          top: screenHeight * 0.051,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Drawerscreen()));
                            },
                            child: Container(
                              width: screenWidth * 0.0485,
                              height: screenHeight * 0.0221,
                              child: Icon(Icons.menu, color: Color(0xFF4C2559),size: 30,),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.7908,
                          top: screenHeight * 0.051,
                          child: GestureDetector(
                            onTap: (){
                              //    Navigator.push(context, MaterialPageRoute(builder: (context)=>Drawerscreen()));
                            },
                            child: Container(
                              width: screenWidth * 0.0357,
                              height: screenHeight * 0.0197,
                              child: Icon(Icons.notifications_active_outlined, color: Color(0xFF4C2559),size: 28,),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.0357,
                  top: screenHeight * 0.136,
                  child: Text(
                    'You can use all these national helplines by calling them',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.015,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.0357,
                  top: screenHeight * 0.1093,
                  child: Text(
                    'Common Helpline numbers',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.0204,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  top: screenHeight * 0.0947,
                  child: Container(
                    width: screenWidth,
                    height: screenHeight * 0.0733,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: screenWidth,
                            height: screenHeight * 0.0733,
                            decoration: ShapeDecoration(
                              gradient: LinearGradient(
                                begin: Alignment(0.00, -1.00),
                                end: Alignment(0, 2),
                                colors: [Color(0x00F7E2FF), Colors.purple.shade50],
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(screenHeight * 0.0148),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: helplines.map((helpline) => GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>EmergencyHelplineScreen()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: screenWidth * 0.0452, right: screenWidth * 0.0452, top: screenHeight * 0.1929),
                      padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                      width: screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(screenWidth * 0.0361),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8,right: 8),
                            child: Container(
                                height: screenHeight * 0.0505, width: screenWidth * 0.1012,
                                child: Image(image: AssetImage(helpline.imagePath))),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                helpline.title,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: screenHeight * 0.020,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                helpline.description,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenHeight * 0.015,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: screenWidth * 0.05),
                          Container(
                              height: screenHeight * 0.0256, width: screenWidth * 0.0256,
                              child: GestureDetector(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                  },
                                  child: Image(image: AssetImage(helpline.image)))),
                        ],
                      ),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),

        ],
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
              child: Icon(CupertinoIcons.location_solid,color: Color(0xFF4C2559),),
            ),
            label: 'Track me',
          ),
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPassword()));
              },
              child: Icon(CupertinoIcons.volume_up,color: Color(0xFF4C2559)),
            ),
            label: 'Recordings',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: screenWidth * 0.1147,
              height: screenHeight * 0.0657,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.red, // Change color as needed
              ),
              child: Image(image: AssetImage("assets/sos_4617104.png")),
            ),
            label: 'SOS',
          ),
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>EmergencyHelplineScreen()));
              },
              child: Icon(CupertinoIcons.phone_badge_plus,color: Color(0xFF4C2559)),
            ),
            //Icon(Icons.contact_phone, size: screenWidth * 0.0689, color: Color(0xFF4C2559)),
            label: 'Helplines',
          ),
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
              },
              child: Icon(CupertinoIcons.person,color: Color(0xFF4C2559)),
            ),
            //Icon(Icons.person, size: screenWidth * 0.0689, color: Color(0xFF4C2559)),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF4C2559),
        unselectedLabelStyle: TextStyle(color: Color(0xFF4C2559)),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
