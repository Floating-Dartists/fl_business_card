import 'package:flutter/material.dart';

enum ResultType { value, error }

@immutable
class Result<T, E> {
  final T? value;
  final E? error;
  final ResultType type;

  const Result.error({required E input})
      : error = input,
        value = null,
        type = ResultType.error;

  const Result.value({required T input})
      : value = input,
        error = null,
        type = ResultType.value;

  E get requireError {
    assert(type == ResultType.error);
    return error!;
  }

  T get requireValue {
    assert(type == ResultType.value);
    return value!;
  }

  @override
  String toString() {
    switch (type) {
      case ResultType.value:
        return 'Value = ${requireValue.toString()}';
      case ResultType.error:
        return 'Error = ${requireError.toString()}';
    }
  }
}