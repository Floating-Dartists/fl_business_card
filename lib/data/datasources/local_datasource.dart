import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entities/business_link.dart';
import '../repositories/link_repository.dart';

class LocalDataSource {
  Future<List<BusinessLink>> getLinks() async {
    return kTestLinks;
  }
}

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  return LocalDataSource();
});
