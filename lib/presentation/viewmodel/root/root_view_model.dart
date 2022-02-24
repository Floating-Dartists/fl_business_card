import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'root_state.dart';

final rootViewModelProvider =
    StateNotifierProvider.autoDispose<RootViewModel, RootState>(
  (ref) => RootViewModel(),
);

class RootViewModel extends StateNotifier<RootState> {
  RootViewModel() : super(RootState.initial());

  void goToIndex(int index) {
    if (state.bottomBarIndex == index) return;
    state = state.copyWith(bottomBarIndex: index);
  }
}
