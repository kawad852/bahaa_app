import 'package:bahaa_app/ui/base/drawer.dart';
import 'package:bahaa_app/ui/base/nav_bar.dart';
import 'package:bahaa_app/ui/screens/home/institute.dart';
import 'package:bahaa_app/ui/screens/home/schools.dart';
import 'package:bahaa_app/ui/screens/home/watad.dart';
import 'package:bahaa_app/ui/widgets/browse_more_button.dart';
import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/custom_outlined_button.dart';
import 'package:bahaa_app/ui/widgets/drawer_button.dart';
import 'package:bahaa_app/ui/widgets/review_box.dart';
import 'package:bahaa_app/ui/widgets/student_grade_box.dart';
import 'package:bahaa_app/ui/widgets/teacher_box.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static final _images = [
    MyImages.logo,
    MyImages.logo,
    MyImages.logo,
  ];

  static final _topStudents = [
    {
      "name": "خالد عوض",
      "grade": "990.2",
      "image": "2",
      "color": "0",
    },
    {
      "name": "خالد عوض",
      "grade": "990.2",
      "image": "9",
      "color": "1",
    },
    {
      "name": "خالد عوض",
      "grade": "99.2",
      "image": "4",
      "color": "2",
    },
    {
      "name": "خالد عوض",
      "grade": "99.2",
      "image": "11",
      "color": "0",
    },
    {
      "name": "خالد عوض",
      "grade": "99.2",
      "image": "4",
      "color": "1",
    },
    {
      "name": "خالد عوض",
      "grade": "99.2",
      "image": "6",
      "color": "2",
    },
  ];

  static final _reviews = [
    {
      "name": "خالد عوض",
      "review": AppConstants.review1,
      "image": "2",
      "color": "0",
    },
    {
      "name": "رهف",
      "review": AppConstants.review2,
      "image": "7",
      "color": "1",
    },
    {
      "name": "خالد عوض",
      "review": AppConstants.review3,
      "image": "1",
      "color": "2",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BaseDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DrawerButton(),
              const TeacherBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: ListBody(
                  children: [
                    Text(
                      "حول",
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Text(
                      AppConstants.teacherDescription,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const BrowseMoreButton(),
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                shrinkWrap: true,
                itemCount: 6,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.8,
                ),
                itemBuilder: (context, index) {
                  return CustomStudentGradeBox(
                    name: _topStudents[index]["name"].toString(),
                    grade: _topStudents[index]["grade"].toString(),
                    image: _topStudents[index]["image"].toString(),
                    color: _topStudents[index]["color"].toString(),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: CustomElevatedButton(
                  title: "موقع وتد التعليمي",
                  onTap: () {
                    Get.to(() => const WatadScreen());
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        title: "المدارس",
                        onTap: () {
                          Get.to(() => const SchoolsScreen());
                        },
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomOutlinedButton(
                        onTap: () {
                          Get.to(() => const InstituteScreen());
                        },
                        title: 'المراكز الثقافية',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 50),
                child: CarouselSlider(
                  options: CarouselOptions(
                    viewportFraction: 0.50,
                    height: 250.0,
                    enlargeCenterPage: true,
                  ),
                  items: _images.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: DecorationImage(
                              image: AssetImage(i),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Text(
                  "آراء الطلاب",
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              ..._reviews.map((element) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: ReviewBox(
                    name: element["name"].toString(),
                    review: element["review"].toString(),
                    image: element["image"].toString(),
                    color: element["color"].toString(),
                  ),
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: FloatingActionButton.extended(
                    heroTag: "977",
                    backgroundColor: MyColors.paigeC9F,
                    onPressed: () {
                      navBarController.index = 1;
                    },
                    label: const Text(
                      "تصفح المزيد",
                      style: TextStyle(
                        color: MyColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
