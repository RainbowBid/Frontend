import 'package:flutter_test/flutter_test.dart';
import 'package:rainbowbid_frontend/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('CreateItemViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
