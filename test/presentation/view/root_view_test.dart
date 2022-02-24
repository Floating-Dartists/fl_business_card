import 'package:alchemist/alchemist.dart';
import 'package:fl_business_card/presentation/view/root/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../utils/localized_test_app.dart';

void main() {
  group('RootView: Golden Tests', () {
    const tScreenSize = Size(750, 1334);

    goldenTest(
      'renders correctly',
      fileName: 'root_view',
      widget: GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'base view',
            child: SizedBox(
              height: tScreenSize.height,
              width: tScreenSize.width,
              child: const LocalizedTestApp(child: RootView()),
            ),
          ),
        ],
      ),
    );
  });
}
