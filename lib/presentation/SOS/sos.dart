import 'dart:async';
import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:direct_sms/direct_sms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  Future<void> sendLiveLocationToSelectedContacts(BuildContext context) async {
    try {
      bool isSmsLimitExceeded = await _checkSmsLimitExceeded();
      if (isSmsLimitExceeded) {
        _showSmsLimitExceededAlert(context); // Show alert if limit exceeded
        return;
      }

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

            List<String> phoneNumbers = contacts
                .map((contact) => contact['phoneNumber'] as String)
                .toList();

            String message =
                'I am in trouble. Please help me. My current location is: https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

            await _sendSMSBatch(
                phoneNumbers, message, position.latitude, position.longitude);

            await _incrementSmsCount();
          }
        }
      }
    } catch (e) {
      print("Error sending live location to selected contacts: $e");
    }
  }

  Future<bool> _checkSmsLimitExceeded() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int smsCount = prefs.getInt('smsCount') ?? 0;
    return smsCount >= 7;
  }

  Future<void> _incrementSmsCount() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int smsCount = prefs.getInt('smsCount') ?? 0;
    smsCount++;
    await prefs.setInt('smsCount', smsCount);
  }

  void _showSmsLimitExceededAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('SMS Limit Exceeded'),
        content: Text('You have reached the maximum limit of 7 SMS for today.'),
        actions: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF4C2559),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
              ),
              minimumSize: Size(
                MediaQuery.of(context).size.width * 0.30,
                MediaQuery.of(context).size.height * 0.06,
              ),
            ),
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
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

  Future<void> _sendSMSBatch(List<String> phoneNumbers, String message, double latitude, double longitude) async {
    try {
      final DirectSms directSms = DirectSms();
      for (final phoneNumber in phoneNumbers) {
        directSms.sendSms(phone: phoneNumber, message: message);
      }
      print('SMS sent to recipients: $phoneNumbers');
    } catch (e) {
      print('Error sending SMS batch: $e');
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Countdown Timer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CountdownPage(),
    );
  }
}

class CountdownPage extends StatefulWidget {
  @override
  _CountdownPageState createState() => _CountdownPageState();
}

class _CountdownPageState extends State<CountdownPage> {
  late Timer _timer;
  int _start = 3;
  bool _smsSent = false; // Track whether SMS has been sent

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          if (!_smsSent) {
            _smsSent = true; // Mark SMS as sent
            ContactManager().sendLiveLocationToSelectedContacts(context);
          }
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    _start.toString(),
                    style: TextStyle(fontSize: 48),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 55),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.white),
                    ),
                    minimumSize: Size(180, 60),
                  ),
                  onPressed: () {
                    _timer.cancel();
                    Navigator.pop(context);
                  },
                  child: Text('Cancel SOS'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown.shade800,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    minimumSize: Size(180, 60),
                  ),
                  onPressed: () {},
                  child: Text('Continue'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}