


import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';
import 'package:kavach_project/presentation/Sign_up_screen/Sign_up_screen.dart';
import 'package:kavach_project/presentation/Sign_up_screen/models/Sign_up_model.dart';
import 'package:kavach_project/presentation/home_page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle_one.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_icon_button.dart';
import '../../widgets/custom_image_view.dart';
import '../sign_up_login_screen/sign_up_login_screen.dart';
import 'models/profile_model.dart';
import 'provider/profile_provider.dart';

// RegisterModel loggedInUser = RegisterModel();
class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({Key? key,required this.user}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      // child: ProfileScreen(user: user),
    );
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  // var userData = FirebaseFirestore.instance.collection('user_list');



  late File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = true;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser!;


  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();



  @override
  void initState() {

    super.initState();
    _fetchUserData();
    _loadImageFromPreferences();
    _imageFile = Provider.of<ProfileProvider>(context, listen: false).imageFile;

    // _nameController.text = userData['firstname'] ?? '';
    // _emailController.text = userData['email'] ?? '';
    // _phoneController.text = userData['phone'] ?? '';
  }


  Future<void> _loadImageFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? imagePath = prefs.getString('image_path');
    if (imagePath != null) {
      setState(() {
        _imageFile = File(imagePath);
      });
    }
  }

  Future<void> _saveImageToPreferences(File image) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('image_path', image.path);
  }



  Future<void> _fetchUserData() async {
    try {
      DocumentSnapshot userData = await FirebaseFirestore.instance
          .collection('all_users')
          .doc(widget.user.uid)
          .get();

      if (userData.exists) {
        Map<String, dynamic>? userDataMap = userData.data() as Map<String, dynamic>?;

        if (userDataMap != null) {
          setState(() {
            _nameController.text = userDataMap['firstname'] ?? '';
            _emailController.text = userDataMap['email'] ?? '';
            _phoneController.text = userDataMap['phone'] ?? '';

          });
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  // Future<void> _updateUserData(String name, String email, String phone) async {
  //   try {
  //     // Get the Firestore instance
  //     FirebaseFirestore firestore = FirebaseFirestore.instance;
  //
  //     // Update the document with the specified data
  //     await firestore.collection('all_users').doc(widget.user.uid).update({
  //       'firstname': name,
  //       'email': email,
  //       'phone': phone,
  //     });
  //
  //     // Display a success message or perform any other actions
  //     print('User data updated successfully');
  //     Navigator.pop(context);
  //   } catch (e) {
  //     // Handle errors
  //     print('Error updating user data: $e');
  //   }
  // }

  void _updateUserData(String name, String email, String phone) async {
    try {
      // Get the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Update the document with the specified data
      await firestore.collection('all_users').doc(widget.user.uid).update({
        'firstname': name,
        'email': email,
        'phone': phone,
      });

      // Display a success message or perform any other actions
      print('User data updated successfully');
      Navigator.pop(context);

      // Show alert for update success
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Update Successful'),
            content: Text('Your profile has been updated successfully.'),
            actions: [
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
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Handle errors
      print('Error updating user data: $e');
    }
  }



  void _signOut() async {
    try{
      await _auth.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpLoginScreen()));
      print('User logged out successfully');

    }catch(e){
      print("Error logging out is: $e");
    }
  }




  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _isUploading = true;
      });

      await Future.delayed(Duration(milliseconds: 30));

      setState(() {
        _imageFile = File(pickedFile.path);
        _isUploading = false;
      });
      _saveImageToPreferences(_imageFile!);
      Provider.of<ProfileProvider>(context, listen: false).setImageFile(_imageFile!);
    } else {
      print('No image selected.');
    }
  }


  void _removeImage() {
    setState(() {
      _imageFile = null;
    });
    Provider.of<ProfileProvider>(context, listen: false).setImageFile(null);
    Navigator.pop(context); // Close the modal bottom sheet
  }



  @override
  Widget build(BuildContext context) {
    _imageFile ??= Provider.of<ProfileProvider>(context).imageFile;
    return Scaffold(
      backgroundColor: appTheme.gray80002,
      appBar: _buildAppBar(context),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('all_users')
            .doc(widget.user.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || !snapshot.data!.exists) {
            return Center(child: Text('User data not found'));
          }

          var userData = snapshot.data!.data() as Map<String, dynamic>;

          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            margin: EdgeInsets.only(top: 4.v),
            padding: EdgeInsets.symmetric(
              horizontal: 23.h,
              vertical: 19.v,
            ),
            decoration: AppDecoration.fillWhiteA70001.copyWith(
              borderRadius: BorderRadiusStyle.customBorderTL25,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
  height: 130.adaptSize,
  width: 130.adaptSize,
  child: Stack(
    alignment: Alignment.bottomRight,
    children: [
      _imageFile != null
          ? ClipRRect(
        borderRadius: BorderRadius.circular(65.h),
        child: Image.file(
          _imageFile!,
          width: 130.adaptSize,
          height: 130.adaptSize,
          fit: BoxFit.cover,
        ),
      )
          : Container(
        width: 130.adaptSize,
        height: 130.adaptSize,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,
        ),
        child: Icon(
          Icons.person,
          size: 80,
          color: Colors.white,
        ),
      ),
      Positioned(
        top: 100,
        bottom: 1,
        right: 1,
        child: IconButton(
          onPressed: () {
            _showImageSourceOptions(context);
          },
          icon: Icon(Icons.camera_alt, size: 30,),
          color: Colors.black,
        ),
      ),
    ],
  ),
),
SizedBox(height: 15),
Divider(
  height: 20,
  color: Color(0xFF4C2559),
  thickness: 2,
),
Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
          "Basic Details",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4C2559)
          )
      ),
      IconButton(
        icon: Icon(
          Icons.edit, color: Colors.black, size: 25,),
        onPressed: () {
          // Display the dialog when the button is pressed
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 100.0),
                  child: AlertDialog(

                    title: Center(child: Text('Update Profile'),),
                    content: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            controller: _nameController,
                            decoration:
                            InputDecoration(
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.03),
                                  borderSide: BorderSide.none),
                                prefixIcon:
                                Icon(Icons
                                    .person),
                                hintText:
                                'Enter Name',
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            style: TextStyle(color: Colors.black),
                            cursorColor: Colors.black,
                            controller: _phoneController,
                            maxLength: 10,
                            decoration:
                            InputDecoration(
                              fillColor: Colors.grey.shade200,
                              filled: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.width * 0.03),
                                  borderSide: BorderSide.none),
                                prefixIcon:
                                Icon(Icons
                                    .phone),
                                hintText:
                                'Enter mobile no',
                          ),
                          ),
                        ),

                        SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            _updateUserData(_nameController.text, _emailController.text, _phoneController.text );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF4C2559),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius
                                  .circular(MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.04),
                            ),
                            minimumSize: Size(
                              MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.40,
                              MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.06,
                            ),
                          ),
                          child: Text(
                            "UPDATE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    ]
),
SizedBox(
  height: 10,
),

  Padding(
    padding: const EdgeInsets.all(4.0),
    child: Row(

      children: [
        Icon(Icons.person, size: 20,),
        SizedBox(width: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Name', style: TextStyle(
                        fontSize: 15, color: Colors.grey),),
                    Text('${userData['firstname']}', style: TextStyle(
                        fontSize: 15, color: Color(0xFF4C2559),fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ]
          ),

        )
      ],
    ),
  ),
