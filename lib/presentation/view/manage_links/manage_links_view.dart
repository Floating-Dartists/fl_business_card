import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../data/repositories/link_repository.dart';
import '../../../router.dart';

class ManageLinksView extends ConsumerStatefulWidget {
  const ManageLinksView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ManageLinksViewState();
}

class _ManageLinksViewState extends ConsumerState<ManageLinksView> {
  @override
  Widget build(BuildContext context) {
    final linksValue = ref.watch(linksStreamProvider);
    return Scaffold(
      body: SafeArea(
        child: linksValue.when(
          data: (entries) => ReorderableListView.builder(
            buildDefaultDragHandles: false,
            itemCount: entries.length,
            itemBuilder: (_, index) {
              final item = entries[index];
              return Dismissible(
                direction: DismissDirection.endToStart,
                key: ValueKey(entries[index]),
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
                  entries.remove(entries[index]);
                }),
                child: ListTile(
                  leading: ReorderableDelayedDragStartListener(
                    index: index,
                    child: const Icon(Icons.reorder),
                  ),
                  title: Text(item.name),
                  trailing: IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () => context.goNamed(
                      AppRouteName.editLink.name,
                      params: {'id': '${item.index}'},
                    ),
                  ),
                ),
              );
            },
            onReorder: (oldIndex, newIndex) {
              debugPrint('$oldIndex -> $newIndex');
              // TODO: update index of items
            },
          ),
          error: (_, __) => const Center(child: Icon(Icons.error)),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
