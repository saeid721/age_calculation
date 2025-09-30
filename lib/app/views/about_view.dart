import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Neumorphic(
          style: const NeumorphicStyle(depth: 4),
          child: AppBar(
            title: Text('About'.tr),
            centerTitle: true,
            elevation: 0,
            backgroundColor: NeumorphicColors.background,
            iconTheme: const IconThemeData(color: Colors.black),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('about_text'.tr),
      ),
    );
  }
}
