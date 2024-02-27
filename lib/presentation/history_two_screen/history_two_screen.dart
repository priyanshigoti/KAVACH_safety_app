
import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../widgets/app_bar/appbar_title_image.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../../widgets/custom_image_view.dart';
import '../history_two_screen/widgets/userprofilelist_item_widget.dart';
import 'models/history_two_model.dart';
import 'models/userprofilelist_item_model.dart';
import 'package:flutter/material.dart';

import 'provider/history_two_provider.dart';

class HistoryTwoScreen extends StatefulWidget {
  const HistoryTwoScreen({Key? key})
      : super(
          key: key,
        );

  @override
  HistoryTwoScreenState createState() => HistoryTwoScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryTwoProvider(),
      child: HistoryTwoScreen(),
    );
  }
}

class HistoryTwoScreenState extends State<HistoryTwoScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 17.h,
            vertical: 14.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomImageView(
                    imagePath: ImageConstant.imgAvatar68342031,
                    height: 67.v,
                    width: 68.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.h,
                      top: 16.v,
                      bottom: 16.v,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 1.h),
                          child: Text(
                            "lbl_jordan".tr,
                            style: CustomTextStyles.bodyMedium14,
                          ),
                        ),
                        SizedBox(height: 4.v),
                        Text(
                          "lbl_91_1234567890".tr,
                          style: CustomTextStyles.bodySmallGray50003_1,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.v),
              _buildUserProfile(context),
              SizedBox(height: 14.v),
              _buildEventDetails(context),
              SizedBox(height: 15.v),
              _buildUserProfileList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 77.v,
      centerTitle: true,
      title: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 17.h,
              right: 152.h,
            ),
            child: Row(
              children: [
                AppbarTitleImage(
                  imagePath: ImageConstant.imgLeftArrow11819409,
                ),
                AppbarSubtitle(
                  text: "lbl_history".tr,
                  margin: EdgeInsets.only(
                    left: 112.h,
                    top: 3.v,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12.v),
          AppbarSubtitleThree(
            text: "msg_detailed_history".tr,
            margin: EdgeInsets.only(
              left: 97.h,
              right: 96.h,
            ),
          ),
          SizedBox(height: 8.v),
          SizedBox(
            width: double.maxFinite,
            child: Divider(
              color: appTheme.deepPurple10001,
            ),
          ),
        ],
      ),
      styleType: Style.bgFill_1,
    );
  }

  /// Section Widget
  Widget _buildUserProfile(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.h,
        vertical: 11.v,
      ),
      decoration: AppDecoration.outlinePurple100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgSos46171041,
            height: 29.adaptSize,
            width: 29.adaptSize,
            margin: EdgeInsets.only(
              left: 3.h,
              bottom: 2.v,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 12.h,
              top: 8.v,
              bottom: 8.v,
            ),
            child: Text(
              "lbl_triggered_on".tr,
              style: CustomTextStyles.bodySmall12,
            ),
          ),
          Spacer(),
          Container(
            width: 64.h,
            margin: EdgeInsets.only(bottom: 2.v),
            child: Text(
              "msg_18_12_2023_at_01_27".tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: CustomTextStyles.bodySmall12,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildEventDetails(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 16.v,
      ),
      decoration: AppDecoration.outlinePurple100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgWallClock709511,
            height: 21.adaptSize,
            width: 21.adaptSize,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 11.h,
              top: 4.v,
              bottom: 3.v,
            ),
            child: Text(
              "msg_event_lasted_for".tr,
              style: CustomTextStyles.bodySmallGray50003_1,
            ),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(bottom: 5.v),
            child: Text(
              "lbl_11_minutes".tr,
              style: CustomTextStyles.bodySmall12,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return Consumer<HistoryTwoProvider>(
      builder: (context, provider, child) {
        return ListView.separated(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          separatorBuilder: (
            context,
            index,
          ) {
            return SizedBox(
              height: 15.v,
            );
          },
          itemCount: provider.historyTwoModelObj.userprofilelistItemList.length,
          itemBuilder: (context, index) {
            UserprofilelistItemModel model =
                provider.historyTwoModelObj.userprofilelistItemList[index];
            return UserprofilelistItemWidget(
              model,
            );
          },
        );
      },
    );
  }
}
