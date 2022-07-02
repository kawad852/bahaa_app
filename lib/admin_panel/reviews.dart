import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/review_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class ReviewsPanel extends StatelessWidget {
  const ReviewsPanel({Key? key}) : super(key: key);
  static final _collection = FirebaseFirestore.instance.collection("الآراء");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FirestoreQueryBuilder<Map<String, dynamic>>(
          query: _collection.where("الموافقة", isEqualTo: "0").orderBy("الوقت", descending: true),
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
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    ReviewBox(
                      name: data[index]["name"],
                      review: data[index]["review"],
                      image: data[index]["gender"],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomElevatedButton(
                              onTap: () {
                                _collection.doc().update({
                                  "approval": "1",
                                });
                              },
                              title: "الموافقة",
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: CustomElevatedButton(
                              onTap: () {},
                              title: "الرفض",
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
