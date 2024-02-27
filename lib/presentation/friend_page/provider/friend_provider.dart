import 'package:flutter/material.dart';

import '../models/friend_model.dart';


/// A provider class for the FriendPage.
///
/// This provider manages the state of the FriendPage, including the
/// current friendModelObj
class FriendProvider extends ChangeNotifier {
  FriendModel friendModelObj = FriendModel();

  @override
  void dispose() {
    super.dispose();
  }
}
