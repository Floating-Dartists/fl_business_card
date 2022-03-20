import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

extension PumpApp on WidgetTester {
  /// Call [pumpWidget] with the given [child] wrapped inside a [MaterialApp].
  Future<void> pumpApp(Widget child) {
    return pumpWidget(ProviderScope(child: MaterialApp(home: child)));
  }

  /// Call [pumpWidget] with the given [child] wrapped inside a [Localizations]
  /// widget using the given [locale].
  Future<void> pumpLocalized(Widget child, Locale locale) {
    return pumpWidget(
      Localizations(
        locale: locale,
        delegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        child: child,
      ),
    );
  }
}
