import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/business_link.dart';

class LinkRepository {
  final _links = kTestLinks;

  /// Return a synchronous list of links.
  List<BusinessLink> getLinks() {
    return _links;
  }

  /// Return an asynchronous list of links.
  Future<List<BusinessLink>> fetchLinks() async {
    return _links;
  }

  Stream<List<BusinessLink>> watchLinks() {
    return Stream.value(_links);
  }
}

final linkRepositoryProvider = Provider<LinkRepository>((ref) {
  return LinkRepository();
});

final linksStreamProvider =
    StreamProvider.autoDispose<List<BusinessLink>>((ref) {
  final repository = ref.watch(linkRepositoryProvider);
  return repository.watchLinks();
});

final kTestLinks = <BusinessLink>[
  BusinessLink(
    name: 'Google',
    uri: Uri.https('google.com', ''),
    index: 0,
  ),
  BusinessLink(
    name: 'Facebook',
    uri: Uri.https('facebook.com', ''),
    index: 1,
  ),
];
