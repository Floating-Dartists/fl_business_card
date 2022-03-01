import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../presentation/view/add_link/add_link_view.dart';
import '../presentation/view/error/error_view.dart';
import '../presentation/view/root/root_view.dart';

final router = routerGenerator();

GoRouter routerGenerator({String? initialLocation}) => GoRouter(
      initialLocation: initialLocation ?? Routes.root,
      routes: [
        GoRoute(
          name: RootView.name,
          path: Routes.root,
          builder: (_, __) => const RootView(),
          routes: [
            GoRoute(
              name: AddLinkView.name,
              path: Routes.addLink,
              builder: (_, __) => const AddLinkView(),
            ),
          ],
        ),
      ],
      errorBuilder: (_, state) {
        debugPrint(state.error.toString());
        return const ErrorView();
      },
    );

class Routes extends Equatable {
  static const root = RootView.route;
  static const addLink = AddLinkView.route;

  @override
  List<Object?> get props => [root];
}
