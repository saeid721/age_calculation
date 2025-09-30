import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget tile(IconData icon, String title, String route) {
      return ListTile(
        leading: Icon(icon),
        title: Text(title.tr),
        onTap: () {
          Get.back();
          Get.toNamed(route);
        },
      );
    }

    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12),
            CircleAvatar(radius: 36, backgroundImage: const AssetImage('assets/images/avatar.png')),
            const SizedBox(height: 8),
            Text('Age Calculator', style: Get.textTheme.titleMedium),
            const SizedBox(height: 12),
            tile(Icons.home, 'age_calculator', '/'),
            tile(Icons.list, 'saved', '/saved'),
            tile(Icons.settings, 'settings', '/settings'),
            tile(Icons.info, 'about', '/about'),
            const Spacer(),
            ListTile(title: Text('v1.0')),
          ],
        ),
      ),
    );
  }
}
