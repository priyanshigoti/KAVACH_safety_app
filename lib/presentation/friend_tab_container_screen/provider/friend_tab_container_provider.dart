import 'package:flutter/material.dart';

import '../models/friend_tab_container_model.dart';

/// A provider class for the FriendTabContainerScreen.
///
/// This provider manages the state of the FriendTabContainerScreen, including the
/// current friendTabContainerModelObj
class FriendTabContainerProvider extends ChangeNotifier {
  FriendTabContainerModel friendTabContainerModelObj =
      FriendTabContainerModel();

  @override
  void dispose() {
    super.dispose();
  }
}
