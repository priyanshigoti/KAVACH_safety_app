//
//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kavach_project/presentation/drawer_screen/drawer_screen.dart';
//
// import '../National_helpline_screen/National_helpline_screen.dart';
// import '../profile_screen/profile_screen.dart';
//
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//   GoogleMapController? _controller;
//   LatLng _currentLocation = LatLng(0, 0);
//   Set<Marker> markers = {};
//
//   void initState() {
//     super.initState();
//     _determinePosition();
//     _getCurrentLocation();
//   }
//
//   Future<void> _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       setState(() {
//         _currentLocation = LatLng(position.latitude, position.longitude);
//       });
//       if (_controller != null) {
//         _controller!.animateCamera(CameraUpdate.newLatLng(_currentLocation));
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   Future<Position> _determinePosition() async {
//     bool serviceEnabled;
//     LocationPermission permission;
//
//     serviceEnabled = await Geolocator.isLocationServiceEnabled();
//
//     if (!serviceEnabled) {
//       return Future.error('Location services are disabled');
//     }
//
//     permission = await Geolocator.checkPermission();
//
//     if (permission == LocationPermission.denied) {
//       permission = await Geolocator.requestPermission();
//
//       if (permission == LocationPermission.denied) {
//         return Future.error("Location permission denied");
//       }
//     }
//
//     if (permission == LocationPermission.deniedForever) {
//       return Future.error('Location permissions are permanently denied');
//     }
//
//     Position position = await Geolocator.getCurrentPosition();
//
//     return position;
//   }
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Container(
//                       child: Image.asset(
//                         'assets/log6.png',
//                         fit: BoxFit.fill,
//                         alignment: Alignment.center,
//                         width: MediaQuery.of(context).size.width * 0.21,
//                         height: MediaQuery.of(context).size.width * 0.22,
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 155, top: 1),
//                       child: Text(
//                         "kavach",
//                         style: TextStyle(
//                           fontFamily: 'kalam',
//                           fontSize: MediaQuery.of(context).size.width * 0.063,
//                           color: Color(0xFF4C2559),
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ),
//                     Spacer(), // To push the menu button to the end
//                     IconButton(
//                       icon: Icon(Icons.menu,size: 30,),
//                       onPressed: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Drawerscreen()));
//                       },
//                     ),
//                   ],
//                 ),
//                 Divider(
//                   thickness: MediaQuery.of(context).size.width * 0.011,
//                   color: Colors.grey.shade100,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.00),
//                   child: Container(
//                     width: double.infinity,
//                     height: 55,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.only(
//                         bottomLeft: Radius.circular(10.0),
//                         bottomRight: Radius.circular(10.0),
//                       ),
//                       gradient: LinearGradient(
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter,
//                         colors: [Colors.white, Colors.purple.shade50],
//                       ),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           child: Container(
//                             child: Text(
//                               "Track Me",
//                               style: TextStyle(
//                                 fontSize: MediaQuery.of(context).size.width * 0.045,
//                                 fontWeight: FontWeight.w800,
//                                 color: Color(0xFF4C2559),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12),
//                           child: Text(
//                             "Share your live location with your SOS contact",
//                             style: TextStyle(
//                               fontSize: MediaQuery.of(context).size.width * 0.035,
//                               fontWeight: FontWeight.w800,
//                               color: Color(0xFF4C2559),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Stack(
//                   children: [
//                     Container(
//                       height: 584.5,
//                       // color: Colors.purple,
//                       child:  GoogleMap(
//                         initialCameraPosition: CameraPosition(
//                           target: _currentLocation, // Initial map center
//                           zoom: 15.0, // Initial map zoom level
//                         ),
//                         onMapCreated: (GoogleMapController controller) {
//                           _controller = controller;
//                         },
//                         myLocationEnabled: true,
//                         myLocationButtonEnabled: false,
//                         // Disable the default "My Location" button
//                         markers: _currentLocation == null
//                             ? {}
//                             : {
//                           Marker(
//                             markerId: MarkerId("current_location"),
//                             position: _currentLocation,
//                           ),
//                         },
//                       ),
//                     ),
//                   ]
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//               },
//               child: Icon(CupertinoIcons.location_solid,color: Color(0xFF4C2559),),
//             ),
//             label: 'Track me',
//           ),
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: () {
//                 //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HelplinePage()));
//               },
//               child: Icon(CupertinoIcons.volume_up,color: Color(0xFF4C2559)),
//             ),
//             label: 'Recordings',
//           ),
//           BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap: (){
//                 //Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSAlertScreen()));
//               },
//               child: Container(
//                 width: screenWidth * 0.1147,
//                 height: screenHeight * 0.0657,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.red, // Change color as needed
//                 ),
//                 child: Image(image: AssetImage("assets/sos_4617104.png")),
//               ),
//             ),
//             label: 'SOS',
//           ),
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>Helpline()));
//               },
//               child: Icon(CupertinoIcons.phone_badge_plus,color: Color(0xFF4C2559)),
//             ),
//             //Icon(Icons.contact_phone, size: screenWidth * 0.0689, color: Color(0xFF4C2559)),
//             label: 'Helplines',
//           ),
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
//               },
//               child: Icon(CupertinoIcons.person,color: Color(0xFF4C2559)),
//             ),
//             //Icon(Icons.person, size: screenWidth * 0.0689, color: Color(0xFF4C2559)),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xFF4C2559),
//         unselectedLabelStyle: TextStyle(color: Color(0xFF4C2559)),
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }
//
//
//
//


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kavach_project/presentation/drawer_screen/drawer_screen.dart';

