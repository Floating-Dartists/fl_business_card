import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

const _kCornerRadius = 32.0;

class RootView extends StatefulWidget {
  static const routeName = 'root';

  const RootView({Key? key}) : super(key: key);

  @override
  _RootViewState createState() => _RootViewState();
}

class _RootViewState extends State<RootView> {
  final _items = List<BottomNavigationBarItem>.generate(
    4,
    (index) => BottomNavigationBarItem(
      icon: const Icon(Icons.pages),
      label: '$index',
    ),
  );
  final _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.edit),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: PageView(
        controller: _pageController,
        children: List<Widget>.generate(
          _items.length,
          (index) => Center(child: Text('$index')),
        ),
      ),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        gapLocation: GapLocation.center,
        leftCornerRadius: _kCornerRadius,
        rightCornerRadius: _kCornerRadius,
        icons: _items.map<IconData>((e) => (e.icon as Icon).icon!).toList(),
        activeIndex: 0,
        onTap: (index) {},
      ),
    );
  }
}
