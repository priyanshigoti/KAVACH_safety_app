

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';
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
import 'models/profile_model.dart';
import 'provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();

  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileProvider(),
      child: ProfileScreen(),
    );
  }
}

class ProfileScreenState extends State<ProfileScreen> {
  late File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool _isUploading = true;

  @override
  void initState() {
    super.initState();
    _imageFile = Provider.of<ProfileProvider>(context, listen: false).imageFile;
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
   // final profileProvider = Provider.of<ProfileProvider>(context);
    _imageFile ??= Provider.of<ProfileProvider>(context).imageFile;
    return Scaffold(
      backgroundColor: appTheme.gray80002,
      appBar: _buildAppBar(context),
      body: Container(
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
                    top: 95,
                    bottom: 1,
                    right: 2,
                    child: IconButton(
                      onPressed: () {
                        _showImageSourceOptions(context);
                      },
                      icon: Icon(Icons.camera_alt,size: 30,),
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLeftArrow11819409,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 11.v,
          bottom: 11.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitleOne(
        text: "lbl_profile".tr,
      ),
    );
  }
}
