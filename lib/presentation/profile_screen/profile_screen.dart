

import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

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
import 'package:flutter/material.dart';
import 'provider/profile_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key})
      : super(
          key: key,
        );

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  CustomImageView(
                    imagePath: ImageConstant.imgWoman41400472,
                    height: 130.adaptSize,
                    width: 130.adaptSize,
                    radius: BorderRadius.circular(
                      65.h,
                    ),
                    alignment: Alignment.center,
                  ),
                  CustomIconButton(
                    height: 30.adaptSize,
                    width: 30.adaptSize,
                    padding: EdgeInsets.all(4.h),
                    decoration: IconButtonStyleHelper.outlineBlack,
                    alignment: Alignment.bottomRight,
                    child: CustomImageView(
                      imagePath: ImageConstant.imgCamera,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 38.v),
            _buildEightyTwo(context),
            SizedBox(height: 9.v),
            _buildEightyFour(context),
            SizedBox(height: 10.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "lbl_mobile_no".tr,
                style: theme.textTheme.labelLarge,
              ),
            ),
            SizedBox(height: 6.v),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "lbl_91_1234567890".tr,
                style: CustomTextStyles.labelLargePrimaryContainer,
              ),
            ),
            SizedBox(height: 8.v),
            _buildEightySix(context),
            SizedBox(height: 8.v),
            _buildAge(context),
            SizedBox(height: 6.v),
            _buildLocation(context),
            SizedBox(height: 5.v),
          ],
        ),
      ),
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

  /// Section Widget
  Widget _buildEightyTwo(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 4.h,
        right: 1.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Column(
              children: [
                Text(
                  "lbl_name".tr,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 6.v),
                Text(
                  "lbl_alice2".tr,
                  style: CustomTextStyles.labelLargePrimaryContainer,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: CustomIconButton(
              height: 33.adaptSize,
              width: 33.adaptSize,
              padding: EdgeInsets.all(5.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup21,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEightyFour(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 1.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 1.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_gender".tr,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 6.v),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "lbl_female".tr,
                    style: CustomTextStyles.labelLargePrimaryContainer,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: CustomIconButton(
              height: 33.adaptSize,
              width: 33.adaptSize,
              padding: EdgeInsets.all(5.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup21,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEightySix(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 1.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_email_id".tr,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 5.v),
                Text(
                  "msg_enter_your_email".tr,
                  style: CustomTextStyles.labelLargeGray5009b,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 4.v),
            child: CustomIconButton(
              height: 33.adaptSize,
              width: 33.adaptSize,
              padding: EdgeInsets.all(5.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup21,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildAge(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 1.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 3.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "lbl_age_group".tr,
                  style: theme.textTheme.labelLarge,
                ),
                SizedBox(height: 6.v),
                Text(
                  "msg_select_your_age".tr,
                  style: CustomTextStyles.labelLargeGray5009b,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.v),
            child: CustomIconButton(
              height: 33.adaptSize,
              width: 33.adaptSize,
              padding: EdgeInsets.all(5.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup21,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildLocation(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 2.h,
        right: 1.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 2.v),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 1.h),
                  child: Text(
                    "lbl_location".tr,
                    style: theme.textTheme.labelLarge,
                  ),
                ),
                SizedBox(height: 4.v),
                Text(
                  "msg_select_your_location".tr,
                  style: CustomTextStyles.labelLargeGray5009b,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 3.v),
            child: CustomIconButton(
              height: 33.adaptSize,
              width: 33.adaptSize,
              padding: EdgeInsets.all(5.h),
              child: CustomImageView(
                imagePath: ImageConstant.imgGroup21,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
