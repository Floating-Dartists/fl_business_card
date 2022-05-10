import 'package:equatable/equatable.dart';

class Link extends Equatable {
  final String name;
  final Uri uri;
  final int index;

  const Link({
    required this.name,
    required this.uri,
    required this.index,
  });

  @override
  List<Object?> get props => [name, uri, index];
}
