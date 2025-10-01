import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import '../controllers/age_controller.dart';
import '../controllers/home_controller.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgeController>(builder: (ageController) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Neumorphic(
              style: const NeumorphicStyle(depth: 4),
              child: AppBar(
                title: Text('Settings'.tr),
                centerTitle: true,
                elevation: 0,
                backgroundColor: NeumorphicColors.background,
                iconTheme: const IconThemeData(color: Colors.black),
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Neumorphic(
                  style: const NeumorphicStyle(depth: 4),
                  child: ListTile(
                    title: const Text('Language'),
                    subtitle: Text(Get.locale?.languageCode ?? 'en'),
                    onTap: () {
                      Get.defaultDialog(
                        title: 'Language',
                        content: Column(
                          children: [
                            ListTile(
                              title: const Text('English'),
                              onTap: () {
                                Get.updateLocale(const Locale('en', 'US'));
                                Get.back();
                              },
                            ),
                            ListTile(
                              title: const Text('বাংলা'),
                              onTap: () {
                                Get.updateLocale(const Locale('bn', 'BD'));
                                Get.back();
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
