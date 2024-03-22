import 'package:dartz/dartz.dart';

import '../../ui/common/app_constants.dart';

abstract class AuctionValidator {
  static String? validateStartingPrice(String? startingPrice) {
    if (startingPrice == null || startingPrice.isEmpty) {
      return 'Starting price is required.';
    }
    final price = double.tryParse(startingPrice.replaceAll(',', ''));
    if (price == null) {
      return 'Starting price must be a number.';
    }
    if (price < kdMinPrice) {
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
