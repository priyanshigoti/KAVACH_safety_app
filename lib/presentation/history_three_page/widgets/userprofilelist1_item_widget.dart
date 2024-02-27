

import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

import '../../../core/utils/image_constant.dart';
import '../../../theme/app_decoration.dart';
import '../../../theme/custom_button_style.dart';
import '../../../theme/custom_text_style.dart';
import '../../../theme/theme_helper.dart';
import '../../../widgets/custom_image_view.dart';
import '../../../widgets/custom_outlined_button.dart';
import '../models/userprofilelist1_item_model.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class Userprofilelist1ItemWidget extends StatelessWidget {
  Userprofilelist1ItemWidget(
    this.userprofilelist1ItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  Userprofilelist1ItemModel userprofilelist1ItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.h,
        vertical: 8.v,
      ),
      decoration: AppDecoration.outlinePurple100.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder13,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 2.h),
            child: Row(
              children: [
                CustomImageView(
                  imagePath: ImageConstant.imgAvatar68342031,
                  height: 67.v,
                  width: 68.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.h,
                    top: 16.v,
                    bottom: 16.v,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userprofilelist1ItemModelObj.userName!,
                        style: CustomTextStyles.bodyMedium14,
                      ),
                      SizedBox(height: 3.v),
                      Text(
                        userprofilelist1ItemModelObj.userDate!,
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CustomImageView(
                  imagePath: ImageConstant.imgSos461710421,
                  height: 23.adaptSize,
                  width: 23.adaptSize,
                  margin: EdgeInsets.only(
                    top: 11.v,
                    bottom: 33.v,
                  ),
                ),
                CustomOutlinedButton(
                  height: 26.v,
                  width: 50.h,
                  text: "lbl_view".tr,
                  margin: EdgeInsets.only(
                    left: 16.h,
                    top: 33.v,
                    bottom: 8.v,
                  ),
                  buttonStyle: CustomButtonStyles.outlinePurple,
                  buttonTextStyle: theme.textTheme.bodySmall!,
                ),
              ],
            ),
          ),
          SizedBox(height: 9.v),
          Padding(
            padding: EdgeInsets.only(left: 7.h),
            child: Text(
              userprofilelist1ItemModelObj.durationText!,
              style: CustomTextStyles.bodySmallGray50003_1,
            ),
          ),
          SizedBox(height: 2.v),
        ],
      ),
    );
  }
}
