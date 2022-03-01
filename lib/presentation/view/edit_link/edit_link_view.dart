import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EditLinkView extends ConsumerStatefulWidget {
  const EditLinkView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditLinkViewState();
}

class _EditLinkViewState extends ConsumerState<EditLinkView> {
  final _entries = List<String>.generate(4, (index) => 'Entry $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView.builder(
          itemCount: _entries.length,
          itemBuilder: (_, index) => Dismissible(
            direction: DismissDirection.endToStart,
            key: ValueKey(_entries[index]),
            background: const DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            onDismissed: (_) => setState(() {
              _entries.remove(_entries[index]);
            }),
            child: ListTile(
              leading: const Icon(Icons.reorder),
              title: Text(_entries[index]),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {},
              ),
            ),
          ),
          onReorder: (oldIndex, newIndex) {
            debugPrint('$oldIndex -> $newIndex');
          },
        ),
      ),
    );
  }
}
