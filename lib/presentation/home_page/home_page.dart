//
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kavach_project/presentation/Voice_detection/voice_detection.dart';
//
// import '../National_helpline_screen/National_helpline_screen.dart';
// import '../contactlist.dart';
// import '../drawer_screen/drawer_screen.dart';
// import '../profile_screen/profile_screen.dart';
//
// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//
//   Future<User?> signInAnonymously() async {
//     try {
//       UserCredential result = await _auth.signInAnonymously();
//       User? user = result.user;
//       return user;
//     } catch (e) {
//       print("Error signing in anonymously: $e");
//       return null;
//     }
//   }
//
//   User? getCurrentUser() {
//     return _auth.currentUser;
//   }
// }
//
// class ContactManager {
//   final CollectionReference contactCollection =
//   FirebaseFirestore.instance.collection('contacts');
//   final CollectionReference locationHistoryCollection =
//   FirebaseFirestore.instance.collection('locationHistory');
//
//   Future<void> sendLiveLocationToSelectedContacts() async {
//     try {
//       Position? position = await _getCurrentLocation();
//       if (position != null) {
//         String userId = AuthService().getCurrentUser()?.uid ?? '';
//         if (userId.isNotEmpty) {
//           // Store live location in location history collection
//           await locationHistoryCollection.add({
//             'userId': userId,
//             'latitude': position.latitude,
//             'longitude': position.longitude,
//             'timestamp': DateTime.now(),
//             // You can add more fields like place name here
//           });
//
//           // Rest of your code...
//           List<Map<String, dynamic>> contacts = [];
//           DocumentSnapshot contactSnapshot =
//           await contactCollection.doc(userId).get();
//           if (contactSnapshot.exists) {
//             Map<String, dynamic>? data =
//             contactSnapshot.data() as Map<String, dynamic>?;
//             if (data != null && data.containsKey("contacts")) {
//               contacts =
//               List<Map<String, dynamic>>.from(data["contacts"] ?? []);
//             }
//           }
//
//           // Extract phone numbers from contacts
//           List<String> phoneNumbers = contacts
//               .map((contact) => contact['phoneNumber'] as String)
//               .toList();
//
//           // Generate message with current location
//           String message =
//               'I am in trouble. Please help me. My current location is: https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';
//
//           // Send SMS to all selected contacts at once
//           _sendSMSBatch(phoneNumbers, message);
//         }
//       }
//     } catch (e) {
//       print("Error sending live location to selected contacts: $e");
//     }
//   }
//
//   Future<Position?> _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.high);
//       return position;
//     } catch (e) {
//       print("Error getting current location: $e");
//       return null;
//     }
//   }
//
//   Future<void> _sendSMSBatch(List<String> phoneNumbers, String message) async {
//     const MethodChannel _channel = MethodChannel('send_sms_channel');
//     try {
//       String recipientGroup = phoneNumbers.join(','); // Create the recipient group
//
//       await _channel.invokeMethod('sendSMS',
//           {"recipient": recipientGroup, "body": message}); // Send SMS to the recipient group
//       print('SMS sent to recipient group: $recipientGroup');
//     } catch (e) {
//       print('Error sending SMS batch: $e');
//     }
//   }
// }
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
//
//   @override
//   void initState() {
//     super.initState();
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
//   void _onTrackMePressed() {
//     ContactManager().sendLiveLocationToSelectedContacts();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       body: Container(
//         height: screenHeight,
//         width: screenWidth,
//         child: Padding(
//           padding: EdgeInsets.only(top: screenHeight * 0.01),
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     child: Image.asset(
//                       'assets/log6.png',
//                       fit: BoxFit.fill,
//                       alignment: Alignment.center,
//                       width: screenWidth * 0.21,
//                       height: screenWidth * 0.22,
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(
//                         right: screenWidth * 0.297, top: 1),
//                     child: Text(
//                       "kavach",
//                       style: TextStyle(
//                         fontFamily: 'kalam',
//                         fontSize: screenWidth * 0.063,
//                         color: Color(0xFF4C2559),
//                         fontWeight: FontWeight.w800,
//                       ),
//                     ),
//                   ),
//                   Spacer(),
//                   IconButton(
//                     icon: Icon(Icons.menu, size: screenWidth * 0.077),
//                     onPressed: () {
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Drawerscreen()));
//                     },
//                   ),
//                 ],
//               ),
//               Divider(
//                 thickness: screenWidth * 0.011,
//                 color: Colors.grey.shade100,
//               ),
//               Padding(
//                 padding:
//                 EdgeInsets.symmetric(vertical: screenHeight * 0.00),
//                 child: Container(
//                   width: double.infinity,
//                   height: screenHeight * 0.067,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.only(
//                       bottomLeft: Radius.circular(10.0),
//                       bottomRight: Radius.circular(10.0),
//                     ),
//                     gradient: LinearGradient(
//                       begin: Alignment.topCenter,
//                       end: Alignment.bottomCenter,
//                       colors: [Colors.white, Colors.purple.shade50],
//                     ),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: screenWidth * 0.046),
//                         child: Container(
//                           child: Text(
//                             "Track Me",
//                             style: TextStyle(
//                               fontSize: screenWidth * 0.045,
//                               fontWeight: FontWeight.w800,
//                               color: Color(0xFF4C2559),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: screenWidth * 0.046),
//                         child: Text(
//                           "Share your live location with your SOS contact",
//                           style: TextStyle(
//                             fontSize: screenWidth * 0.035,
//                             fontWeight: FontWeight.w800,
//                             color: Color(0xFF4C2559),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Stack(
//                 children: [
//                   Container(
//                     height: screenHeight * 0.707,
//                     child: GoogleMap(
//                       initialCameraPosition: CameraPosition(
//                         target: _currentLocation,
//                         zoom: 15.0,
//                       ),
//                       onMapCreated: (GoogleMapController controller) {
//                         _controller = controller;
//                       },
//                       myLocationEnabled: true,
//                       myLocationButtonEnabled: false,
//                       markers: _currentLocation == null
//                           ? {}
//                           : {
//                         Marker(
//                           markerId: MarkerId("current_location"),
//                           position: _currentLocation,
//                         ),
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: Container(
//         alignment: Alignment.bottomLeft,
//         padding: EdgeInsets.only(bottom: 16.0),
//         child: Padding(
//           padding: const EdgeInsets.only(left: 30),
//           child: SizedBox(
//             width: 120, // Adjust width as needed
//             child: ElevatedButton(
//               onPressed: _onTrackMePressed,
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 backgroundColor: Color(0xFF4C2559), // Change color as needed
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10.0),
//                 child: Text(
//                   "Track Me",
//                   style: TextStyle(
//                     fontSize: 14, // Adjust font size as needed
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//
//       // Your bottom navigation bar
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: _getCurrentLocation,
//               child:
//               Icon(Icons.location_on_outlined, color: Color(0xFF4C2559)),
//             ),
//             label: 'Track me',
//           ),
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSPage()));
//               },
//               child: Icon(CupertinoIcons.mic, color: Color(0xFF4C2559)),
//             ),
//             label: 'voice',
//           ),
//           BottomNavigationBarItem(
//             icon: GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                     context, MaterialPageRoute(builder: (context) => ContactSearch()));
//               },
//               child: Container(
//                 width: screenWidth * 0.1147,
//                 height: screenHeight * 0.0657,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.red,
//                 ),
//                 child: Image(image: AssetImage("assets/sos_4617104.png")),
//               ),
//             ),
//             label: 'SOS',
//           ),
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => Helpline()));
//               },
//               child: Icon(Icons.history, color: Color(0xFF4C2559)),
//             ),
//             label: 'History',
//           ),
//           BottomNavigationBarItem(
//             icon: CupertinoButton(
//               onPressed: () {
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
//               },
//               child: Icon(CupertinoIcons.person, color: Color(0xFF4C2559)),
//             ),
//             label: 'Profile',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Color(0xFF4C2559),
//         unselectedLabelStyle: TextStyle(color: Color(0xFF4C2559)),
//         // onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//       ),
//       // ...
//     );
//   }
// }
//
// class HistoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Location History'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance
//             .collection('locationHistory')
//             .orderBy('timestamp', descending: true)
//             .snapshots(),
//         builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
//             return Center(child: Text('No location history found.'));
//           }
//           return ListView(
//             children: snapshot.data!.docs.map((DocumentSnapshot document) {
//               Map<String, dynamic> data =
//               document.data() as Map<String, dynamic>;
//               // Display each location history item
//               return ListTile(
//                 title: Text(
//                     'Latitude: ${data['latitude']}, Longitude: ${data['longitude']}'),
//                 subtitle: Text('Time: ${data['timestamp']}'),
//                 // You can display more details like place name here
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: HomePage(),
//   ));
// }



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:direct_sms/direct_sms.dart';
import 'package:kavach_project/presentation/Voice_detection/voice_detection.dart';

