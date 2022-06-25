import 'package:bahaa_app/utils/base/colors.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const differentCredentialMessage =
      "[firebase_auth/account-exists-with-different-credential] An account already exists with the same email address but different sign-in credentials. Sign in using a provider associated with this email address.";
  static const failedMessage = "Something went Wrong, try again later";
  static String get requiredField => "Field is required";
  static const introText = "Search the world's information, including webpages, images, videos and more. Google has many special features to help you find exactly what you're looking for.";
  static const teacherDescription = "مدرس مادة الكيمياء التوجيهي في العديد من المدارس الخاصة ومؤلف سلسلة الرائع في الكيمياء للثانوية العامة ” التوجيهي “.";

  static const String facebookUrl = "https://www.facebook.com/Google/";
  static const String instagramUrl = "https://www.instagram.com/google/";
  static const String whatsAppUrl = "whatsapp://send?phone=+962791595029";
  static const String youtubeUrl = "https://www.youtube.com/c/google";

  static const review1 =
      "بصراحة ، موقع متكامل ، ضلوا معنا من الألف الى الياء ، ما احتجت ألجأ لأي موقع تاني ، بلشنا بالتأسيس ، والشرح المفصل ، أوراق عمل ، اختبر نفسك ، امتحانات تحاكي طريقة الوزارة ، وختمنا بالمكثفات الرائعة ،";
  static const review2 =
      "موقع وتد رائع ، دراسة مريحة ، بتوفر الوقت والجهد ، والسعر أوفر بكتير من أي طرق تدريس تانية ، والنتائج كانت واضحة من امتحانات التجريبي ، كنت الأكثر تفوقا بصيفي ، والكل سألني عن السر ، وقلت بكل ثقة ، وتد التعليمي مع كوادره كامل متكامل ، بغنيني ، بكفي وبوفي ...";
  static const review3 = "ما شاء الله ، شي فخم ، حببتونا بالمواد ، والدراسة ، والتعامل راقي ، واجهنا كل الصعوبات مع وتد ، وما توقفت دراستنا ابدا بسبب أي ظرف ، وخلصت بالوقت المناسب";

  static const baseGradient = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.bottomRight,
    colors: [
      MyColors.blue3FA,
      MyColors.paigeFDC,
    ],
  );
}
