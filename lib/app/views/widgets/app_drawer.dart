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
            Text('Age Calculator', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            tile(Icons.home, 'Home', '/'),
            tile(Icons.list, 'Saved', '/saved'),
            tile(Icons.settings, 'Settings', '/settings'),
            tile(Icons.info, 'About', '/about'),
            const Spacer(),
            Center(child: ListTile(title: Text('v1.0.0'))),
          ],
        ),
      ),
    );
  }
}
