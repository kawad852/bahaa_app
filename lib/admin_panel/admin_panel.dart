import 'package:bahaa_app/admin_panel/reviews.dart';
import 'package:bahaa_app/admin_panel/top_students.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  PageController pageController = PageController();

  late List<SideMenuItem> items;

  @override
  void initState() {
    items = [
      SideMenuItem(
        // Priority of item to show on SideMenu, lower value is displayed at the top
        priority: 0,
        title: 'المدارس',
        onTap: () => pageController.jumpToPage(0),
        icon: const Icon(Icons.home),
        badgeContent: const Text(
          '3',
          style: TextStyle(color: Colors.white),
        ),
      ),
      SideMenuItem(
        priority: 1,
        title: 'Settings',
        onTap: () => pageController.jumpToPage(1),
        icon: const Icon(Icons.settings),
      ),
      SideMenuItem(
        priority: 2,
        title: 'Exit',
        onTap: () {},
        icon: const Icon(Icons.exit_to_app),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SideMenu(
            style: SideMenuStyle(
              displayMode: SideMenuDisplayMode.auto,
              decoration: const BoxDecoration(),
              // openSideMenuWidth: 200,
              // compactSideMenuWidth: 40,
              hoverColor: Colors.blue[100],
              selectedColor: Colors.lightBlue,
              selectedIconColor: Colors.white,
              unselectedIconColor: Colors.black54,
              backgroundColor: Colors.grey,
              selectedTitleTextStyle: const TextStyle(color: Colors.white),
              unselectedTitleTextStyle: const TextStyle(color: Colors.black54),
              // iconSize: 20,
            ),
            // Page controller to manage a PageView
            controller: pageController,
            // Will shows on top of all items, it can be a logo or a Title text
            title: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset(
                MyImages.logo,
              ),
            ),
            // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
            footer: const Text('demo'),
            // Notify when display mode changed
            onDisplayModeChanged: (mode) {},
            // List of SideMenuItem to show them on SideMenu
            items: items,
          ),
          Expanded(
            child: PageView.builder(
              itemCount: 3,
              controller: pageController,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const TopStudentsPanel();
                } else if (index == 1) {
                  return const TopStudentsPanel();
                } else {
                  return const ReviewsPanel();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
