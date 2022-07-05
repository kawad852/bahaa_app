import 'package:bahaa_app/admin_panel/book_shops.dart';
import 'package:bahaa_app/admin_panel/exams.dart';
import 'package:bahaa_app/admin_panel/institutes.dart';
import 'package:bahaa_app/admin_panel/reviews.dart';
import 'package:bahaa_app/admin_panel/schools.dart';
import 'package:bahaa_app/admin_panel/top_students.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:bahaa_app/utils/custom_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  PageController pageController = PageController();
  int currentIndex = 0;

  final List<MyPanel> _data = [
    MyPanel(title: "الآراء", page: const ReviewsPanel(), icon: CustomIcon.home),
    MyPanel(title: "الطلاب الأوائل", page: const TopStudentsPanel(), icon: CustomIcon.medal),
    MyPanel(title: "المكتبات", page: const BookShopsPanel(), icon: CustomIcon.card),
    MyPanel(title: "الإمتحانات", page: const ExamsPanel(), icon: CustomIcon.exam),
    MyPanel(title: "المراكز", page: const InstitutesPanel(), icon: CustomIcon.card),
    MyPanel(title: "المدارس", page: const SchoolsPanel(), icon: CustomIcon.card),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _data.length,
      child: Scaffold(
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: Colors.black54,
              height: Get.height,
              width: 90,
              child: SafeArea(
                child: Column(
                  children: [
                    Image.asset(
                      MyImages.logo,
                      height: 100,
                    ),
                    ..._data.map((element) {
                      final index = _data.indexOf(element);
                      return ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(currentIndex == index ? MyColors.blueAFF : Colors.white38),
                          fixedSize: MaterialStateProperty.all(const Size(90, 40)),
                        ),
                        onPressed: () {
                          setState(() {
                            currentIndex = index;
                          });
                          pageController.jumpToPage(index);
                        },
                        child: FittedBox(
                          child: Text(
                            element.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: List.generate(
                  _data.length,
                  (index) {
                    return _data[index].page;
                  },
                ),
                // itemBuilder: (context, index) {
                //   if (index == 0) {
                //     return const ReviewsPanel();
                //   } else if (index == 1) {
                //     return const TopStudentsPanel();
                //   } else if (index == 2) {
                //     return const ExamsPanel();
                //   } else if (index == 3) {
                //     return const InstitutesPanel();
                //   } else if (index == 4) {
                //     return const BookShopsPanel();
                //   } else {
                //     return const SchoolsPanel();
                //   }
                // },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyPanel {
  final String title;
  final Widget page;
  final IconData icon;

  MyPanel({
    required this.title,
    required this.page,
    required this.icon,
  });
}
