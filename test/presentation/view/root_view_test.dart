import 'package:fl_business_card/presentation/view/root/root_view.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/pump_app_tester.dart';

void main() {
  group('RootView: Golden Tests', () {
    testWidgets('renders', (tester) async {
      await tester.pumpApp(const RootView());
    });
  });
}
