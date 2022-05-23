import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = Provider<Locale>((ref) {
  return const Locale('en');
});
