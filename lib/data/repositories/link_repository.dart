import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/business_link.dart';
import '../datasources/local_datasource.dart';

abstract class LinkRepository {
  /// Return a synchronous list of links.
  List<BusinessLink> getLinks();

  /// Return an asynchronous list of links from the local datasource.
  Future<List<BusinessLink>> fetchLinks();

  Stream<List<BusinessLink>> watchLinks();
}

class LinkRepositoryImpl implements LinkRepository {
  final LocalDataSource _localDataSource;

  LinkRepositoryImpl({required LocalDataSource localDataSource})
      : _localDataSource = localDataSource;

  List<BusinessLink> _links = [];

  @override
  List<BusinessLink> getLinks() {
    return _links;
  }

  @override
  Future<List<BusinessLink>> fetchLinks() async {
    _links = await _localDataSource.getLinks();
    return _links;
  }

  @override
  Stream<List<BusinessLink>> watchLinks() {
    return Stream.value(_links);
  }
}

final linkRepositoryProvider = Provider<LinkRepository>((ref) {
  return LinkRepositoryImpl(
    localDataSource: ref.watch(localDataSourceProvider),
  );
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
