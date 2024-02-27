import 'package:flutter/material.dart';

import '../models/history_two_model.dart';
import '../models/userprofilelist_item_model.dart';

/// A provider class for the HistoryTwoScreen.
///
/// This provider manages the state of the HistoryTwoScreen, including the
/// current historyTwoModelObj

// ignore_for_file: must_be_immutable
class HistoryTwoProvider extends ChangeNotifier {
  HistoryTwoModel historyTwoModelObj = HistoryTwoModel();

  @override
  void dispose() {
    super.dispose();
  }
}
