import 'package:alchemist/alchemist.dart';
import 'package:fl_business_card/presentation/view/error/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ErrorView: Golden Tests', () {
    const tScreenSize = Size(750, 1334);

    goldenTest(
      'renders correctly',
      fileName: 'error_view',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name: 'base view',
            child: SizedBox(
              height: tScreenSize.height,
              width: tScreenSize.width,
              child: const ErrorView(),
            ),
          ),
        ],
      ),
    );
  });
}
