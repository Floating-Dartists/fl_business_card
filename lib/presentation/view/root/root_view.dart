import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../router.dart';
import '../../viewmodel/root/root_view_model.dart';
import '../manage_links/manage_links_view.dart';
import '../settings/settings_view.dart';
import '../share/share_view.dart';

class RootView extends ConsumerStatefulWidget {
  const RootView({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RootViewState();
}

class _RootViewState extends ConsumerState<RootView>
    with SingleTickerProviderStateMixin {
  final _pages = const <_PageItem>[
    _PageItem(icon: Icons.home, page: ManageLinksView()),
    _PageItem(icon: Icons.pages, page: Center(child: Text('2'))),
    _PageItem(icon: Icons.share, page: ShareView()),
    _PageItem(icon: Icons.settings, page: SettingsView()),
  ];

  final _pageController = PageController();

  late final RootViewModel _viewModel;
  late final AnimationController _animationController;
  late final Animation<double> _animation;
  late final CurvedAnimation _curve;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _curve = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_curve);
    _animationController.forward();
    _viewModel = ref.read(rootViewModelProvider.notifier);
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final activeIndex = ref.watch(rootViewModelProvider).bottomBarIndex;
    return Scaffold(
      floatingActionButton: ScaleTransition(
        scale: _animation,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () => context.pushNamed(AppRoute.addLink.name),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        controller: _pageController,
        children: _pages.map((e) => e.page).toList(),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        notchAndCornersAnimation: _animation,
        gapLocation: GapLocation.center,
        icons: _pages.map((e) => e.icon).toList(),
        activeIndex: activeIndex,
        onTap: (index) {
          if (index != 0) {
            _animationController.reverse();
          } else {
            _animationController.forward();
          }
          _viewModel.goToIndex(index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}

class _PageItem {
  final IconData icon;
  final Widget page;

  const _PageItem({required this.icon, required this.page});
}
