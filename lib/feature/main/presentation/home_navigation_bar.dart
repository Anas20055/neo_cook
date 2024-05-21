import 'package:cook_app/core/constants/app_colors.dart';
import 'package:cook_app/core/constants/app_svg.dart';
import 'package:cook_app/feature/main/presentation/home_page/home_page.dart';
import 'package:cook_app/feature/profile/presentation/profile_page/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeNavigationBar extends StatefulWidget {
  const HomeNavigationBar({super.key});

  @override
  State<HomeNavigationBar> createState() => _HomeNavigationBarState();
}

class _HomeNavigationBarState extends State<HomeNavigationBar> {
  int _currentIndex = 0;
  final body = [
    const HomePage(),
    const Center(child: Text('third')),
    const ProfilePage(),
  ];
  void _onTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final _items = [
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(left: 35, top: 19),
        child: Icon(Icons.cottage),
      ),
      label: 'home',
    ),
    BottomNavigationBarItem(
      activeIcon: Padding(
        padding: const EdgeInsets.only(top: 19),
        child: SvgPicture.asset(
          AppSvg.searchField,
        ),
      ),
      icon: Padding(
        padding: const EdgeInsets.only(top: 19),
        child: SvgPicture.asset(
          AppSvg.search,
        ),
      ),
      label: 'search',
    ),
    const BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(right: 35, top: 19),
        child: Icon(Icons.account_circle_outlined),
      ),
      label: 'profile00',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: body,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 20,
            ),
          ],
        ),
        height: 77,
        child: BottomNavigationBar(
          unselectedFontSize: 0.0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.orange,
          unselectedItemColor: AppColors.iconGrey,
          currentIndex: _currentIndex,
          selectedFontSize: 0.0,
          onTap: _onTab,
          items: _items,
          elevation: 0,
        ),
      ),
    );
  }
}
