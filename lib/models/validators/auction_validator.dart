import 'package:dartz/dartz.dart';

import '../../ui/common/app_constants.dart';

abstract class AuctionValidator {
  static String? validatePrice(String? price) {
    if (price == null || price.isEmpty) {
      return 'Price value is required.';
    }
    final parsedPrice = double.tryParse(price.replaceAll(',', ''));
    if (parsedPrice == null) {
      return 'Starting price must be a number.';
    }
    if (parsedPrice < kdMinPrice) {
      return 'Starting price must be at least 1.';
    }

    return null;
  }

  static String? validateEndDate(Option<DateTime> endDate) {
    if (endDate.isNone()) {
      return 'End date is required.';
    }

    if (endDate
        .fold(() => DateTime.now(), (a) => a)
        .isBefore(DateTime.now().add(const Duration(minutes: 1)))) {
      return 'End date must be at least 1 minute in the future.';
    }

    return null;
  }
}
