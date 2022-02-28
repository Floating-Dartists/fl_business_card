import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class RootState extends Equatable {
  final int bottomBarIndex;

  const RootState({required this.bottomBarIndex});

  factory RootState.initial() => const RootState(bottomBarIndex: 0);

  RootState copyWith({int? bottomBarIndex}) {
    return RootState(bottomBarIndex: bottomBarIndex ?? this.bottomBarIndex);
  }

  @override
  List<Object?> get props => [bottomBarIndex];
}
