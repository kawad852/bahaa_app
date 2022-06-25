import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/review_box.dart';
import 'package:bahaa_app/utils/app_constants.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

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
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "آراء الطلاب",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 15),
                child: RatingBar(
                  minRating: 1,
                  initialRating: 3,
                  direction: Axis.horizontal,
                  allowHalfRating: false,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset(MyIcons.starFull),
                    half: SvgPicture.asset(MyIcons.starHalf),
                    empty: SvgPicture.asset(MyIcons.starEmpty),
                  ),
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {},
                ),
              ),
              const CustomField(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: CustomElevatedButton(
                  onTap: () {},
                  title: "نشر",
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
            ],
          ),
        ),
      ),
    );
  }
}

class CustomField extends StatelessWidget {
  const CustomField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 210,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
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
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextField(
            maxLines: 6,
            decoration: InputDecoration(
              filled: true,
              fillColor: MyColors.scaffold,
              constraints: const BoxConstraints(maxHeight: 200),
              hintText: "أكتب رأيك هنا",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
