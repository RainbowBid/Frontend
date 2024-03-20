import 'package:stacked/stacked.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';

class CreateAuctionViewModel extends FormViewModel {
  final _logger = getLogger('CreateAuctionViewModel');
  final _auctionService = locator<IAuctionService>();
}
