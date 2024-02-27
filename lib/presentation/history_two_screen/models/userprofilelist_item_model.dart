import '../../../core/app_export.dart';

/// This class is used in the [userprofilelist_item_widget] screen.
class UserprofilelistItemModel {
  UserprofilelistItemModel({
    this.initialTimeText,
    this.timeText,
    this.locationText,
    this.addressText,
    this.id,
  }) {
    initialTimeText = initialTimeText ?? "Initial time";
    timeText = timeText ?? "1:27 PM";
    locationText = locationText ?? "Location";
    addressText = addressText ?? "Xyz society, Surat, 394100.";
    id = id ?? "";
  }

  String? initialTimeText;

  String? timeText;

  String? locationText;

  String? addressText;

  String? id;
}
