import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/bindings/initial_binding.dart';
import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppBindings.initServices();
  runApp(const AgeApp());
}

class AgeApp extends StatelessWidget {
  const AgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Age Calculator',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      initialBinding: AppBindings(),
      // translations: AppTranslations(),
      // theme: AppTheme.lightTheme,
    );
  }
}
