import 'package:bahaa_app/ui/widgets/custom_elevated_button.dart';
import 'package:bahaa_app/ui/widgets/review_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class ReviewsPanel extends StatelessWidget {
  const ReviewsPanel({Key? key}) : super(key: key);
  static final _collection = FirebaseFirestore.instance.collection("reviews");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              "الآراء",
              style: Theme.of(context).textTheme.headline3,
            ),
            FirestoreQueryBuilder<Map<String, dynamic>>(
              query: _collection.where("approval", isEqualTo: false).orderBy("time", descending: true),
              builder: (context, snapshot, _) {
                if (snapshot.isFetching) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Text('Something went wrong! ${snapshot.error}');
                }

                var data = snapshot.docs;

                if (data.isEmpty) {
                  return Center(
                    child: Text(
                      "لا يوجد آراء معلقة",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  );
                }

                return Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.only(top: 20),
                    shrinkWrap: true,
                    itemCount: data.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                        snapshot.fetchMore();
                      }
                      return Column(
                        children: [
                          ReviewBox(
                            name: data[index]["name"],
                            review: data[index]["review"],
                            image: data[index]["image"],
                            color: data[index]["color"],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      //TODO: delete
                                      _collection.doc(data[index].id).update({
                                        "approval": true,
                                      });
                                    },
                                    title: "الموافقة",
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: CustomElevatedButton(
                                    onTap: () {
                                      _collection.doc(data[index].id).delete();
                                    },
                                    title: "الرفض",
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
