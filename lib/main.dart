import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'age_calculator_screen/controllers/age_controller.dart';
import 'age_calculator_screen/views/age_calculator_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AgeController());
  runApp(const AgeApp());
}

class AgeApp extends StatelessWidget {
  const AgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Age Calculator',
      debugShowCheckedModeBanner: false,
      home: const AgeCalculatorScreen(),
    );
  }
}
