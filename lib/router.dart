import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'presentation/view/add_link/add_link_view.dart';
import 'presentation/view/edit_link/edit_link_view.dart';
import 'presentation/view/error/error_view.dart';
import 'presentation/view/root/root_view.dart';

GoRouter routerGenerator({String? initialLocation}) {
  return GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: initialLocation ?? AppRoute.root.path,
    routes: [
      GoRoute(
        name: AppRoute.root.name,
        path: AppRoute.root.path,
        builder: (_, __) => const RootView(),
        routes: [
          GoRoute(
            name: AppRoute.addLink.name,
            path: AppRoute.addLink.path,
            builder: (_, __) => const AddLinkView(),
          ),
          GoRoute(
            name: AppRoute.editLink.name,
            path: AppRoute.editLink.path,
            builder: (_, state) {
              final id = int.parse(state.params['id']!);
              return EditLinkView(id: id);
            },
          ),
        ],
      ),
    ],
    errorBuilder: (_, state) {
      debugPrint(state.error.toString());
      return const ErrorView();
    },
  );
}

enum AppRoute {
  root('/'),
  addLink('add-link'),
  editLink('edit-link/:id');

  const AppRoute(this.path);

  final String path;
}
