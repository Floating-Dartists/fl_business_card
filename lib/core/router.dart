import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import '../presentation/view/error/error_view.dart';
import '../presentation/view/root/root_view.dart';

GoRouter routerGenerator({String? initialLocation}) => GoRouter(
      initialLocation: initialLocation ?? Routes.root,
      routes: [
        GoRoute(
          name: RootView.routeName,
          path: Routes.root,
        ),
      ],
      errorBuilder: (_, state) {
        debugPrint(state.error.toString());
        return const ErrorView();
      },
    );

class Routes extends Equatable {
  static const root = '/';

  @override
  List<Object?> get props => [root];
}
