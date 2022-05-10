import 'package:equatable/equatable.dart';

class BusinessLink extends Equatable {
  final String name;
  final Uri uri;

  /// The index of the link in the list. This value also act as an id when
  /// editing a link.
  final int index;

  const BusinessLink({
    required this.name,
    required this.uri,
    required this.index,
  });

  @override
  List<Object?> get props => [name, uri, index];
}
