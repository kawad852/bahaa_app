import 'package:bahaa_app/ui/screens/home/home.dart';
import 'package:bahaa_app/ui/widgets/custom_nav_bar_button.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

late PersistentTabController navBarController;

class BaseNavBar extends StatefulWidget {
  const BaseNavBar({Key? key}) : super(key: key);

  @override
  State<BaseNavBar> createState() => _BaseNavBarState();
}

class _BaseNavBarState extends State<BaseNavBar> {
  Color _toggleColor(int index) {
    if (navBarController.index == index) {
      return BaseColors.primary;
    } else {
      return BaseColors.grey5B5;
    }
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: CustomNavBaaButton(
          icon: BaseIcons.home,
          title: "الرئيسية",
          color: _toggleColor(0),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBaaButton(
          icon: BaseIcons.feedback,
          title: "الآراء",
          color: _toggleColor(1),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBaaButton(
          icon: BaseIcons.card,
          title: "البطاقة",
          color: _toggleColor(2),
        ),
      ),
      PersistentBottomNavBarItem(
        icon: CustomNavBaaButton(
          icon: BaseIcons.exam,
          title: "الأمتحانات",
          color: _toggleColor(3),
        ),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen(),
    ];
  }

  @override
  void initState() {
    navBarController = PersistentTabController(initialIndex: 0);
    navBarController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: navBarController,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: BaseColors.scaffold, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: const NavBarDecoration(
        border: Border(
          top: BorderSide(
            color: BaseColors.grey5B5,
          ),
        ),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}