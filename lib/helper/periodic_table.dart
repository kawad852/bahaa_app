import 'package:bahaa_app/ui/widgets/student_grade_box.dart';
import 'package:bahaa_app/utils/base/images.dart';
import 'package:flutter/material.dart';

class PeriodicTableController {
  final _image = "https://i.pinimg.com/originals/52/61/13/52611340f103ae8c2521b5213919c21d.jpg";
  final invisibleCards = {
    "0": [1, 2, 5, 8],
    "1": [0, 1, 2, 3, 4, 5, 6, 7, 8],
    "2": [0, 1, 2, 3, 4, 5, 6, 7, 8],
    "3": [0, 1, 2, 3, 4, 5, 6, 7, 8],
    "4": [0, 1, 2],
    "5": [0, 1],
  };

  List<Widget> tableHeader({required int pageIndex}) {
    List<String> myTitles = [];
    if (pageIndex == 0) {
      myTitles = ["1A", "2B", "3B"];
    } else if (pageIndex == 1) {
      myTitles = ["4B", "5B", "6B"];
    } else if (pageIndex == 2) {
      myTitles = ["7B", "7B", "8B"];
    } else if (pageIndex == 3) {
      myTitles = ["8B", "1B", "2B"];
    } else if (pageIndex == 4) {
      myTitles = ["3A", "4A", "5A"];
    } else {
      myTitles = ["6A", "7A", "8A"];
    }
    return [
      const Spacer(),
      Text(myTitles[0]),
      const Spacer(),
      const Text(""),
      const Spacer(),
      Text(myTitles[1]),
      const Spacer(),
      const Text(""),
      const Spacer(),
      Text(myTitles[2]),
      const Spacer(),
    ];
  }

  Widget buildCard({required int pageIndex, required int gridIndex}) {
    if (!invisibleCards.values.elementAt(pageIndex).contains(gridIndex)) {
      if (pageIndex == 0) {
        return CustomStudentGradeBox(name: myInfo0[gridIndex].name!, grade: myInfo0[gridIndex].mark!.toString(), image: _image);
      } else if (pageIndex == 1) {
        return CustomStudentGradeBox(name: myInfo1[gridIndex].name!, grade: myInfo1[gridIndex].mark!.toString(), image: _image);
      } else if (pageIndex == 2) {
        return CustomStudentGradeBox(name: myInfo2[gridIndex].name!, grade: myInfo2[gridIndex].mark!.toString(), image: _image);
      } else if (pageIndex == 3) {
        return CustomStudentGradeBox(name: myInfo3[gridIndex].name!, grade: myInfo3[gridIndex].mark!.toString(), image: _image);
      } else if (pageIndex == 4) {
        return CustomStudentGradeBox(name: myInfo4[gridIndex].name!, grade: myInfo4[gridIndex].mark!.toString(), image: _image);
      } else {
        return CustomStudentGradeBox(name: myInfo5[gridIndex].name!, grade: myInfo5[gridIndex].mark!.toString(), image: _image);
      }
    } else {
      if (pageIndex == 1 && gridIndex == 3) {
        return Image.asset(MyImages.chem);
      } else if (pageIndex == 1 && gridIndex == 2) {
        return Image.asset(
          MyImages.chem2,
        );
      } else if (pageIndex == 1 && gridIndex == 8) {
        return Image.asset(MyImages.chem);
      } else {
        return const SizedBox.shrink();
      }
    }
  }

  Widget _customWidget(String text) {
    return Container(
      // color: Colors.red,
      child: FittedBox(
        child: Text(
          text,
          // style: TextStyle(fontSize: 150),
        ),
      ),
    );
  }

  List<StudentInfo> myInfo0 = [
    StudentInfo(name: "احمد زياد", mark: 99.2),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "حسام زياد", mark: 85.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "احمد زياد", mark: 88.2),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "عبد الله زياد", mark: 88.2),
    StudentInfo(name: "خالد زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "رهف زياد", mark: 88.2),
    StudentInfo(name: "خليل زياد", mark: 88.2),
    StudentInfo(name: "دانيا زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "اسيل زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
  ];

  List<StudentInfo> myInfo1 = [
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "عبد الله زياد", mark: 88.2),
    StudentInfo(name: "خالد زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "رهف زياد", mark: 88.2),
    StudentInfo(name: "خليل زياد", mark: 88.2),
    StudentInfo(name: "دانيا زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "اسيل زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "سارة زياد", mark: 88.2),
  ];

  List<StudentInfo> myInfo2 = [
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "خالد زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "رهف زياد", mark: 88.2),
    StudentInfo(name: "خليل زياد", mark: 88.2),
    StudentInfo(name: "دانيا زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "اسيل زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "راما زياد", mark: 88.2),
  ];

  List<StudentInfo> myInfo3 = [
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "نيمار زياد", mark: 88.2),
    StudentInfo(name: "خالد زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "رهف زياد", mark: 88.2),
    StudentInfo(name: "خليل زياد", mark: 88.2),
    StudentInfo(name: "دانيا زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "اسيل زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "صفية زياد", mark: 88.2),
  ];

  List<StudentInfo> myInfo4 = [
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "خالد زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "رهف زياد", mark: 88.2),
    StudentInfo(name: "خليل زياد", mark: 88.2),
    StudentInfo(name: "دانيا زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "اسيل زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "راما زياد", mark: 88.2),
  ];

  List<StudentInfo> myInfo5 = [
    StudentInfo(name: null, mark: null),
    StudentInfo(name: null, mark: null),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "زين زياد", mark: 88.2),
    StudentInfo(name: "خالد زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "رهف زياد", mark: 88.2),
    StudentInfo(name: "خليل زياد", mark: 88.2),
    StudentInfo(name: "دانيا زياد", mark: 88.2),
    StudentInfo(name: "سامر زياد", mark: 88.2),
    StudentInfo(name: "اسيل زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "حسام زياد", mark: 88.2),
    StudentInfo(name: "راما زياد", mark: 88.2),
  ];
}

class StudentInfo {
  final String? name;
  final double? mark;
  final double? number;

  StudentInfo({
    required this.name,
    required this.mark,
    this.number,
  });
}
