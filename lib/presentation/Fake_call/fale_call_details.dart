
// import 'dart:io';
// import 'package:contacts_service/contacts_service.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class FakeCallDetails extends StatefulWidget {
//   const FakeCallDetails({Key? key}) : super(key: key);
//
//   @override
//   State<FakeCallDetails> createState() => _FakeCallDetailsState();
// }
//
// class _FakeCallDetailsState extends State<FakeCallDetails> {
//
//
//
//   Future<void> openContactBook() async {
//     // Show loader
//     showDialog(
//       context: context,
//       barrierDismissible: false, // Prevent dismissing the dialog
//       builder: (BuildContext context) {
//         return Dialog(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 20),
//                 Text('Loading contacts...'),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//
//     Iterable<Contact> contacts = await ContactsService.getContacts();
//     // Dismiss the loader dialog
//     Navigator.of(context).pop();
//
//     // Use the contacts list as per your requirement, e.g., display in a dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Contacts'),
//           content: Container(
//             width: double.maxFinite,
//             height: 300,
//             child: ListView.builder(
//               itemCount: contacts.length,
//               itemBuilder: (context, index) {
//                 Contact contact = contacts.elementAt(index);
//                 return ListTile(
//                   title: Text(contact.displayName ?? ''),
//                   subtitle: Text(contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? '' : ''),
//                   onTap: () {
//                     // When a contact is tapped, update the text fields
//                     _saveContactToPrefs(contact.displayName ?? '', contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? '' : '');
//                     Navigator.of(context).pop(); // Close the dialog
//                   },
//                 );
//               },
//             ),
//           ),
//           actions: <Widget>[
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color(0xFF4C2559),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                 ),
//               ),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Close', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//
//   File? _image;
//   String? _imagePath;
//   String? _selectedAvatarImagePath;
//   bool _loading = false;
//
//   final picker = ImagePicker();
//
//   @override
//   void initState() {
//     super.initState();
//     _loadImageFromPrefs();
//     _loadContactFromPrefs();
//
//   }
//
//   Future<void> getImageFromGallery() async {
//     setState(() {
//       _loading = true; // Show loader when selecting image
//     });
//     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//         _imagePath = pickedFile.path;
//         _selectedAvatarImagePath = null; // Clear the selected avatar path
//       });
//       await _saveImageToPrefs(pickedFile.path);
//     } else {
//       print('No image selected.');
//     }
//     setState(() {
//       _loading = false; // Hide loader after selecting image
//     });
//   }
//
//   Future<void> getImageFromCamera() async {
//     final pickedFile = await picker.pickImage(source: ImageSource.camera);
//
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//         _imagePath = pickedFile.path;
//         _selectedAvatarImagePath = null; // Clear the selected avatar path
//         _saveImageToPrefs(pickedFile.path);
//       });
//     } else {
//       print('No image selected.');
//     }
//   }
//
//   Future<void> _saveImageToPrefs(String imagePath) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('imagePath', imagePath);
//
//     setState(() {
//       if (imagePath.startsWith('assets')) {
//         _selectedAvatarImagePath = imagePath;
//         _imagePath = null;
//         _image = null;
//       } else {
//         _imagePath = imagePath;
//         _image = File(imagePath);
//         _selectedAvatarImagePath = null;
//       }
//     });
//   }
//
//   Future<void> _loadImageFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     final imagePath = prefs.getString('imagePath');
//     if (imagePath != null) {
//       setState(() {
//         if (imagePath.startsWith('assets')) {
//           _selectedAvatarImagePath = imagePath;
//           _imagePath = null;
//           _image = null;
//         } else {
//           _imagePath = imagePath;
//           _image = File(imagePath);
//           _selectedAvatarImagePath = null;
//         }
//       });
//     }
//   }
//
//   Future<void> _saveContactToPrefs(String name, String number) async {
//     final prefs = await SharedPreferences.getInstance();
//     prefs.setString('contactName', name);
//     prefs.setString('contactNumber', number);
//
//     setState(() {
//       _nameController.text = name;
//       _numberController.text = number;
//     });
//   }
//
//   Future<void> _loadContactFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//     final name = prefs.getString('contactName');
//     final number = prefs.getString('contactNumber');
//
//     if (name != null && number != null) {
//       setState(() {
//         _nameController.text = name;
//         _numberController.text = number;
//       });
//     }
//   }
//
//
//
//   TextEditingController _nameController = TextEditingController();
//   TextEditingController _numberController = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: double.infinity,
//         height: double.infinity,
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 30, top: 32),
//                 child: Container(
//                   child: Text(
//                     "Caller Details",
//                     style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
//                   ),
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 30),
//               child: Text("Specify time and caller details to schedule"),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 10),
//               child: Divider(
//                 thickness: 4.5,
//                 color: Colors.grey.shade200,
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 30, top: 10),
//               child: Text(
//                 "Set up caller image",
//                 style: TextStyle(fontSize: 18, color: Colors.black),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 30),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: <Widget>[
//                   GestureDetector(
//                     onTap: getImageFromGallery,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       height: 50,
//                       width: 50,
//                       child: Icon(Icons.photo_camera_back_outlined),
//                     ),
//                   ),
//                   SizedBox(width: 18),
//                   GestureDetector(
//                     onTap: getImageFromCamera,
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       height: 50,
//                       width: 50,
//                       child: Icon(Icons.camera_alt_outlined),
//                     ),
//                   ),
//                   SizedBox(width: 18),
//                   GestureDetector(
//                     onTap: () {
//                       showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return Dialog(
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(15.0),
//                             ),
//                             elevation: 0,
//                             backgroundColor: Colors.transparent,
//                             child: dialogContent(context),
//                           );
//                         },
//                       );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.grey.shade200,
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                       height: 50,
//                       width: 50,
//                       child: Icon(Icons.account_circle_outlined),
//                     ),
//                   ),
//                   SizedBox(width: 25),
//                   Container(
//                     height: 100,
//                     width: 100,
//                     decoration: BoxDecoration(
//                       color: Colors.grey.shade200,
//                       borderRadius: BorderRadius.circular(15),
//                     ),
//                     child: _selectedAvatarImagePath != null
//                         ? Image.asset(
//                       _selectedAvatarImagePath!,
//                       fit: BoxFit.cover,
//                     )
//                         : _imagePath != null
//                         ? Image.file(
//                       File(_imagePath!),
//                       fit: BoxFit.cover,
//                     )
//                         : null,
//                   ),
//
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 30, top: 25),
//               child: Text("Set up a fake caller",style: TextStyle(fontSize: 18,color: Colors.black),),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 27,right: 27,top: 15),
//               child: Column(
//                 children: [
//                   Row(
//                     children: [
//                       Expanded(
//                         child: TextFormField(
//                           style: TextStyle(color: Colors.black),
//                           controller: _nameController,
//                           cursorColor: Colors.black,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               borderSide: BorderSide.none,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                             hintText: "name",
//                             hintStyle: TextStyle(fontSize: 14),
//                             fillColor: Colors.grey.shade200,
//                             filled: true,
//                            // prefixIcon: Icon(Icons.email),
//                           ),
//                           keyboardType: TextInputType.emailAddress,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Expanded(
//                         child: TextFormField(
//                           style: TextStyle(color: Colors.black),
//                           controller: _numberController,
//                           cursorColor: Colors.black,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                               borderSide: BorderSide.none,
//                             ),
//                             contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
//                             hintText: "Number",
//                             focusColor: Colors.black,
//                             hintStyle: TextStyle(fontSize: 14),
//                             fillColor: Colors.grey.shade200,
//                             filled: true,
//                            // prefixIcon: Icon(Icons.email),
//                           ),
//                           keyboardType: TextInputType.number,
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       GestureDetector(
//                         onTap: openContactBook,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             color: Colors.grey.shade200
//                           ),
//                           height: 55,width: 55,
//                           child: Icon(Icons.local_library_outlined)),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 50,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Color(0xFF4C2559),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                           ),
//                           minimumSize: Size(
//                             MediaQuery.of(context).size.width * 0.40,
//                             MediaQuery.of(context).size.height * 0.06,
//                           ),
//                         ),
//                         onPressed: () {  },
//                         child: Text(
//                           "Fake Call",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 13,
//                           ),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//
//   Widget dialogContent(BuildContext context) {
//     List<String> avatars = ['BFF', 'Mom', 'Brother', 'Dada', 'Husband', 'Dad', 'Police', 'Sister', 'Dadi'];
//     int? selectedAvatarIndex;
//     bool loading = false;
//
//     return StatefulBuilder(
//       builder: (BuildContext context, StateSetter setState) {
//         return Container(
//           height: 430, // Increased height to accommodate the button
//           width: 350,
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(15),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 7),
//                 child: GridView.count(
//                   crossAxisCount: 3,
//                   shrinkWrap: true,
//                   children: List.generate(9, (index) {
//                     return GestureDetector(
//                       onTap: () async {
//                         setState(() {
//                           selectedAvatarIndex = index;
//                           loading = true; // Show loader
//                         });
//                         // Simulate some loading delay (you can remove this in your actual code)
//                         await Future.delayed(Duration(seconds: 1));
//                         setState(() {
//                           _selectedAvatarImagePath = 'assets/images/avatar_$index.png'; // Update the selected avatar image path
//                           loading = false; // Hide loader
//                         });
//                       },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             decoration: BoxDecoration(
//                               color: Colors.grey.shade200,
//                               shape: BoxShape.circle,
//                               border: selectedAvatarIndex == index
//                                   ? Border.all(color: Colors.green, width: 2.0) // Highlight selected avatar
//                                   : null,
//                             ),
//                             child: Padding(
//                               padding: const EdgeInsets.all(15.0),
//                               child: Image.asset(
//                                 'assets/images/avatar_$index.png',
//                                 width: 40,
//                                 height: 40,
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                           ),
//                           SizedBox(height: 4),
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 8),
//                             child: Text(
//                               avatars[index],
//                               textAlign: TextAlign.center,
//                               style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   }),
//                 ),
//               ),
//               // Show loader if loading is true
//                   ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF4C2559),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
//                   ),
//                   minimumSize: Size(
//                     MediaQuery.of(context).size.width * 0.40,
//                     MediaQuery.of(context).size.height * 0.06,
//                   ),
//                 ),
//                 onPressed: () async {
//                   if (selectedAvatarIndex != null) {
//                     // Save the selected avatar image using the index
//                     _saveImageToPrefs('assets/images/avatar_$selectedAvatarIndex.png');
//                     // Update the UI immediately
//                     setState(() {
//                       _selectedAvatarImagePath = 'assets/images/avatar_$selectedAvatarIndex.png';
//                       _imagePath = null;
//                       _image = null;
//                     });
//                     Navigator.of(context).pop(); // Close the dialog
//                   } else {
//                     // Show a message to the user to select an avatar
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text('Please select an avatar')),
//                     );
//                   }
//                 },
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//
// }





