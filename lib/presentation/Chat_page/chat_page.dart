// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
//
// class ReviewPage extends StatefulWidget {
//   @override
//   _ReviewPageState createState() => _ReviewPageState();
// }
//
// class _ReviewPageState extends State<ReviewPage> {
//   File? _image;
//   TextEditingController _placeNameController = TextEditingController();
//   TextEditingController _detailsController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//
//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   Future<void> _sendReview() async {
//     String placeName = _placeNameController.text.trim();
//     String details = _detailsController.text.trim();
//     String email = _emailController.text.trim();
//
//     if (placeName.isEmpty || details.isEmpty || email.isEmpty) {
//       _showErrorDialog('Please fill in all fields.');
//       return;
//     }
//
//     if (_image == null) {
//       _showErrorDialog('Please select an image.');
//       return;
//     }
//
//     try {
//       // Upload image to Firebase Storage
//       Reference ref = FirebaseStorage.instance
//           .ref()
//           .child('reviews')
//           .child(DateTime.now().millisecondsSinceEpoch.toString());
//       UploadTask uploadTask = ref.putFile(_image!);
//       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//       String imageUrl = await taskSnapshot.ref.getDownloadURL();
//
//       // Save review data along with image URL to Firestore
//       await FirebaseFirestore.instance.collection('reviews').add({
//         'placeName': placeName,
//         'details': details,
//         'email': email,
//         'imageUrl': imageUrl,
//         // Add more fields as needed
//       });
//
//       // Clearing the fields after sending the review
//       _placeNameController.clear();
//       _detailsController.clear();
//       _emailController.clear();
//       setState(() {
//         _image = null;
//       });
//
//       // Show success dialog
//       _showSuccessDialog('Review sent successfully.');
//     } catch (e) {
//       print('Error saving review: $e');
//       _showErrorDialog('An error occurred while sending the review.');
//     }
//   }
//
//   void _showSuccessDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Success'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Place Review'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showModalBottomSheet(
//               context: context,
//               builder: (BuildContext context) {
//                 return Container(
//                   padding: EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: [
//                       _image != null
//                           ? Image.file(
//                         _image!,
//                         height: 100,
//                       )
//                           : SizedBox.shrink(),
//                       SizedBox(height: 16.0),
//                       TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               borderSide: BorderSide.none,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                             hintText: "Email",
//                             hintStyle: TextStyle(fontSize:14),
//                             fillColor: Colors.grey.shade200,
//                             filled: true,
//                             prefixIcon: Icon(Icons.password),
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                       SizedBox(height: 16.0),
//                       TextFormField(
//                         controller: _placeNameController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               borderSide: BorderSide.none,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                             hintText: "Place name",
//                             hintStyle: TextStyle(fontSize:14),
//                             fillColor: Colors.grey.shade200,
//                             filled: true,
//                             prefixIcon: Icon(Icons.picture_as_pdf)
//                         ),
//                       ),
//                       SizedBox(height: 16.0),
//                       TextFormField(
//                         controller: _detailsController,
//                         decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               borderSide: BorderSide.none,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                             hintText: "Details",
//                             hintStyle: TextStyle(fontSize:14),
//                             fillColor: Colors.grey.shade200,
//                             filled: true,
//                             prefixIcon: Icon(Icons.password)
//                         ),
//                       ),
//                       SizedBox(height: 16.0),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           ElevatedButton.icon(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFF4C2559),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               ),
//                               minimumSize: Size(
//                                 MediaQuery.of(context).size.width * 0.40,
//                                 MediaQuery.of(context).size.height * 0.06,
//                               ),
//                             ),
//                             onPressed: _getImage,
//                             icon: Icon(Icons.photo),
//                             label: Text('Select image Gallery'),
//                           ),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFF4C2559),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               ),
//                               minimumSize: Size(
//                                 MediaQuery.of(context).size.width * 0.30,
//                                 MediaQuery.of(context).size.height * 0.06,
//                               ),
//                             ),
//                             onPressed: _sendReview,
//                             child: Text('Send'),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             );
//           },
//           child: Text('Place Review'),
//         ),
//       ),
//     );
//   }
// }
//
//
//
// class DetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reviews'),
//       ),
//       body: StreamBuilder(
//         stream: FirebaseFirestore.instance.collection('reviews').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//           if (!snapshot.hasData) {
//             return Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//           return ListView(
//             children: snapshot.data!.docs.map((document) {
//               return Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.grey.shade200,
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   height: 100,width: 300,
//                   child: Center(
//                     child: ListTile(
//                       title: Text(document['placeName']),
//                       subtitle: Text(document['details']),
//                       leading: ClipRRect(
//                         borderRadius: BorderRadius.circular(25),
//                           child: Image.network(document['imageUrl'])),
//                       // Add more fields as needed
//                     ),
//                   ),
//                 ),
//               );
//             }).toList(),
//           );
//         },
//       ),
//     );
//   }
// }


// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:intl/intl.dart';
//
// class ReviewPage extends StatefulWidget {
//   @override
//   _ReviewPageState createState() => _ReviewPageState();
// }
//
// class _ReviewPageState extends State<ReviewPage> {
//   File? _image;
//   TextEditingController _placeNameController = TextEditingController();
//   TextEditingController _detailsController = TextEditingController();
//   TextEditingController _emailController = TextEditingController();
//
//   Future<void> _getImage() async {
//     final picker = ImagePicker();
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   // Future<void> _sendReview() async {
//   //   String placeName = _placeNameController.text.trim();
//   //   String details = _detailsController.text.trim();
//   //   String email = _emailController.text.trim();
//   //
//   //   if (placeName.isEmpty || details.isEmpty || email.isEmpty) {
//   //     _showErrorDialog('Please fill in all fields.');
//   //     return;
//   //   }
//   //
//   //   if (_image == null) {
//   //     _showErrorDialog('Please select an image.');
//   //     return;
//   //   }
//   //
//   //   try {
//   //     // Get current user
//   //     User? user = FirebaseAuth.instance.currentUser;
//   //
//   //     if (user != null) {
//   //       String userId = user.uid; // Get user ID
//   //
//   //       // Upload image to Firebase Storage
//   //       Reference ref = FirebaseStorage.instance
//   //           .ref()
//   //           .child('reviews')
//   //           .child(userId)
//   //           .child(DateTime.now().millisecondsSinceEpoch.toString());
//   //       UploadTask uploadTask = ref.putFile(_image!);
//   //       TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//   //       String imageUrl = await taskSnapshot.ref.getDownloadURL();
//   //
//   //       // Save review data along with image URL to Firestore
//   //       await FirebaseFirestore.instance
//   //           .collection('reviews')
//   //           .doc(userId)
//   //           .collection('user_reviews')
//   //           .add({
//   //         'placeName': placeName,
//   //         'details': details,
//   //         'email': email,
//   //         'imageUrl': imageUrl,
//   //         // Add more fields as needed
//   //       });
//   //
//   //       // Clearing the fields after sending the review
//   //       _placeNameController.clear();
//   //       _detailsController.clear();
//   //       _emailController.clear();
//   //       setState(() {
//   //         _image = null;
//   //       });
//   //
//   //       // Show success dialog
//   //       _showSuccessDialog('Review sent successfully.');
//   //     } else {
//   //       throw 'User is not logged in.';
//   //     }
//   //   } catch (e) {
//   //     print('Error saving review: $e');
//   //     _showErrorDialog('An error occurred while sending the review.');
//   //   }
//   // }
//
//   Future<void> _sendReview() async {
//     String placeName = _placeNameController.text.trim();
//     String details = _detailsController.text.trim();
//     String email = _emailController.text.trim();
//
//     if (placeName.isEmpty || details.isEmpty || email.isEmpty) {
//       _showErrorDialog('Please fill in all fields.');
//       return;
//     }
//
//     if (_image == null) {
//       _showErrorDialog('Please select an image.');
//       return;
//     }
//
//     try {
//       // Get current user
//       User? user = FirebaseAuth.instance.currentUser;
//
//       if (user != null) {
//         String userId = user.uid; // Get user ID
//
//         // Upload image to Firebase Storage
//         Reference ref = FirebaseStorage.instance
//             .ref()
//             .child('reviews')
//             .child(userId)
//             .child(DateTime.now().millisecondsSinceEpoch.toString());
//         UploadTask uploadTask = ref.putFile(_image!);
//         TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
//         String imageUrl = await taskSnapshot.ref.getDownloadURL();
//
//         // Get current date and time
//         DateTime now = DateTime.now();
//         String formattedDate = DateFormat('yyyy-MM-dd').format(now);
//         String formattedTime = DateFormat('HH:mm:ss').format(now);
//
//         // Save review data along with image URL, date, and time to Firestore
//         await FirebaseFirestore.instance
//             .collection('reviews')
//             .doc(userId)
//             .collection('user_reviews')
//             .add({
//           'placeName': placeName,
//           'details': details,
//           'email': email,
//           'imageUrl': imageUrl,
//           'date': formattedDate, // Add formatted date
//           'time': formattedTime, // Add formatted time
//           // Add more fields as needed
//         });
//
//         // Clearing the fields after sending the review
//         _placeNameController.clear();
//         _detailsController.clear();
//         _emailController.clear();
//         setState(() {
//           _image = null;
//         });
//
//         // Show success dialog
//         _showSuccessDialog('Review sent successfully.');
//       } else {
//         throw 'User is not logged in.';
//       }
//     } catch (e) {
//       print('Error saving review: $e');
//       _showErrorDialog('An error occurred while sending the review.');
//     }
//   }
//
//
//   void _showSuccessDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Success'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Error'),
//           content: Text(message),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//               },
//               child: Text('OK'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Stack(
//           children: [
//             Container(
//               color: Color(0xFF4C2659),
//               width: double.infinity,
//               height: MediaQuery.of(context).size.height,
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.05,
//               left: 15,
//               right: 0,
//               child: Row(
//                 children: [
//                   Text(
//                     'Place rivews',
//                     style: TextStyle(
//                       fontSize: 21,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Spacer(),
//                   PopupMenuButton<String>(
//                     iconColor: Colors.white,
//                     onSelected: (String choice) {
//                       switch (choice) {
//                         case 'View reviews':
//                           Navigator.push(context, MaterialPageRoute(builder: (Builder) => DetailsPage()));
//                           break;
//                       }
//                     },
//                     itemBuilder: (BuildContext context) {
//                       return [
//                         PopupMenuItem<String>(
//                           value: 'View reviews',
//                           child: Text('View reviews'),
//                         ),
//                       ];
//                     },
//                   ),
//
//                 ],
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.11,
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.vertical,
//                 child: Padding(
//                   padding: const EdgeInsets.only(right: 14),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                         topLeft: Radius.circular(20),
//                         topRight: Radius.circular(20),
//                       ),
//                     ),
//                     width: MediaQuery.of(context).size.width,
//                     height: MediaQuery.of(context).size.height ,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Center(
//                             child: Container(
//                               height: 300,width: 300,
//                                 child: Image.asset("assets/places.png")),
//                           ),
//                           Text("This page gives the facility for providing the place reviews according your experience.You can add the reviews by pressing the Place review button you can also rating the place by rating it ",style: TextStyle(fontSize: 15),),
//                           SizedBox(height: 20,),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Color(0xFF4C2559),
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               ),
//                               minimumSize: Size(
//                                 MediaQuery.of(context).size.width *
//                                     0.30,
//                                 MediaQuery.of(context).size.height * 0.06,                              ),
//                             ),
//                             onPressed: () {
//                               showModalBottomSheet(
//                                 context: context,
//                                 builder: (BuildContext context) {
//                                   return Container(
//                                     padding: EdgeInsets.all(16.0),
//                                     child: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                                       children: [
//                                         _image != null
//                                             ? Image.file(
//                                           _image!,
//                                           height: 100,
//                                         )
//                                             :SizedBox(
//                                           height: 100,
//                                           child: Center(
//                                             child: CircularProgressIndicator(), // Loader added here
//                                           ),
//                                         ),
//                                         SizedBox(height: 16.0),
//                                         TextFormField(
//                                           controller: _emailController,
//                                           decoration: InputDecoration(
//                                             border: OutlineInputBorder(
//                                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                                               borderSide: BorderSide.none,
//                                             ),
//                                             contentPadding: EdgeInsets.symmetric(
//                                                 vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                                             hintText: "Email",
//                                             hintStyle: TextStyle(fontSize: 14),
//                                             fillColor: Colors.grey.shade200,
//                                             filled: true,
//                                             prefixIcon: Icon(Icons.email),
//                                           ),
//                                           keyboardType: TextInputType.emailAddress,
//                                         ),
//                                         SizedBox(height: 16.0),
//                                         TextFormField(
//                                           controller: _placeNameController,
//                                           decoration: InputDecoration(
//                                               border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                                                 borderSide: BorderSide.none,
//                                               ),
//                                               contentPadding: EdgeInsets.symmetric(
//                                                   vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                                               hintText: "Place name",
//                                               hintStyle: TextStyle(fontSize: 14),
//                                               fillColor: Colors.grey.shade200,
//                                               filled: true,
//                                               prefixIcon: Icon(Icons.place)),
//                                         ),
//                                         SizedBox(height: 16.0),
//                                         TextFormField(
//                                           controller: _detailsController,
//                                           decoration: InputDecoration(
//                                               border: OutlineInputBorder(
//                                                 borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                                                 borderSide: BorderSide.none,
//                                               ),
//                                               contentPadding: EdgeInsets.symmetric(
//                                                   vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                                               hintText: "Details",
//                                               hintStyle: TextStyle(fontSize: 14),
//                                               fillColor: Colors.grey.shade200,
//                                               filled: true,
//                                               prefixIcon: Icon(Icons.details)),
//                                         ),
//                                         SizedBox(height: 16.0),
//                                         Row(
//                                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                           children: [
//                                             ElevatedButton.icon(
//                                               style: ElevatedButton.styleFrom(
//                                                 backgroundColor: Color(0xFF4C2559),
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                                                 ),
//                                                 minimumSize: Size(
//                                                   MediaQuery.of(context).size.width * 0.40,
//                                                   MediaQuery.of(context).size.height * 0.06,
//                                                 ),
//                                               ),
//                                               onPressed: _getImage,
//                                               icon: Icon(Icons.photo),
//                                               label: Text('Select Image'),
//                                             ),
//                                             ElevatedButton(
//                                               style: ElevatedButton.styleFrom(
//                                                 backgroundColor: Color(0xFF4C2559),
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                                                 ),
//                                                 minimumSize: Size(
//                                                   MediaQuery.of(context).size.width *
//                                                       0.30,
//                                                   MediaQuery.of(context).size.height * 0.06,                              ),
//                                               ),
//                                               onPressed: _sendReview,
//                                               child: Text('Send'),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 },
//                               );
//                             },
//                             child: Text('Place Review'),
//                           ),
//                         ]
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class ReviewPage extends StatefulWidget {
  @override
  _ReviewPageState createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  File? _image;
  TextEditingController _placeNameController = TextEditingController();
  TextEditingController _detailsController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _selectedZone = 'Red'; // Default selected zone

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future<void> _sendReview() async {
    String placeName = _placeNameController.text.trim();
    String details = _detailsController.text.trim();
    String email = _emailController.text.trim();

    if (placeName.isEmpty || details.isEmpty || email.isEmpty) {
      _showErrorDialog('Please fill in all fields.');
      return;
    }

    if (_image == null) {
      _showErrorDialog('Please select an image.');
      return;
    }

    try {
      // Get current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userId = user.uid; // Get user ID

        // Upload image to Firebase Storage
        Reference ref = FirebaseStorage.instance
            .ref()
            .child('reviews')
            .child(userId)
            .child(DateTime.now().millisecondsSinceEpoch.toString());
        UploadTask uploadTask = ref.putFile(_image!);
        TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);
        String imageUrl = await taskSnapshot.ref.getDownloadURL();

        // Get current date and time
        DateTime now = DateTime.now();
        String formattedDate = DateFormat('yyyy-MM-dd').format(now);
        String formattedTime = DateFormat('HH:mm:ss').format(now);

        // Save review data along with image URL, date, time, and zone to Firestore
        await FirebaseFirestore.instance
            .collection('reviews')
            .doc(userId)
            .collection('user_reviews')
            .add({
          'placeName': placeName,
          'details': details,
          'email': email,
          'imageUrl': imageUrl,
          'date': formattedDate, // Add formatted date
          'time': formattedTime, // Add formatted time
          'zone': _selectedZone, // Add selected zone
          // Add more fields as needed
        });

        // Clearing the fields after sending the review
        _placeNameController.clear();
        _detailsController.clear();
        _emailController.clear();
        setState(() {
          _image = null;
          _selectedZone = 'Red'; // Reset selected zone to default
        });

        // Show success dialog
        _showSuccessDialog('Review sent successfully.');
      } else {
        throw 'User is not logged in.';
      }
    } catch (e) {
      print('Error saving review: $e');
      _showErrorDialog('An error occurred while sending the review.');
    }
  }

  void _showSuccessDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Error'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              color: Color(0xFF4C2659),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05,
              left: 15,
              right: 0,
              child: Row(
                children: [
                  Text(
                    'Place Reviews',
                    style: TextStyle(
                      fontSize: 21,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  PopupMenuButton<String>(
                    iconColor: Colors.white,
                    onSelected: (String choice) {
                      switch (choice) {
                        case 'View reviews':
                          Navigator.push(context, MaterialPageRoute(builder: (Builder) => DetailsPage()));
                          break;
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return [
                        PopupMenuItem<String>(
                          value: 'View reviews',
                          child: Text('View reviews'),
                        ),
                      ];
                    },
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
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Center(
                                child: Container(
                                  height: 300,
                                  width: 300,
                                  child: Image.asset("assets/places.png"),
                                ),
                              ),
                              Text(
                                "This page gives the facility for providing the place reviews according to your experience. You can add the reviews by pressing the Place Review button. You can also rate the place by rating it.",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(height: 20),
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
                                onPressed: () {
                                  showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setState) {
                                          return Container(
                                            padding: EdgeInsets.all(16.0),
                                            child: Column(                                         
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                _image != null
                                                    ? Image.file(
                                                  _image!,
                                                  height: 100,
                                                )
                                                    : SizedBox(
                                                  height: 100,
                                                  child: Center(
                                                    child: CircularProgressIndicator(), // Loader added here
                                                  ),
                                                ),
                                                SizedBox(height: 16.0),
                                                TextFormField(
                                                  controller: _emailController,
                                                  decoration: InputDecoration(
                                                    border: OutlineInputBorder(
                                                      borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                                                      borderSide: BorderSide.none,
                                                    ),
                                                    contentPadding: EdgeInsets.symmetric(
                                                        vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
                                                    hintText: "Email",
                                                    hintStyle: TextStyle(fontSize: 14),
                                                    fillColor: Colors.grey.shade200,
                                                    filled: true,
                                                    prefixIcon: Icon(Icons.email),
                                                  ),
                                                  keyboardType: TextInputType.emailAddress,
                                                ),
                                                SizedBox(height: 16.0),
                                                TextFormField(
                                                  controller: _placeNameController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                                                        borderSide: BorderSide.none,
                                                      ),
                                                      contentPadding: EdgeInsets.symmetric(
                                                          vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
                                                      hintText: "Place name",
                                                      hintStyle: TextStyle(fontSize: 14),
                                                      fillColor: Colors.grey.shade200,
                                                      filled: true,
                                                      prefixIcon: Icon(Icons.place)),
                                                ),
                                                SizedBox(height: 16.0),
                                                TextFormField(
                                                  controller: _detailsController,
                                                  decoration: InputDecoration(
                                                      border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                                                        borderSide: BorderSide.none,
                                                      ),
                                                      contentPadding: EdgeInsets.symmetric(
                                                          vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
                                                      hintText: "Details",
                                                      hintStyle: TextStyle(fontSize: 14),
                                                      fillColor: Colors.grey.shade200,
                                                      filled: true,
                                                      prefixIcon: Icon(Icons.details)),
                                                ),
                                                SizedBox(height: 16.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: 'Red',
                                                          groupValue: _selectedZone,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedZone = value.toString();
                                                            });
                                                          },
                                                          activeColor: Colors.red, // Change color for Red Zone
                                                        ),
                                                        Text('Red Zone'),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: 'Green',
                                                          groupValue: _selectedZone,
                                                          onChanged: (value) {
                                                            setState(() {
                                                              _selectedZone = value.toString();
                                                            });
                                                          },
                                                          activeColor: Colors.green, // Change color for Green Zone
                                                        ),
                                                        Text('Green Zone'),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 16.0),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    ElevatedButton.icon(
                                                      style: ElevatedButton.styleFrom(
                                                        backgroundColor: Color(0xFF4C2559),
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                                                        ),
                                                        minimumSize: Size(
                                                          MediaQuery.of(context).size.width * 0.40,
                                                          MediaQuery.of(context).size.height * 0.06,
                                                        ),
                                                      ),
                                                      onPressed: _getImage,
                                                      icon: Icon(Icons.photo),
                                                      label: Text('Select Image'),
                                                    ),
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
                                                      onPressed: _sendReview,
                                                      child: Text('Send'),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                    },
                                  );
                                },
                                child: Text('Place Review'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      // If user is not logged in, you may want to handle this case.
      // For example, you can navigate the user to the login screen.
      return Scaffold(
        body: Center(
          child: Text('User is not logged in.'),
        ),
      );
    }
    String userId = user.uid;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: [
            Container(
              color: Color(0xFF4C2659),
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.05, // Adjust position as needed
              left: 15,
              right: 0,
              child: Text(
                'My reviews',
                style: TextStyle(
                  fontSize: 21,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.11,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.only(right: 14),
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.90,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        StreamBuilder(
                          stream: FirebaseFirestore.instance
                              .collection('reviews')
                              .doc(userId)
                              .collection('user_reviews')
                              .snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                              return Center(
                                child: Text('No reviews found.'),
                              );
                            }
                            return ListView(
                              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                                Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                                String placeName = data['placeName'] ?? '';
                                String details = data['details'] ?? '';
                                String imageUrl = data['imageUrl'] ?? '';
                                String zone = data['zone'] ?? '';
                                String date = data['date'] ?? '';
                                String time = data['time'] ?? '';


                                return Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Card(
                                    child: ListTile(
                                      title: Text(placeName),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 4), // Add spacing between elements if needed
                                          Text(
                                            details,
                                            maxLines: 4, // Limiting to 2 lines
                                            overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
                                          ),
                                          SizedBox(height: 4),
                                          Text('Zone: $zone'),
                                          SizedBox(height: 4),
                                          Text('Date: $date'),
                                          Text('Time: $time'),
                                        ],
                                      ),
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(18),
                                        child: imageUrl.isNotEmpty
                                            ? SizedBox(
                                          width: 80, // Set fixed width for the image
                                          height: 150, // Set fixed height for the image
                                          child: Image.network(imageUrl, fit: BoxFit.cover),
                                        )
                                            : SizedBox.shrink(), // If imageUrl is empty, return SizedBox.shrink()
                                      ),
                                      // Add more fields as needed
                                    ),
                                  ),
                                );
                              }).toList(),
                            );
                          },
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
