//
//
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:kavach_project/core/utils/size_utils.dart';
// import 'package:kavach_project/localization/app_localization.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../core/app_export.dart';
// import '../../core/utils/image_constant.dart';
// import '../../theme/app_decoration.dart';
// import '../../theme/custom_text_style.dart';
// import '../../theme/theme_helper.dart';
// import '../../widgets/app_bar/appbar_leading_image.dart';
// import '../../widgets/app_bar/appbar_subtitle_one.dart';
// import '../../widgets/app_bar/custom_app_bar.dart';
// import '../../widgets/custom_icon_button.dart';
// import '../../widgets/custom_image_view.dart';
// import 'models/profile_model.dart';
// import 'provider/profile_provider.dart';
//
// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({Key? key}) : super(key: key);
//
//   @override
//   ProfileScreenState createState() => ProfileScreenState();
//
//   static Widget builder(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => ProfileProvider(),
//       child: ProfileScreen(),
//     );
//   }
// }
//
// class ProfileScreenState extends State<ProfileScreen> {
//   late File? _imageFile;
//   final ImagePicker _picker = ImagePicker();
//   bool _isUploading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     _imageFile = Provider.of<ProfileProvider>(context, listen: false).imageFile;
//   }
//
//
//   Future<void> _pickImage(ImageSource source) async {
//     final pickedFile = await _picker.pickImage(source: source);
//
//     if (pickedFile != null) {
//       setState(() {
//         _isUploading = true;
//       });
//
//       await Future.delayed(Duration(milliseconds: 30));
//
//       setState(() {
//         _imageFile = File(pickedFile.path);
//         _isUploading = false;
//       });
//
//       Provider.of<ProfileProvider>(context, listen: false).setImageFile(_imageFile!);
//     } else {
//       print('No image selected.');
//     }
//   }
//
//
//   void _removeImage() {
//     setState(() {
//       _imageFile = null;
//     });
//     Provider.of<ProfileProvider>(context, listen: false).setImageFile(null);
//     Navigator.pop(context); // Close the modal bottom sheet
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//    // final profileProvider = Provider.of<ProfileProvider>(context);
//     _imageFile ??= Provider.of<ProfileProvider>(context).imageFile;
//     return Scaffold(
//       backgroundColor: appTheme.gray80002,
//       appBar: _buildAppBar(context),
//       body: Container(
//         width: double.maxFinite,
//         height: double.maxFinite,
//         margin: EdgeInsets.only(top: 4.v),
//         padding: EdgeInsets.symmetric(
//           horizontal: 23.h,
//           vertical: 19.v,
//         ),
//         decoration: AppDecoration.fillWhiteA70001.copyWith(
//           borderRadius: BorderRadiusStyle.customBorderTL25,
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             SizedBox(
//               height: 130.adaptSize,
//               width: 130.adaptSize,
//               child: Stack(
//                 alignment: Alignment.bottomRight,
//                 children: [
//                   _imageFile != null
//                       ? ClipRRect(
//                     borderRadius: BorderRadius.circular(65.h),
//                     child: Image.file(
//                       _imageFile!,
//                       width: 130.adaptSize,
//                       height: 130.adaptSize,
//                       fit: BoxFit.cover,
//                     ),
//                   )
//                       : Container(
//                     width: 130.adaptSize,
//                     height: 130.adaptSize,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       color: Colors.grey,
//                     ),
//                     child: Icon(
//                       Icons.person,
//                       size: 80,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Positioned(
//                     top: 95,
//                     bottom: 1,
//                     right: 2,
//                     child: IconButton(
//                       onPressed: () {
//                         _showImageSourceOptions(context);
//                       },
//                       icon: Icon(Icons.camera_alt,size: 30,),
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showImageSourceOptions(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               ListTile(
//                 leading: Icon(Icons.photo_library),
//                 title: Text('Choose from gallery'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.gallery);
//                 },
//               ),
//               ListTile(
//                 leading: Icon(Icons.camera_alt),
//                 title: Text('Take a photo'),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   _pickImage(ImageSource.camera);
//                 },
//               ),
//               if (_imageFile != null)
//                 ListTile(
//                   leading: Icon(Icons.delete),
//                   title: Text('Remove photo'),
//                   onTap: _removeImage,
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   /// Section Widget
//   PreferredSizeWidget _buildAppBar(BuildContext context) {
//     return CustomAppBar(
//       height: 45.v,
//       leadingWidth: 40.h,
//       leading: AppbarLeadingImage(
//         imagePath: ImageConstant.imgLeftArrow11819409,
//         margin: EdgeInsets.only(
//           left: 17.h,
//           top: 11.v,
//           bottom: 11.v,
//         ),
//       ),
//       centerTitle: true,
//       title: AppbarSubtitleOne(
//         text: "lbl_profile".tr,
//       ),
//     );
//   }
// }


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kavach_project/presentation/Sign_up_screen/Sign_up_screen.dart';

import '../sign_up_login_screen/sign_up_login_screen.dart';

class ProfilePage extends StatefulWidget {
  final User user;

  ProfilePage({required this.user});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth=FirebaseAuth.instance;
  User? user = FirebaseAuth.instance.currentUser;

  void _signOut() async {
    try{
      await _auth.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpLoginScreen()));
      print('User logged out successfully');
    }catch(e){
      print("Error logging out is: $e");
    }
  }

  void _deleteProfile() async {
    try {
      await _firestore.collection('users').doc(user!.uid).delete();
      await user!.delete();
      await FirebaseAuth.instance.signOut();
      Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
    } catch (e) {}
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.user);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Profile Page'),
      //   backgroundColor: Colors.lightGreen.shade800,
      //   actions: [
      //     IconButton(
      //       icon: Icon(Icons.exit_to_app),
      //       onPressed: () async {
      //         await FirebaseAuth.instance.signOut();
      //         Navigator.of(context).pop();
      //       },
      //     ),
      //   ],
      // ),
        appBar: AppBar(
          title: Text('Profile'),
          backgroundColor: Colors.lightGreen.shade800,
          actions: [
            PopupMenuButton<String>(
              onSelected: (String choice) {
                switch (choice) {
                  case 'Log-Out':
                    _signOut();
                    break;
                  case 'Edit profile':
                    // Navigator.push(
                    //   context,
                    //  // MaterialPageRoute(builder: (context) => ProfileEditScreen()),
                    // );
                    break;

                  case 'Delete profile':
                    _deleteProfile();
                    break;
                  case 'Login':
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpLoginScreen()),
                    );
                    break;
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    value: 'Log-Out',
                    child: Text('Log-out'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Edit profile',
                    child: Text('Edit profile'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Delete profile',
                    child: Text('Delete profile'),
                  ),
                  PopupMenuItem<String>(
                    value: 'Login',
                    child: Text('Login'),
                  ),
                ];
              },
            ),
          ],
        ),
        body: StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('user_list')
          .doc(widget.user.uid)
          .snapshots(),
      builder: (context, snapshot) {

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return Center(child: Text('User data not found'));
        }

        var userData = snapshot.data!.data() as Map<String, dynamic>;

        return Padding(
          padding: EdgeInsets.all(20.0),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                      height: 100,width: 100,
                      child: Image(image: AssetImage('Assets/users1.png'))),
                ),
              ),
              //  SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('First Name: ',style: TextStyle(fontSize: 14.5,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
                  Text('${userData['firstname']}'),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Email: ',style: TextStyle(fontSize: 14.5,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 40)),
                  Text('${userData['email']}'),
                ],
              ),
              Divider(color: Colors.black,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Phone: ',style: TextStyle(fontSize: 14.5,fontWeight: FontWeight.bold),),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 38)),
                  Text('${userData['phone']}'),
                ],
              ),
              Divider(color: Colors.black,),
              SizedBox(height: 50,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen.shade800,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                      padding: EdgeInsets.symmetric(horizontal: 10 * 5.0, vertical: 10),
                    ),
                    onPressed: () {
                    //  Navigator.push(context, MaterialPageRoute(builder: (context)=> ProfileEditScreen()));
                    },
                    child: Text('Edit',style: TextStyle(color: Colors.black),),
                  ),
                  SizedBox(width: 50,),
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       primary: Colors.lightGreen.shade800,
                  //       sh]ape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
                  //       padding: EdgeInsets.symmetric(horizontal: 8 * 5.0, vertical: 9),
                  //     ),
                  //      onPressed: (){
                  //       _deleteProfile();
                  //       Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
                  //      },
                  //     // onPressed: () {  },
                  //     child: Text('Delete',style: TextStyle(fontSize: 15,color: Colors.black),)),
                ],
              ),
            ],
          ),
        );
      },
    )
    );
  }
}
