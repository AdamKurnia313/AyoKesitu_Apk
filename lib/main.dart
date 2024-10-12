import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_flutter/presentation/pages/homepage/Home_Screen.dart';
import 'package:project_flutter/presentation/pages/homepage/onboarding.dart';

void main() {
  runApp(AyoKesitu());
}

class AyoKesitu extends StatelessWidget {
  const AyoKesitu({super.key});
  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        home: onboardings(), debugShowCheckedModeBanner: false);
  }
}
