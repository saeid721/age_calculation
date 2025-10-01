import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/age_controller.dart';
import '../controllers/home_controller.dart';

class SavedView extends StatelessWidget {
  const SavedView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgeController>(builder: (ageController) {
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
          body: Neumorphic(
            style: const NeumorphicStyle(depth: 4),
            child: ListTile(
              title: Text("DOB"),
              subtitle: Text(DateFormat('dd-MM-yyyy').format(ageController.dateOfBirth)),
              trailing: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
