import 'package:flutter/material.dart';

import '../../extensions/string.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('SettingsView'.hardcoded)),
    );
  }
}