import '../National_helpline_screen/National_helpline_screen.dart';
import '../profile_screen/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  GoogleMapController? _controller;
  LatLng _currentLocation = LatLng(0, 0);
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _determinePosition();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });
      if (_controller != null) {
        _controller!.animateCamera(CameraUpdate.newLatLng(_currentLocation));
      }
    } catch (e) {
      print(e);
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

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
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child:
          Padding(
            padding: EdgeInsets.only(top: screenHeight * 0.01),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Image.asset(
                        'assets/log6.png',
                        fit: BoxFit.fill,
                        alignment: Alignment.center,
                        width: screenWidth * 0.21,
                        height: screenWidth * 0.22,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: screenWidth * 0.297, top: 1),
                      child: Text(
                        "kavach",
                        style: TextStyle(
                          fontFamily: 'kalam',
                          fontSize: screenWidth * 0.063,
                          color: Color(0xFF4C2559),
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.menu, size: screenWidth * 0.083),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Drawerscreen()));
                      },
                    ),
                  ],
                ),
                Divider(
                  thickness: screenWidth * 0.011,
                  color: Colors.grey.shade100,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.00),
                  child: Container(
                    width: double.infinity,
                    height: screenHeight * 0.067,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.0),
                        bottomRight: Radius.circular(10.0),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.white, Colors.purple.shade50],
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046),
                          child: Container(
                            child: Text(
                              "Track Me",
                              style: TextStyle(
                                fontSize: screenWidth * 0.045,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF4C2559),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.046),
                          child: Text(
                            "Share your live location with your SOS contact",
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF4C2559),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: screenHeight * 0.707,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: _currentLocation,
                          zoom: 15.0,
                        ),
                        onMapCreated: (GoogleMapController controller) {
                          _controller = controller;
                        },
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        markers: _currentLocation == null
                            ? {}
                            : {
                          Marker(
                            markerId: MarkerId("current_location"),
                            position: _currentLocation,
                          ),
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      ),
      // floatingActionButton: Align(
      //   alignment: Alignment.bottomCenter,
      //   child: FloatingActionButton.extended(
      //     onPressed:_getCurrentLocation,
      //     // onPressed: () {
      //     //   Navigator.push(
      //     //       context, MaterialPageRoute(builder: (context) => HomePage()));
      //     // },
      //     tooltip: 'Track Me', label: Text("Track Me"),
      //
      //   ),
      // ),

      floatingActionButton: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.only(left:30),
          child: SizedBox(
            width: 120, // Adjust width as needed
            child: ElevatedButton(
              onPressed: _getCurrentLocation,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Color(0xFF4C2559), // Change color as needed
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  "Track Me",
                  style: TextStyle(
                    fontSize: 14, // Adjust font size as needed
                  ),
                ),
              ),
            ),
          ),
        ),
      ),


      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Icon(CupertinoIcons.location_solid, color: Color(0xFF4C2559)),
            ),
            label: 'Track me',
          ),
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                //  Navigator.push(context, MaterialPageRoute(builder: (context)=>HelplinePage()));
              },
              child: Icon(CupertinoIcons.volume_up, color: Color(0xFF4C2559)),
            ),
            label: 'Recordings',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSAlertScreen()));
              },
              child: Container(
                width: screenWidth * 0.1147,
                height: screenHeight * 0.0657,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Image(image: AssetImage("assets/sos_4617104.png")),
              ),
            ),
            label: 'SOS',
          ),
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Helpline()));
              },
              child: Icon(CupertinoIcons.phone_badge_plus, color: Color(0xFF4C2559)),
            ),
            label: 'Helplines',
          ),
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
              },
              child: Icon(CupertinoIcons.person, color: Color(0xFF4C2559)),
            ),
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

