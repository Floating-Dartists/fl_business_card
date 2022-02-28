import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../viewmodel/root/root_view_model.dart';
import '../edit_link/edit_link_view.dart';

const _kCornerRadius = 32.0;

class RootView extends ConsumerStatefulWidget {
  static const name = 'root';
  static const route = '/';

  const RootView({Key? key}) : super(key: key);

  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends ConsumerState<RootView>
    with SingleTickerProviderStateMixin {
  final _pages = const <_PageItem>[
    _PageItem(icon: Icons.home, page: EditLinkView()),
    _PageItem(icon: Icons.pages, page: Center(child: Text('2'))),
    _PageItem(icon: Icons.share, page: Center(child: Text('3'))),
    _PageItem(icon: Icons.pages, page: Center(child: Text('4'))),
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
          child: const Icon(Icons.edit),
          onPressed: () {},
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
        leftCornerRadius: _kCornerRadius,
        rightCornerRadius: _kCornerRadius,
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
