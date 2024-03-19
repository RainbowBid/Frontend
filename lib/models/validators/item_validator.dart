import 'package:rainbowbid_frontend/ui/common/app_constants.dart';

abstract class ItemValidator {
  static String? validateBrief(String? brief) {
    if (brief == null || brief.isEmpty) {
      return 'Brief is required';
    }

    if (brief.length < kiMinItemBriefLength ||
        brief.length > kiMaxItemBriefLength) {
      return 'Brief must be between $kiMinItemBriefLength and $kiMaxItemBriefLength characters';
    }

    return null;
  }

  static String? validateDescription(String? description) {
    if (description == null || description.isEmpty) {
      return 'Description is required';
    }

    if (description.length < kiMinItemDescriptionLength ||
        description.length > kiMaxItemDescriptionLength) {
      return 'Description must be between $kiMinItemDescriptionLength and $kiMaxItemDescriptionLength characters';
    }

    return null;
  }
}
