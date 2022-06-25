import 'package:bahaa_app/helper/periodic_table.dart';
import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeriodicTableScreen extends StatefulWidget {
  const PeriodicTableScreen({Key? key}) : super(key: key);

  @override
  State<PeriodicTableScreen> createState() => _PeriodicTableScreenState();
}

class _PeriodicTableScreenState extends State<PeriodicTableScreen> {
  final PeriodicTableController _controller = PeriodicTableController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          reverse: true,
          itemCount: 6,
          itemBuilder: (context, pageIndex) {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: MyColors.grey565,
                      height: 50,
                      width: Get.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _controller.tableHeader(pageIndex: pageIndex),
                      ),
                    ),
                    GridView.builder(
                        padding: EdgeInsets.all(20),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: 21,
                        itemBuilder: (context, gridIndex) {
                          return _controller.buildCard(
                            gridIndex: gridIndex,
                            pageIndex: pageIndex,
                          );
                        }),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
