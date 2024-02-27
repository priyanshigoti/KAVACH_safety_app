
import 'package:kavach_project/core/utils/size_utils.dart';

import '../../../core/utils/image_constant.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_text_style.dart';
import '../../../widgets/custom_image_view.dart';
import '../models/userprofilelist_item_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UserprofilelistItemWidget extends StatelessWidget {
  UserprofilelistItemWidget(
    this.userprofilelistItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  UserprofilelistItemModel userprofilelistItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 13.v),
      decoration: AppDecoration.outlinePurple100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.img29671291,
            height: 136.v,
            width: 130.h,
            radius: BorderRadius.circular(
              16.h,
            ),
            margin: EdgeInsets.only(top: 1.v),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 1.v,
              bottom: 51.v,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userprofilelistItemModelObj.initialTimeText!,
                  style: CustomTextStyles.bodySmallGray5000312,
                ),
                SizedBox(height: 1.v),
                Text(
                  userprofilelistItemModelObj.timeText!,
                  style: CustomTextStyles.bodySmall12,
                ),
                SizedBox(height: 22.v),
                Text(
                  userprofilelistItemModelObj.locationText!,
                  style: CustomTextStyles.bodySmallGray5000312,
                ),
                SizedBox(height: 3.v),
                Text(
                  userprofilelistItemModelObj.addressText!,
                  style: CustomTextStyles.bodySmall12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
