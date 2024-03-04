import 'package:flutter/material.dart';

import '../models/settings_screen_model.dart';

class SettingsProvider with ChangeNotifier {
  List<SettingItem> settings = [
    SettingItem(title: "Terminate Account", iconData: Icons.account_circle),
    // Add more settings items as needed
  ];
}
