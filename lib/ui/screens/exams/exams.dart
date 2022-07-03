import 'package:bahaa_app/ui/base/drawer.dart';
import 'package:bahaa_app/ui/widgets/custom_arrow_widget.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class ExamsScreen extends StatelessWidget {
  const ExamsScreen({Key? key}) : super(key: key);

  static final _collection = FirebaseFirestore.instance.collection("exams");

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) throw 'حدث خطأ ما';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const BaseDrawer(),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(
              "الإمتحانات المحوسبة",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            Text(
              "أختبر نفسك",
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            FirestoreQueryBuilder<Map<String, dynamic>>(
                query: _collection,
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
                    separatorBuilder: (context, index) => const Divider(
                      indent: 20,
                      endIndent: 20,
                    ),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          _launchUrl(data[index]["link"]);
                        },
                        title: Text(
                          data[index]["title"],
                          style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          data[index]["description"],
                          style: const TextStyle(
                            color: MyColors.greyC7C,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        trailing: const CustomArrowWidget(
                          icon: Icons.north_west,
                        ),
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}
