import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget Function()? loading;

  const AsyncValueWidget({
    Key? key,
    required this.value,
    required this.data,
    this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (_, __) => const Center(child: Icon(Icons.error)),
      loading:
          loading ?? () => const Center(child: CircularProgressIndicator()),
    );
  }
}
