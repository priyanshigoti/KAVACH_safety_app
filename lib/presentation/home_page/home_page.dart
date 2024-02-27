
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../National_helpline_screen/National_helpline_screen.dart';
import '../drawer_screen/drawer_screen.dart';
import '../helpline_call.dart';
import '../profile_screen/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

    return Scaffold(
      body: Column(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight * 0.80,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.white),
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: -1,
                  child: Container(
                    width: screenWidth,
                    height: 85,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          top: 83.5,
                          child: Container(
                            width: screenWidth,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  width: screenWidth * 0.0114,
                                  strokeAlign: BorderSide.strokeAlignCenter,
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
                            height: 64,
                            decoration: BoxDecoration(color: Colors.white),
                          ),
                        ),
                        Positioned(
                          left: 0,
                          top: 0,
                          child: Container(
                            width: screenWidth * 0.9184,
                            height: 64,
                            decoration: BoxDecoration(color: Color(0xFFFFFDFD)),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.2699,
                          top: screenHeight * 0.047,
                          child: SizedBox(
                            width: screenWidth * 0.1786,
                            height: screenHeight * 0.0300,
                            child: Text(
                              'Kavach',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF5C343E),
                                fontSize: screenWidth * 0.0580,
                                fontFamily: 'kalam',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.0756,
                          top: screenHeight * 0.015,
                          child: Container(
                            width: screenWidth * 0.2341,
                            height: screenWidth * 0.2222,
                            decoration: ShapeDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/log6.png"),
                                fit: BoxFit.fill,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(screenWidth * 0.4119),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.05,
                          top: screenHeight * 0.05,
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
                          left: screenWidth * 0.8911,
                          top: screenHeight * 0.05,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Drawerscreen()));
                            },
                            child: Container(
                              width: screenWidth * 0.0485,
                              height: screenHeight * 0.0221,
                              child: Icon(Icons.menu_sharp, color: Color(0xFF4C2559),size: 31,),
                            ),
                          ),
                        ),
                        Positioned(
                          left: screenWidth * 0.7908,
                          top: screenHeight * 0.0520,
                          child: Container(
                            width: screenWidth * 0.0357,
                            height: screenHeight * 0.0197,
                            child: Icon(Icons.notifications_active_outlined, color: Color(0xFF4C2559),size: 26,),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.0357,
                  top: screenHeight * 0.140,
                  child: Text(
                    'Share live location with your friends',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenHeight * 0.016,
                      fontFamily: 'Arial',
                      fontWeight: FontWeight.bold,
                      height: 0,
                    ),
                  ),
                ),
                Positioned(
                  left: screenWidth * 0.0357,
                  top: screenHeight * 0.1125,
                  child: Text(
                    'Track me',
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
                  top: screenHeight * 0.0999,
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
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HelplinePage()));
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Helpline()));
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
