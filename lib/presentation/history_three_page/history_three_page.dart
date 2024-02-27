
import 'package:kavach_project/core/utils/size_utils.dart';

import '../../core/app_export.dart';
import '../../theme/app_decoration.dart';
import '../history_three_page/widgets/userprofilelist1_item_widget.dart';
import 'models/history_three_model.dart';
import 'models/userprofilelist1_item_model.dart';
import 'package:flutter/material.dart';
import 'provider/history_three_provider.dart';

// ignore_for_file: must_be_immutable
class HistoryThreePage extends StatefulWidget {
  const HistoryThreePage({Key? key})
      : super(
          key: key,
        );

  @override
  HistoryThreePageState createState() => HistoryThreePageState();
  static Widget builder(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HistoryThreeProvider(),
      child: HistoryThreePage(),
    );
  }
}

class HistoryThreePageState extends State<HistoryThreePage>
    with AutomaticKeepAliveClientMixin<HistoryThreePage> {
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
              SizedBox(height: 14.v),
              _buildUserProfileList(context),
            ],
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildUserProfileList(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 17.h),
        child: Consumer<HistoryThreeProvider>(
          builder: (context, provider, child) {
            return ListView.separated(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (
                context,
                index,
              ) {
                return SizedBox(
                  height: 17.v,
                );
              },
              itemCount:
                  provider.historyThreeModelObj.userprofilelist1ItemList.length,
              itemBuilder: (context, index) {
                Userprofilelist1ItemModel model = provider
                    .historyThreeModelObj.userprofilelist1ItemList[index];
                return Userprofilelist1ItemWidget(
                  model,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
