import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

import '../core/utils/image_constant.dart';
import '../widgets/app_bar/appbar_leading_image.dart';
import '../widgets/app_bar/appbar_subtitle_one.dart';
import '../widgets/app_bar/custom_app_bar.dart';

class UserListPage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("User_List",style: TextStyle(color: Colors.white),),centerTitle: true,backgroundColor: Color(0xFF4C2559),),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('user_list').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: Text('No users found.'),
              );
            }

            return ListView(
              padding: EdgeInsets.all(9.0),
              children: snapshot.data!.docs.map((document) {
                var userData = document.data() as Map<String, dynamic>;

                String email = userData['email'] ?? '';
                String phone = userData['phone'] ?? '';
                String firstname = userData['firstname'] ?? '';

                return Card(
                  margin: EdgeInsets.all(7),
                  elevation: 3.0,
                  child: ListTile(
                    title: Text(
                      'Email: $email',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('firstname: $firstname'),
                        Text('Phone: $phone'),
                      ],
                    ),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
  // PreferredSizeWidget _buildAppBar(BuildContext context) {
  //   return CustomAppBar(
  //     height: 45.v,
  //     leadingWidth: 40.h,
  //     leading: AppbarLeadingImage(
  //       imagePath: ImageConstant.imgLeftArrow11819409,
  //       margin: EdgeInsets.only(
  //         left: 17.h,
  //         top: 11.v,
  //         bottom: 11.v,
  //       ),
  //     ),
  //     centerTitle: true,
  //     title: AppbarSubtitleOne(
  //       text: "lbl_profile".tr,
  //     ),
  //   );
  // }
}
