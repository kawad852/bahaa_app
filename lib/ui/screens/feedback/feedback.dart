import 'dart:math';

import 'package:bahaa_app/ui/base/drawer.dart';
import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/custom_text_field.dart';
import 'package:bahaa_app/ui/widgets/review_box.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:get/get.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  late TextEditingController nameCtrl;
  late TextEditingController rateCtrl;
  late TextEditingController reviewCtrl;
  late ScrollController _scrollController;
  String? chosenImage;

  static final _collection = FirebaseFirestore.instance.collection("reviews");

  void _showDialog() {
    FocusManager.instance.primaryFocus?.unfocus();
    Get.defaultDialog(
      title: "الصورة",
      content: Wrap(
        runSpacing: 5,
        spacing: 5,
        children: List.generate(
          12,
          (index) => GestureDetector(
            onTap: () {
              setState(() {
                chosenImage = index.toString();
              });
              Get.back();
            },
            child: CircleAvatar(
              backgroundColor: index < 6 ? MyColors.imageGreen : MyColors.imagePink,
              radius: 50,
              child: SvgPicture.asset("assets/avatars/$index.svg"),
            ),
          ),
        ),
      ),
    );
  }

  int _generateColorNum() {
    int num = Random().nextInt(3);
    return num;
  }

  @override
  void initState() {
    nameCtrl = TextEditingController();
    rateCtrl = TextEditingController();
    reviewCtrl = TextEditingController();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      // setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    rateCtrl.dispose();
    reviewCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(
          Icons.arrow_upward,
        ),
      ),
      drawer: const BaseDrawer(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "آراء الطلاب",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: nameCtrl,
                height: 80,
                hintText: "الإسم",
                icon: chosenImage == null
                    ? FloatingActionButton(
                        onPressed: () {
                          _showDialog();
                        },
                        backgroundColor: MyColors.blue3FA,
                        child: const Icon(
                          Icons.image,
                          color: MyColors.text,
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _showDialog();
                        },
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: MyColors.blue3FA,
                          child: SvgPicture.asset("assets/avatars/$chosenImage.svg"),
                        ),
                      ),
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: reviewCtrl,
                height: 210,
                maxLines: 6,
                hintText: "أكتب رأيك هنا",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                child: CustomElevatedButton(
                  onTap: () {
                    if (nameCtrl.text.isEmpty || reviewCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "يجب كتابة إسمك ورأيك في الحقول",
                          ),
                        ),
                      );
                      return;
                    } else if (chosenImage == null) {
                      _showDialog();
                      return;
                    } else {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _collection.add({
                        "name": nameCtrl.text,
                        "review": reviewCtrl.text,
                        "image": chosenImage,
                        "approval": false,
                        "color": _generateColorNum().toString(),
                        "time": DateTime.now(),
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "تم إرسال التقييم",
                          ),
                        ),
                      );
                      nameCtrl.clear();
                      reviewCtrl.clear();
                    }
                  },
                  title: "نشر",
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "آراء الطلاب",
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              FirestoreQueryBuilder<Map<String, dynamic>>(
                query: _collection.where("approval", isEqualTo: true).orderBy("time", descending: true),
                builder: (context, snapshot, _) {
                  if (snapshot.isFetching) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  }

                  var data = snapshot.docs;
                  return ListView.separated(
                    padding: const EdgeInsets.only(top: 20),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      return ReviewBox(
                        name: data[index]["name"],
                        review: data[index]["review"],
                        image: data[index]["image"],
                        color: data[index]["color"],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
