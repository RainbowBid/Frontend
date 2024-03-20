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

  static String? validateStartingPrice(String? startingPrice){
    if (startingPrice == null || startingPrice.isEmpty) {
      return 'Starting Price is required.';
    }
    final price = double.tryParse(startingPrice);
    if (price != null){
      return 'Starting Price must be a number.';
    }
    if(price! < kdMinPrice){
      return 'Starting Price must be at least 1.';
    }

    return null;
  }

  static String? validateEndDate(String? startingPrice){
    //todo
    throw UnimplementedError();
    if (startingPrice == null || startingPrice.isEmpty) {
      return 'Starting Price is required.';
    }
    final price = double.tryParse(startingPrice);
    if (price != null){
      return 'Starting Price must be a number.';
    }
    if(price! < kdMinPrice){
      return 'Starting Price must be at least 1.';
    }

    return null;
  }


}
