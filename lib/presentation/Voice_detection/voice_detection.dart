


import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:direct_sms/direct_sms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kavach_project/presentation/SOS/sos.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
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

// class ContactManager {
//   final CollectionReference contactCollection =
//   FirebaseFirestore.instance.collection('contacts');
//   final CollectionReference smsCollection =
//   FirebaseFirestore.instance.collection('sms_history');
//
//   Future<void> sendLiveLocationToSelectedContacts(BuildContext context) async {
//     try {
//       bool isSmsLimitExceeded = await _checkSmsLimitExceeded();
//       if (isSmsLimitExceeded) {
//         _showSmsLimitExceededAlert(context); // Show alert if limit exceeded
//         return;
//       }
//
//       Position? position = await _getCurrentLocation();
//       if (position != null) {
//         String userId = AuthService().getCurrentUser()?.uid ?? '';
//         if (userId.isNotEmpty) {
//           DocumentSnapshot contactSnapshot =
//           await contactCollection.doc(userId).get();
//
//           if (contactSnapshot.exists) {
//             List<Map<String, dynamic>> contacts = [];
//             if (contactSnapshot.exists) {
//               Map<String, dynamic>? data =
//               contactSnapshot.data() as Map<String, dynamic>?;
//               if (data != null && data.containsKey("contacts")) {
//                 contacts = List<Map<String, dynamic>>.from(data["contacts"] ?? []);
//               }
//             }
//
//             List<String> phoneNumbers = contacts
//                 .map((contact) => contact['phoneNumber'] as String)
//                 .toList();
//
//             String message =
//                 'I am in trouble. Please help me. My current location is: https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';
//
//             await _sendSMSBatch(
//                 phoneNumbers, message, position.latitude, position.longitude);
//
//             await _incrementSmsCount();
//           }
//         }
//       }
//     } catch (e) {
//       print("Error sending live location to selected contacts: $e");
//     }
//   }
//
//   Future<bool> _checkSmsLimitExceeded() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId = AuthService().getCurrentUser()?.uid ?? '';
//     DateTime now = DateTime.now();
//
//     // Check if user preferences exist
//     if (!prefs.containsKey(userId)) {
//       // If user preferences don't exist, initialize with default values
//       prefs.setString(userId, jsonEncode({'smsCount': 0, 'lastSentDate': now.toString()}));
//     }
//
//     // Get user preferences
//     Map<String, dynamic> userData = jsonDecode(prefs.getString(userId) ?? '{}');
//     int smsCount = userData['smsCount'] ?? 0;
//     DateTime lastSentDate = DateTime.parse(userData['lastSentDate'] ?? now.toString());
//
//     // Check if it's a new day
//     if (now.year != lastSentDate.year || now.month != lastSentDate.month || now.day != lastSentDate.day) {
//       // Reset count if it's a new day
//       smsCount = 0;
//     }
//
//     return smsCount >= 7;
//   }
//
//   Future<void> _incrementSmsCount() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String userId = AuthService().getCurrentUser()?.uid ?? '';
//
//     // Get user preferences
//     Map<String, dynamic> userData = jsonDecode(prefs.getString(userId) ?? '{}');
//     int smsCount = userData['smsCount'] ?? 0;
//
//     // Increment count
//     smsCount = smsCount + 1;
//
//     // Update user preferences
//     userData['smsCount'] = smsCount;
//     userData['lastSentDate'] = DateTime.now().toString();
//     prefs.setString(userId, jsonEncode(userData));
//   }
//
//
//
//   void _showSmsLimitExceededAlert(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('SMS Limit Exceeded'),
//         content: Text('You have reached the maximum limit of 7 SMS for today.'),
//         actions: <Widget>[
//           ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFF4C2559),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//               ),
//               minimumSize: Size(
//                 MediaQuery.of(context).size.width * 0.30,
//                 MediaQuery.of(context).size.height * 0.06,
//               ),
//             ),
//             onPressed: () => Navigator.pop(context),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
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
//   Future<void> _sendSMSBatch(List<String> phoneNumbers, String message, double latitude, double longitude) async {
//     try {
//       final DirectSms directSms = DirectSms();
//       for (final phoneNumber in phoneNumbers) {
//         directSms.sendSms(phone: phoneNumber, message: message);
//       }
//       print('SMS sent to recipients: $phoneNumbers');
//
//       // Get current user ID
//       String userId = AuthService().getCurrentUser()?.uid ?? '';
//
//       if (userId.isNotEmpty) {
//         // Get current timestamp
//         DateTime currentTime = DateTime.now();
//
//         // Get place name from latitude and longitude
//         String placeName = await _getPlaceName(latitude, longitude);
//
//         // Store SMS details in Firestore within user's document
//         await FirebaseFirestore.instance.collection('users').doc(userId).collection('sms_history').add({
//           'message': message,
//           'sentTo': phoneNumbers,
//           'sentAt': Timestamp.fromDate(currentTime),
//           'location': GeoPoint(latitude, longitude),
//           'placeName': placeName,
//         });
//         print('SMS details stored in Firestore for user: $userId');
//       } else {
//         print('User ID is empty. Cannot store SMS details.');
//       }
//     } catch (e) {
//       print('Error sending SMS batch: $e');
//     }
//   }
//
//   Future<String> _getPlaceName(double latitude, double longitude) async {
//     try {
//       List<Placemark> placemarks =
//       await placemarkFromCoordinates(latitude, longitude);
//       Placemark place = placemarks[0];
//       // Extract the desired location information, such as locality, subLocality, or thoroughfare
//       String location = place.locality ?? '';
//       if (place.subLocality != null && place.subLocality!.isNotEmpty) {
//         location += ', ' + place.subLocality!;
//       }
//       if (place.thoroughfare != null && place.thoroughfare!.isNotEmpty) {
//         location += ', ' + place.thoroughfare!;
//       }
//       return location;
//     } catch (e) {
//       print('Error getting place name: $e');
//       return '';
//     }
//   }
// }

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOS Voice Detection',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SOSPage(),
    );
  }
}

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _text = 'Press the button and say the selected word';
  String _selectedWord = 'Help'; // Default selected word
  double _sensitivity = 1; // Default sensitivity value

  List<String> _words = ['Help','Shield', 'Rakshit', 'Dog', 'Now', 'Robin', 'Support', 'Saharo', 'Dove', 'Owl'];

  TextEditingController _wordController = TextEditingController(); // Controller for the TextField

  @override
  void initState() {
    super.initState();
    _selectedWord = 'Help'; // Set the default selected word to "Robin"
    _wordController.text = _selectedWord; // Update the text field
    _listen(); // Start listening for voice input
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF4C2659),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.9,
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.05,
            left: 15,
            right: 0,
            child: Row(
              children: [
                Text(
                  'Voice Detection',
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.11,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.only(right: 14),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.86 - 50,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Alarm key phrase",
                                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  "You need to select a phrase that will be used for voice alarm activation when a person is in danger.",
                                  style: TextStyle(fontSize: 14.5),
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10),
                          TextField(
                            enabled: true,
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            controller: _wordController,
                            readOnly: true,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                focusColor: Colors.black,
                                labelText: 'Selected Word',
                                labelStyle: TextStyle(color: Colors.black, fontSize: 18)),
                          ),
                          SizedBox(height: 35),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF4C2559),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                                ),
                                minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.45,
                                  MediaQuery.of(context).size.height * 0.06,
                                ),
                              ),
                              onPressed: _changeWord,
                              child: Text('Change Word'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Wrap(
                              children: [
                                Text(
                                  "Recognition Sensitivity",
                                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 22),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: Text(
                                    "Adjust this slider if you're experiencing false alarms or having trouble activating the alarm with the selected key phrase. Don't forget to test the key phrase after that.",
                                    style: TextStyle(fontSize: 14.5),
                                  ),
                                ),
                                Slider(
                                  value: _sensitivity,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _sensitivity = newValue;
                                    });
                                  },
                                  min: 0.0,
                                  max: 1.0,
                                  divisions: 10,
                                  label: _sensitivity.toString(),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: ElevatedButton(
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
        onPressed: _addWord,
        child: Text("Add Words",style: TextStyle(fontSize: 13),),
      ),
    );
  }

  void _listen() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Status: $status');
      },
      onError: (error) {
        print('Error: $error');
      },
    );
    if (available) {
      setState(() {
        _isListening = true;
        _text = 'Listening...';
      });
      _speech.listen(
        onResult: (result) {
          setState(() {
            _text = result.recognizedWords;
            if (_text.toLowerCase().contains(_selectedWord.toLowerCase())) {
              _triggerSOS(context);
            }
          });
        },
        listenFor: Duration(seconds: 59), // Adjust the duration as needed
        partialResults: true,
        cancelOnError: true,
        listenMode: stt.ListenMode.confirmation,
        onSoundLevelChange: (level) {
          // Adjust voice sensitivity based on the sound level
          if (level > _sensitivity) {
            // Voice detected, trigger action
            print('Voice detected with level: $level');
          }
        },
      );
    }
  }

  void _listenInBackground() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        print('Status: $status');
      },
      onError: (error) {
        print('Error: $error');
      },
    );

    if (available) {
      _speech.listen(
        onResult: (result) {
          setState(() {
            _text = result.recognizedWords;
            if (_text.toLowerCase().contains(_selectedWord.toLowerCase())) {
              _triggerSOS(context);
            }
          });
        },
        listenFor: Duration(hours: 1), // Listen for an hour
        partialResults: false, // Only final results needed in background
        cancelOnError: true,
        listenMode: stt.ListenMode.dictation,
        onSoundLevelChange: (level) {
          // Adjust voice sensitivity based on the sound level
          if (level > _sensitivity) {
            // Voice detected, trigger action
            print('Voice detected with level: $level');
          }
        },
      );
    }
  }


  // void _triggerSOS(BuildContext context) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('SOS Activated for $_selectedWord!'),
  //       duration: Duration(seconds: 3),
  //     ),
  //   );
  //   print('SOS Activated for $_selectedWord!');
  // }

  void _triggerSOS(BuildContext context) {
    // Define a threshold sound level below which SOS should not be activated
    double thresholdLevel = 0.1;
    // Adjust this value as needed

    // Check if the current sound level exceeds the threshold
    if (_sensitivity > thresholdLevel) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CountdownPage()));
      print('SOS Activated for $_selectedWord!');
     // ContactManager().sendLiveLocationToSelectedContacts();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Volume too low. SOS not activated.'),
          duration: Duration(seconds: 3),
        ),
      );
      print('Volume too low. SOS not activated.');
    }
  }

  void _changeWord() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Change Selected Word'),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DropdownButton<String>(
                    value: _selectedWord,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedWord = newValue!;
                        _wordController.text = newValue;
                        _listen();
                      });
                      Navigator.of(context).pop();
                    },
                    items: _words.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF4C2559),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                          ),
                          minimumSize: Size(
                            MediaQuery.of(context).size.width * 0.05,
                            MediaQuery.of(context).size.height * 0.06,
                          ),
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Delete Word'),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: _words.map((word) {
                                      return ListTile(
                                        title: Text(word),
                                        onTap: () {
                                          setState(() {
                                            _words.remove(word);
                                            if (_selectedWord == word) {
                                              _selectedWord = _words.first;
                                              _wordController.text = _selectedWord;
                                            }
                                          });
                                          Navigator.of(context).pop();
                                          Navigator.of(context).pop();
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text('Delete'),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }


  void _addWord() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newWord = ''; // Variable to store the new word
        return AlertDialog(
          title: Text('Add New Word'),
          content: TextField(
            style: TextStyle(color: Colors.black),
            cursorColor: Colors.black,
            onChanged: (value) {
              newWord = value;
            },
            decoration: InputDecoration(
              hintText: 'Enter word',
              hintStyle: TextStyle(fontSize: 14, color: Colors.black),
              focusColor: Colors.black,
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C2559),
              ),
              child: Text('Add'),
              onPressed: () {
                if (newWord.isNotEmpty) {
                  setState(() {
                    _words.add(newWord); // Add the new word to the list
                  });
                  Navigator.of(context).pop();
                } else {
                  // Show error message if the word is empty
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please enter a word.'),
                        actions: <Widget>[
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

}