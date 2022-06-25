import 'package:bahaa_app/controller/category.dart';
import 'package:bahaa_app/ui/base/drawer.dart';
import 'package:bahaa_app/ui/widgets/browse_more_button.dart';
import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/custom_outlined_button.dart';
import 'package:bahaa_app/ui/widgets/drawer_button.dart';
import 'package:bahaa_app/ui/widgets/review_box.dart';
import 'package:bahaa_app/ui/widgets/student_grade_box.dart';
import 'package:bahaa_app/ui/widgets/teacher_box.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final ctrl = Get.lazyPut(() => CategoryController());

  static final _images = [
    "https://i.pinimg.com/736x/c9/1c/8b/c91c8bdcded1a045ab2e9515584d9456.jpg",
    "https://i.pinimg.com/736x/c9/1c/8b/c91c8bdcded1a045ab2e9515584d9456.jpg",
    "https://i.pinimg.com/736x/c9/1c/8b/c91c8bdcded1a045ab2e9515584d9456.jpg",
    "https://i.pinimg.com/736x/c9/1c/8b/c91c8bdcded1a045ab2e9515584d9456.jpg",
    "https://i.pinimg.com/736x/c9/1c/8b/c91c8bdcded1a045ab2e9515584d9456.jpg",
  ];

  static final _reviews = [
    {
      "name": "خالد عوض",
      "rate": 4,
      "review": AppConstants.review1,
      "image": "https://i.pinimg.com/originals/52/61/13/52611340f103ae8c2521b5213919c21d.jpg",
    },
    {
      "name": "خالد عوض",
      "rate": 5,
      "review": AppConstants.review2,
      "image": "https://i.pinimg.com/originals/52/61/13/52611340f103ae8c2521b5213919c21d.jpg",
    },
    {
      "name": "خالد عوض",
      "rate": 3,
      "review": AppConstants.review3,
      "image": "https://i.pinimg.com/originals/52/61/13/52611340f103ae8c2521b5213919c21d.jpg",
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
                  return const CustomStudentGradeBox(
                    name: 'محمد حسام',
                    grade: '99.2',
                    image: "https://i.pinimg.com/originals/52/61/13/52611340f103ae8c2521b5213919c21d.jpg",
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: CustomElevatedButton(
                  title: "موقع وتد التعليمي",
                  onTap: () {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Row(
                  children: [
                    Expanded(
                      child: CustomOutlinedButton(
                        title: "المدارس",
                        onTap: () {},
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: CustomOutlinedButton(
                        onTap: () {},
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
                        return CachedNetworkImage(
                          imageUrl: i,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
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
                    image: element["image"].toString(),
                    review: element["review"].toString(),
                    rate: element["rate"] as int,
                  ),
                );
              }).toList(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Center(
                  child: FloatingActionButton.extended(
                    backgroundColor: BaseColors.paigeC9F,
                    onPressed: () {},
                    label: const Text(
                      "انشر رأيك",
                      style: TextStyle(
                        color: BaseColors.text,
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
