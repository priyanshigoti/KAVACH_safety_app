

import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

import '../../core/app_export.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import 'models/friend_model.dart';
import 'package:flutter/material.dart';
import 'provider/friend_provider.dart';

// ignore_for_file: must_be_immutable
class FriendPage extends StatefulWidget {
  const FriendPage({Key? key})
      : super(
          key: key,
        );

  @override
  FriendPageState createState() => FriendPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FriendProvider(),
      child: FriendPage(),
    );
  }
}

class FriendPageState extends State<FriendPage>
    with AutomaticKeepAliveClientMixin<FriendPage> {
  @override
  bool get wantKeepAlive => true;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fillOnPrimaryContainer,
          child: Column(
            children: [
              SizedBox(height: 273.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 139.h,
                  right: 140.h,
                ),
                child: Text(
                  "msg_no_friends_found".tr,
                  style: CustomTextStyles.bodySmallGray50003_1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
