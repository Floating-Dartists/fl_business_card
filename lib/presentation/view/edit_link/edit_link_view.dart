import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditLinkView extends ConsumerStatefulWidget {
  const EditLinkView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditLinkViewState();
}

class _EditLinkViewState extends ConsumerState<EditLinkView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Link'),
      ),
      body: const Center(child: Text('Edit Link')),
    );
  }
}
