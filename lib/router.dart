import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'presentation/view/add_link/add_link_view.dart';
import 'presentation/view/edit_link/edit_link_view.dart';
import 'presentation/view/error/error_view.dart';
import 'presentation/view/root/root_view.dart';

GoRouter routerGenerator({String? initialLocation}) {
  return GoRouter(
    urlPathStrategy: UrlPathStrategy.path,
    initialLocation: initialLocation ?? AppRoutePath.root,
    routes: [
      GoRoute(
        name: AppRouteName.root.name,
        path: AppRoutePath.root,
        builder: (_, __) => const RootView(),
        routes: [
          GoRoute(
            name: AppRouteName.addLink.name,
            path: AppRoutePath.addLink,
            builder: (_, __) => const AddLinkView(),
          ),
          GoRoute(
            name: AppRouteName.editLink.name,
            path: AppRoutePath.editLink,
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

enum AppRouteName { root, addLink, editLink }

class AppRoutePath extends Equatable {
  static const root = '/';
  static const addLink = 'add-link';
  static const editLink = 'edit-link/:id';

  @override
  List<Object?> get props => [root, addLink, editLink];
}