import 'dart:io';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'incoming.dart';


class FakeCallDetails extends StatefulWidget {
  const FakeCallDetails({Key? key}) : super(key: key);

  @override
  State<FakeCallDetails> createState() => _FakeCallDetailsState();
}

class _FakeCallDetailsState extends State<FakeCallDetails> {

  void initiateFakeCall(BuildContext context) {
    // Retrieve name and phone number from text fields
    String name = _nameController.text;
    String phoneNumber = _numberController.text;

    // Retrieve image path
    String imagePath;
    if (_selectedAvatarImagePath != null) {
      imagePath = _selectedAvatarImagePath!;
    } else if (_imagePath != null) {
      imagePath = _imagePath!;
    } else {
      // Handle the case where no image is selected
      return;
    }

    // Navigate to FakeCallScreen and pass the retrieved data as arguments
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FakeCallScreen(
          name: name,
          phoneNumber: phoneNumber,
          imagePath: imagePath,
          //iconPath: imagePath,
        ),
      ),
    );
  }



  Future<void> openContactBook() async {
    // Show loader
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing the dialog
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text('Loading contacts...'),
              ],
            ),
          ),
        );
      },
    );

    Iterable<Contact> contacts = await ContactsService.getContacts();
    // Dismiss the loader dialog
    Navigator.of(context).pop();

    // Use the contacts list as per your requirement, e.g., display in a dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Contacts'),
          content: Container(
            width: double.maxFinite,
            height: 300,
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                Contact contact = contacts.elementAt(index);
                return ListTile(
                  title: Text(contact.displayName ?? ''),
                  subtitle: Text(contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? '' : ''),
                  onTap: () {
                    // When a contact is tapped, update the text fields
                    _saveContactToPrefs(contact.displayName ?? '', contact.phones?.isNotEmpty == true ? contact.phones!.first.value ?? '' : '');
                    Navigator.of(context).pop(); // Close the dialog
                  },
                );
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF4C2559),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }


  File? _image;
  String? _imagePath;
  String? _selectedAvatarImagePath;
  bool _loading = false;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadImageFromPrefs();
  }

  Future<void> getImageFromGallery() async {
    setState(() {
      _loading = true; // Show loader when selecting image
    });
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imagePath = pickedFile.path;
        _selectedAvatarImagePath = null; // Clear the selected avatar path
      });
      await _saveImageToPrefs(pickedFile.path);
    } else {
      print('No image selected.');
    }
    setState(() {
      _loading = false; // Hide loader after selecting image
    });
  }

  Future<void> getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _imagePath = pickedFile.path;
        _selectedAvatarImagePath = null; // Clear the selected avatar path
        _saveImageToPrefs(pickedFile.path);
      });
    } else {
      print('No image selected.');
    }
  }

  Future<void> _saveContactToPrefs(String name, String number) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('contactName', name);
    prefs.setString('contactNumber', number);

    setState(() {
      _nameController.text = name;
      _numberController.text = number;
    });
  }

  Future<void> _loadContactFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final name = prefs.getString('contactName');
    final number = prefs.getString('contactNumber');

    if (name != null && number != null) {
      setState(() {
        _nameController.text = name;
        _numberController.text = number;
      });
    }
  }

  // Future<void> _saveImageToPrefs(String imagePath) async {
  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('imagePath', imagePath);
  // }
  //
  // Future<void> _loadImageFromPrefs() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final imagePath = prefs.getString('imagePath');
  //   if (imagePath != null) {
  //     if (imagePath.startsWith('assets')) {
  //       setState(() {
  //         _selectedAvatarImagePath = imagePath;
  //         _imagePath = null;
  //         _image = null;
  //       });
  //     } else {
  //       setState(() {
  //         _imagePath = imagePath;
  //         _image = File(imagePath);
  //         _selectedAvatarImagePath = null;
  //       });
  //     }
  //   }
  // }

  Future<void> _saveImageToPrefs(String imagePath) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('imagePath', imagePath);

    setState(() {
      if (imagePath.startsWith('assets')) {
        _selectedAvatarImagePath = imagePath;
        _imagePath = null;
        _image = null;
      } else {
        _imagePath = imagePath;
        _image = File(imagePath);
        _selectedAvatarImagePath = null;
      }
    });
  }

  // Future<void> _loadImageFromPrefs() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final imagePath = prefs.getString('imagePath');
  //   if (imagePath != null) {
  //     setState(() {
  //       if (imagePath.startsWith('assets')) {
  //         _selectedAvatarImagePath = imagePath;
  //         _imagePath = null;
  //         _image = null;
  //       } else {
  //         _imagePath = imagePath;
  //         _image = File(imagePath);
  //         _selectedAvatarImagePath = null;
  //       }
  //     });
  //   }
  // }
  //
  Future<void> _loadImageFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString('imagePath');
    if (imagePath != null) {
      setState(() {
        _imagePath = imagePath;
        // Check if the image path is from assets or file system
        if (_imagePath!.startsWith('assets')) {
          _selectedAvatarImagePath = _imagePath;
          _imagePath = null;
          _image = null;
        } else {
          _image = File(_imagePath!);
          _selectedAvatarImagePath = null;
        }
      });
    }
  }


  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 32),
                child: Container(
                  child: Text(
                    "Caller Details",
                    style: TextStyle(fontSize: 23, fontWeight: FontWeight.w800),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text("Specify time and caller details to schedule"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Divider(
                thickness: 4.5,
                color: Colors.grey.shade200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 10),
              child: Text(
                "Set up caller image",
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  GestureDetector(
                    onTap: getImageFromGallery,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      width: 50,
                      child: Icon(Icons.photo_camera_back_outlined),
                    ),
                  ),
                  SizedBox(width: 18),
                  GestureDetector(
                    onTap: getImageFromCamera,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      width: 50,
                      child: Icon(Icons.camera_alt_outlined),
                    ),
                  ),
                  SizedBox(width: 18),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            // child: dialogContent(context),
                          );
                        },
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        // color: Colors.grey.shade200,
                        // borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      width: 50,
                      // child: Icon(Icons.account_circle_outlined),
                    ),
                  ),
                  SizedBox(width: 25),
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: _selectedAvatarImagePath != null
                        ? Image.asset(
                      _selectedAvatarImagePath!,
                      fit: BoxFit.cover,
                    )
                        : _imagePath != null
                        ? Image.file(
                      File(_imagePath!),
                      fit: BoxFit.cover,
                    )
                        : null,
                  ),

                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 25),
              child: Text("Set up a fake caller",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 27,right: 27,top: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _nameController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
                            hintText: "name",
                            hintStyle: TextStyle(fontSize: 14),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            // prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: _numberController,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.020, horizontal: MediaQuery.of(context).size.width * 0.045),
                            hintText: "Number",
                            focusColor: Colors.black,
                            hintStyle: TextStyle(fontSize: 14),
                            fillColor: Colors.grey.shade200,
                            filled: true,
                            // prefixIcon: Icon(Icons.email),
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(width: 10),
                      GestureDetector(
                        onTap: openContactBook,
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.grey.shade200
                            ),
                            height: 55,width: 55,
                            child: Icon(Icons.local_library_outlined)),
                      ),
                    ],
                  ),
                  SizedBox(height: 50,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Color(0xFF4C2559),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                      //     ),
                      //     minimumSize: Size(
                      //       MediaQuery.of(context).size.width * 0.40,
                      //       MediaQuery.of(context).size.height * 0.06,
                      //     ),
                      //   ),
                      //   onPressed: () {  },
                      //   child: Text(
                      //     "Fake Call",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 13,
                      //     ),
                      //   ),
                      // ),
                      // ElevatedButton(
                      //   style: ElevatedButton.styleFrom(
                      //     backgroundColor: Color(0xFF4C2559),
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.04),
                      //     ),
                      //     minimumSize: Size(
                      //       MediaQuery.of(context).size.width * 0.40,
                      //       MediaQuery.of(context).size.height * 0.06,
                      //     ),
                      //   ),
                      //   onPressed: initiateFakeCall, // Call the function here
                      //   child: Text(
                      //     "Fake Call",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 13,
                      //     ),
                      //   ),
                      // ),
                      ElevatedButton(
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
                        onPressed: () {
                          // Call the function to initiate the fake call and pass context
                          initiateFakeCall(context);
                        },
                        child: Text(
                          "Fake Call",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ),

                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }




}