import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'list_tile_shimmer.dart';

class LoadingListShimmer extends StatelessWidget {
  const LoadingListShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (_, __) => const ListTileShimmer(),
      ),
    );
  }
}
