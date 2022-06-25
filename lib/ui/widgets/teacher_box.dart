import 'package:bahaa_app/ui/screens/home/display_image_screen.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TeacherBox extends StatelessWidget {
  const TeacherBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 80, bottom: 30, right: 20, left: 20),
          width: double.infinity,
          height: 190,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            gradient: const LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.bottomRight,
              colors: [
                MyColors.blue3FA,
                MyColors.paigeFDC,
              ],
            ),
          ),
        ),
        Positioned(
          top: 30,
          child: Column(
            children: [
              Hero(
                tag: "885",
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      () => const DisplayImageScreen(image: "https://i.pinimg.com/originals/52/61/13/52611340f103ae8c2521b5213919c21d.jpg"),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 65,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/originals/52/61/13/52611340f103ae8c2521b5213919c21d.jpg",
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 10),
                child: Text(
                  "الأستاذ بهاء أبو هيض",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              const Text(
                "مدرس مادة الكيمياء",
                style: TextStyle(color: MyColors.grey565),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
