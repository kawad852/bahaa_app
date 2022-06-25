import 'package:bahaa_app/utils/base/colors.dart';
import 'package:bahaa_app/utils/base/icons.dart';
import 'package:flutter/material.dart';

class WatadHelper {
  static const watad = "وتد هي منصة تعليمية إلكترونية توفر لطلاب المراحل الأساسية والثانوية، وخاصة مرحلة التوجيهي، بيئة تعليمية متطورة تسعى وبأسلوب حديث ومبسط لمساعدة الطلاب في كافة المناطق على النجاح والتفوق في اجتياز امتحان الثانوية العامة.";
  static const watadGoal = "تسعى وتد بأسلوب حديث ومبسط مساعدة الطلاب في كافة المناطق على النجاح والتفوق في اجتياز امتحان الثانوية العامة.\nيقوم موقع وتد بتوفير خطة دراسية متكاملة لكل مادة من مواد التوجيهي وتشمل:\nمحاضرات مبوبة سهلة الاستخدام وبأسلوب سلس من قبل نخبة من الأساتذة المميزين تمارين وحلول لمساعدة الطلاب على التمكن من المواد بشكل تام.\nبيئة تفاعلية مع الأساتذة والكادر التعليمي . قابلية استخدام المنصة من خلال أجهزة الحاسوب أو الألواح الذكية أو الهواتف النقالة.";
  static const headline = TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
  static const body = TextStyle(fontSize: 16, color: MyColors.grey181);
  static const circleTextStyle = TextStyle(fontSize: 12, color: MyColors.grey969, fontWeight: FontWeight.w400);
  static const cardText1 = "يؤمن موقع وتد لطالب التوجيهي جميع ما يحتاجه من مواد تعليمية منوعة بجودة عالية، حيث يستطيع الطالب متابعة الدروس من أي مكان وفي أي وقت";
  static const cardText2 = "يوفر موقع وتد بطاقات مدفوعة مسبقاً لتسهيل عملية الاشتراك بالمواد التعليمية، يمكنك شراء البطاقة من الفئة المناسبة للمادة/المواد التي ترغب بشرائها";
  static const cardText3 = "محاضرات مبوبة سهلة الاستخدام وبأسلوب سلس من قبل نخبة من الاساتذة المميزين، ونشر فيديوهات وأوراق عمل واختبارات محوسبة وتمارين وحلول لمساعدة الطلاب على التمكن من المواد بشكل تام";

  static const cardData = [
    {
      "title": "مميزات وتد",
      "body": cardText1,
    },
    {
      "title": "بطاقات مدفوعة مسبقاً",
      "body": cardText2,
    },
    {
      "title": "خطة دراسية متكاملة",
      "body": cardText3,
    },
  ];

  static const circlesData = [
    {
      "icon": MyIcons.document,
      "title": "مادة توجيهي وثانوي",
      "number": "+100",
      "color": MyColors.paigeD8D,
    },
    {
      "icon": MyIcons.people,
      "title": "أستاذ وخبير",
      "number": "+50",
      "color": MyColors.green5FF,
    },
    {
      "icon": MyIcons.medal,
      "title": "ورقة عمل ودوسية مجانية",
      "number": "+2000",
      "color": MyColors.red87A,
    },
  ];

  static final cardDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(18.0),
    gradient: const LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.bottomRight,
      colors: [
        MyColors.blue3FA,
        MyColors.paigeFDC,
      ],
    ),
  );
}
