

import 'package:kavach_project/core/utils/size_utils.dart';
import 'package:kavach_project/localization/app_localization.dart';

import '../../core/app_export.dart';
import '../../theme/app_decoration.dart';
import '../../theme/custom_text_style.dart';
import 'models/history_model.dart';
import 'package:flutter/material.dart';
import 'provider/history_provider.dart';

// ignore_for_file: must_be_immutable
class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key})
      : super(
          key: key,
        );

  @override
  HistoryPageState createState() => HistoryPageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryProvider(),
      child: HistoryPage(),
    );
  }
}

class HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin<HistoryPage> {
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
              SizedBox(height: 272.v),
              Padding(
                padding: EdgeInsets.only(
                  left: 145.h,
                  right: 146.h,
                ),
                child: Text(
                  "lbl_no_data_found".tr,
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
