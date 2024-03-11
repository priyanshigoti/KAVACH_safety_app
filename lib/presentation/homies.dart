import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

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

  Future<void> sendLiveLocation(
      String phoneNumber, double latitude, double longitude) async {
    try {
      // Create the Google Maps URL with the latitude and longitude
      String url = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

      // Encode the URL
      String encodedUrl = Uri.encodeFull(url);

      // Construct the SMS message with the URL
      String message = 'I am sharing my live location with you: $encodedUrl';

      // Launch the default SMS application with the message
      await launch('sms:$phoneNumber?body=$message');

      print('Live location sent to $phoneNumber');
    } catch (e) {
      print('Error sending live location: $e');
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

  Future<void> sendLiveLocationToSelectedContacts() async {
    try {
      Position? position = await _getCurrentLocation();
      if (position != null) {
        String userId = AuthService().getCurrentUser()?.uid ?? '';
        if (userId.isNotEmpty) {
          DocumentSnapshot contactSnapshot =
          await contactCollection.doc(userId).get();

          if (contactSnapshot.exists) {
            List<Map<String, dynamic>> contacts =
            List<Map<String, dynamic>>.from(
                (contactSnapshot.data() as Map<String, dynamic>?)?["contacts"] ?? []);

            for (var contact in contacts) {
              String phoneNumber = contact['phoneNumber'];
              sendLiveLocation(phoneNumber, position.latitude, position.longitude);
            }
          }
        }
      }
    } catch (e) {
      print("Error sending live location to selected contacts: $e");
    }
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: _currentLocation,
          zoom: 15.0,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        markers: {
          Marker(
            markerId: MarkerId("current_location"),
            position: _currentLocation,
          ),
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onTrackMePressed,
        child: Icon(Icons.location_on),
      ),
    );
  }
}