import '../National_helpline_screen/National_helpline_screen.dart';
import '../contactlist.dart';
import '../drawer_screen/drawer_screen.dart';
import '../profile_screen/profile_screen.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signInAnonymously() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return user;
    } catch (e) {
      print("Error signing in anonymously: $e");
      return null;
    }
  }

  User? getCurrentUser() {
    return _auth.currentUser;
  }
}

class ContactManager {
  final CollectionReference contactCollection =
  FirebaseFirestore.instance.collection('contacts');

  Future<void> sendLiveLocationToSelectedContacts() async {
    try {
      Position? position = await _getCurrentLocation();
      if (position != null) {
        String userId = AuthService().getCurrentUser()?.uid ?? '';
        if (userId.isNotEmpty) {
          DocumentSnapshot contactSnapshot =
          await contactCollection.doc(userId).get();

          if (contactSnapshot.exists) {
            List<Map<String, dynamic>> contacts = [];
            if (contactSnapshot.exists) {
              Map<String, dynamic>? data =
              contactSnapshot.data() as Map<String, dynamic>?;
              if (data != null && data.containsKey("contacts")) {
                contacts = List<Map<String, dynamic>>.from(data["contacts"] ?? []);
              }
            }

            // Extract phone numbers from contacts
            List<String> phoneNumbers = contacts.map((contact) => contact['phoneNumber'] as String).toList();

            // Generate message with current location
            String message =
                'I am in trouble. Please help me. My current location is: https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

            // Send SMS to all selected contacts at once
            _sendSMSBatch(phoneNumbers, message);
          }
        }
      }
    } catch (e) {
      print("Error sending live location to selected contacts: $e");
    }
  }

