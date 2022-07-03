import 'package:bahaa_app/ui/widgets/student_grade_box.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';

class TopStudentsScreen extends StatelessWidget {
  const TopStudentsScreen({Key? key}) : super(key: key);

  static final _collection = FirebaseFirestore.instance.collection("top students");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Text(
                "الطلاب الأوائل",
                style: Theme.of(context).textTheme.headline4,
              ),
              FirestoreQueryBuilder<Map<String, dynamic>>(
                query: _collection.orderBy("time", descending: true),
                builder: (context, snapshot, _) {
                  if (snapshot.isFetching) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return Text('Something went wrong! ${snapshot.error}');
                  }

                  var data = snapshot.docs;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(20),
                    itemCount: data.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 0.8,
                    ),
                    itemBuilder: (context, index) {
                      return CustomStudentGradeBox(
                        name: data[index]["name"],
                        grade: data[index]["grade"],
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
