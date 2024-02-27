import 'package:flutter/material.dart';

import '../models/history_three_tab_container_model.dart';


/// A provider class for the HistoryThreeTabContainerScreen.
///
/// This provider manages the state of the HistoryThreeTabContainerScreen, including the
/// current historyThreeTabContainerModelObj
class HistoryThreeTabContainerProvider extends ChangeNotifier {
  HistoryThreeTabContainerModel historyThreeTabContainerModelObj =
      HistoryThreeTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
