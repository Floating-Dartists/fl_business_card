import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddLinkView extends ConsumerWidget {
  const AddLinkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Link'),
      ),
      body: const Center(child: Text('Add link')),
    );
  }
}
