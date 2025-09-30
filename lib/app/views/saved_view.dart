import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (c) {
        final items = c.getRecent();
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Neumorphic(
              style: const NeumorphicStyle(depth: 4),
              child: AppBar(
                title: Text('Saved'.tr),
                centerTitle: true,
                elevation: 0,
                backgroundColor: NeumorphicColors.background,
                iconTheme: const IconThemeData(color: Colors.black),
              ),
            ),
          ),
          body: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemBuilder: (_, i) {
              final it = items[i];
              return Neumorphic(
                style: const NeumorphicStyle(depth: 4),
                child: ListTile(
                  title: Text(it.label ?? "DOB"),
                  subtitle: Text(DateFormat('dd-MM-yyyy').format(it.dateTime)),
                  trailing: IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: () {
                      c.setDob(it.dateTime);
                      c.computeAge();
                      Get.back();
                    },
                  ),
                ),
              );
            },
            separatorBuilder: (_, __) => const SizedBox(height: 8),
            itemCount: items.length,
          ),
        );
      },
    );
  }
}
