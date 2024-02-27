import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist1_item_widget] screen.
class Userprofilelist1ItemModel {
  Userprofilelist1ItemModel({
    this.userName,
    this.userDate,
    this.durationText,
    this.id,
  }) {
    userName = userName ?? "Jordan";
    userDate = userDate ?? "18/12/2023";
    durationText = durationText ?? "Lasted for 11 minutes";
    id = id ?? "";
  }

  String? userName;

  String? userDate;

  String? durationText;

  String? id;
}
