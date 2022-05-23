import 'package:flutter/material.dart';

class Localized extends InheritedWidget {
  final List<Locale> supportedLocales;

  const Localized({
    Key? key,
    required this.supportedLocales,
    required Widget child,
  }) : super(key: key, child: child);

  static Localized of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<Localized>();
    return widget!;
  }

  @override
  bool updateShouldNotify(covariant Localized oldWidget) {
    return supportedLocales != oldWidget.supportedLocales;
  }
}
