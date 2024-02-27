

import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

import '../../core/app_export.dart';
import '../../core/utils/image_constant.dart';
import '../../theme/theme_helper.dart';
import '../../widgets/app_bar/appbar_leading_image.dart';
import '../../widgets/app_bar/appbar_subtitle.dart';
import '../../widgets/app_bar/appbar_subtitle_three.dart';
import '../../widgets/app_bar/custom_app_bar.dart';
import '../history_page/history_page.dart';
import '../history_three_page/history_three_page.dart';
import 'models/history_three_tab_container_model.dart';
import 'package:flutter/material.dart';
import 'provider/history_three_tab_container_provider.dart';

class HistoryThreeTabContainerScreen extends StatefulWidget {
  const HistoryThreeTabContainerScreen({Key? key})
      : super(
          key: key,
        );

  @override
  HistoryThreeTabContainerScreenState createState() =>
      HistoryThreeTabContainerScreenState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryThreeTabContainerProvider(),
      child: HistoryThreeTabContainerScreen(),
    );
  }
}

class HistoryThreeTabContainerScreenState
    extends State<HistoryThreeTabContainerScreen>
    with TickerProviderStateMixin {
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 5.v),
              _buildTabview(context),
              SizedBox(
                height: 679.v,
                child: TabBarView(
                  controller: tabviewController,
                  children: [
                    HistoryPage.builder(context),
                    HistoryThreePage.builder(context),
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
      height: 71.v,
      leadingWidth: 40.h,
      leading: AppbarLeadingImage(
        imagePath: ImageConstant.imgLeftArrow11819409,
        margin: EdgeInsets.only(
          left: 17.h,
          top: 4.v,
          bottom: 29.v,
        ),
      ),
      centerTitle: true,
      title: Column(
        children: [
          AppbarSubtitle(
            text: "lbl_history".tr,
            margin: EdgeInsets.only(
              left: 64.h,
              right: 65.h,
            ),
          ),
          SizedBox(height: 13.v),
          AppbarSubtitleThree(
            text: "msg_my_friend_s_sos".tr,
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildTabview(BuildContext context) {
    return Container(
      height: 45.v,
      width: double.maxFinite,
      child: TabBar(
        controller: tabviewController,
        labelPadding: EdgeInsets.zero,
        labelColor: appTheme.gray70001,
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
              "lbl_my_history".tr,
            ),
          ),
          Tab(
            child: Text(
              "msg_friend_s_history".tr,
            ),
          ),
        ],
      ),
    );
  }
}
