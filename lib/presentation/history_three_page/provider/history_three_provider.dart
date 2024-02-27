import 'package:flutter/material.dart';
import '../models/history_three_model.dart';
import '../models/userprofilelist1_item_model.dart';

/// A provider class for the HistoryThreePage.
///
/// This provider manages the state of the HistoryThreePage, including the
/// current historyThreeModelObj

// ignore_for_file: must_be_immutable
class HistoryThreeProvider extends ChangeNotifier {
  HistoryThreeModel historyThreeModelObj = HistoryThreeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
