

import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/custom_text_style.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../friend_page/friend_page.dart';
import 'models/friend_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'provider/friend_tab_container_provider.dart';

class FriendTabContainerScreen extends StatefulWidget {
  const FriendTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  FriendTabContainerScreenState createState() =>
      FriendTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FriendTabContainerProvider(),
      child: FriendTabContainerScreen(),
    );
  }
}

class FriendTabContainerScreenState extends State<FriendTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              Text(
                "msg_onboard_friends".tr,
                style: CustomTextStyles.bodySmallGray50003,
              ),
              SizedBox(height: 5.v),
              _buildTabview(context),
              SizedBox(
                height: 679.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    FriendPage.builder(context),
                    FriendPage.builder(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      height: 58.v,
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLeftArrow11819409,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 16.v,
          bottom: 16.v,
        ),
      ),
      centerTitle: true,
      title: AppbarSubtitle(
        text: "lbl_friends".tr,
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 44.v,
      width: double.maxFinite,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.gray70002,
        labelStyle: TextStyle(
          fontSize: 10.fSize,
          fontFamily: 'Arial',
          fontWeight: FontWeight.w400,
        ),
        unselectedLabelColor: appTheme.gray50003,
        unselectedLabelStyle: TextStyle(
          fontSize: 10.fSize,
          fontFamily: 'Arial',
          fontWeight: FontWeight.w400,
        ),
        indicatorColor: appTheme.gray70001,
        tabs: [
          Tab(
            child: Text(
              "lbl_my_friends".tr,
            ),
          ),
          Tab(
            child: Text(
              "lbl_requests".tr,
            ),
          ),
        ],
      ),
    );
  }
}