SizedBox(
  height: 15,
),
Padding(
  padding: const EdgeInsets.all(4.0),
  child: Row(
    children: [
      Icon(Icons.email, size: 20,),
      SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email', style: TextStyle(
                      fontSize: 15, color: Colors.grey),),
                  Text('${userData['email']}', style: TextStyle(
                      fontSize: 15, color: Color(0xFF4C2559),fontWeight: FontWeight.bold),),
                ],
              ),
            ]
        ),
      )
    ],
  ),
),
SizedBox(
  height: 15,
),
Padding(
  padding: const EdgeInsets.all(4.0),
  child: Row(
    children: [
      Icon(Icons.phone, size: 20,),
      SizedBox(width: 10),
      Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Mobile No', style: TextStyle(
                      fontSize: 15, color: Colors.grey),),
                  Text('${userData['phone']}', style: TextStyle(
                      fontSize: 15, color: Color(0xFF4C2559),fontWeight: FontWeight.bold),),
                ],
              ),
            ]
        ),
      )
    ],
  ),
),
SizedBox(
  height: 15,
),
                  ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showImageSourceOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.photo_library),
                title: Text('Choose from gallery'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.gallery);
                },
              ),
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take a photo'),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickImage(ImageSource.camera);
                },
              ),
              if (_imageFile != null)
                ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Remove photo'),
                  onTap: _removeImage,
                ),
            ],
          ),
        );
      },
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 45.v,
      leadingWidth: 40.h,
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: LocalizationExtension("lbl_profile").tr,
      ),
      actions: [
        // IconButton(onPressed: (){
        //   //_showDeleteConfirmationDialog();
        //  // _showLogoutDialog();
        // }, icon: Icon(Icons.delete,color: appTheme.purple10002))
      ],
    );
  }







}






