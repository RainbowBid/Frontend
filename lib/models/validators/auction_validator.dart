import '../../ui/common/app_constants.dart';

abstract class AuctionValidator {

  static String? validateStartingPrice(String? startingPrice) {
    if (startingPrice == null || startingPrice.isEmpty) {
      return 'Starting price is required.';
    }
    final price = double.tryParse(startingPrice);
    if (price != null) {
      return 'Starting price must be a number.';
    }
    if (price! < kdMinPrice) {
      return 'Starting price must be at least 1.';
    }

    return null;
  }

  static String? validateEndDate(String? endDate) {
    if (endDate == null || endDate.isEmpty) {
      return 'End date is required.';
    }
    final endDateParsed = DateTime.tryParse(endDate);
    if (endDateParsed != null) {
      return 'End date must be a date time ( format yyyy-mm-dd hh:mm ).';
    }
    if (DateTime.now().isAfter(endDateParsed!)) {
      return 'End date can\'t be in the past.';
    }

    return null;
  }
}