  Future<Position?> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      return position;
    } catch (e) {
      print("Error getting current location: $e");
      return null;
    }
  }

  Future<void> _sendSMSBatch(List<String> phoneNumbers, String message) async {
    try {
      final DirectSms directSms = DirectSms();
      for (final phoneNumber in phoneNumbers) {
        directSms.sendSms(phone: phoneNumber, message: message, );
      }
      print('SMS sent to recipients: $phoneNumbers');
    } catch (e) {
      print('Error sending SMS batch: $e');
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  GoogleMapController? _controller;
  LatLng _currentLocation = LatLng(0, 0);

  @override
  void initState() {
    super.initState();
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

  void _onTrackMePressed() {
    ContactManager().sendLiveLocationToSelectedContacts();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        child: Padding(
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
                    padding: EdgeInsets.only(
                        right: screenWidth * 0.297, top: 1),
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
                    icon: Icon(Icons.menu, size: screenWidth * 0.077),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Drawerscreen()));
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
                        padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.046),
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
                        padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.046),
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
      floatingActionButton: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.only(bottom: 16.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: SizedBox(
            width: 120, // Adjust width as needed
            child: ElevatedButton(
              onPressed: _onTrackMePressed,
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

      // Your bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: _getCurrentLocation,
              child: Icon(Icons.location_on_outlined, color: Color(0xFF4C2559)),
            ),
            label: 'Track me',
          ),
          BottomNavigationBarItem(
            icon: CupertinoButton(
              onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SOSPage()));
              },
              child: Icon(CupertinoIcons.mic, color: Color(0xFF4C2559)),
            ),
            label: 'Voice',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => ContactSearch()));
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
            label: 'Helpline',
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
        // onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}