import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddLinkView extends ConsumerWidget {
  const AddLinkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final mainColor = theme.scaffoldBackgroundColor;
    final scaffoldColor = mainColor.withOpacity(0.4);
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(title: const Text('Add New Link')),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: mainColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'My YouTube Channel',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Url',
                    hintText:
                        'https://www.youtube.com/channel/UC-lHJZR3Gqxm24_Vd_AJ5Yw',
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // TODO: add link and refresh data
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
