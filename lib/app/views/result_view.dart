// import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../controllers/home_controller.dart';
// import 'widgets/neumorphic_card.dart';
//
// class ResultView extends StatefulWidget {
//   const ResultView({super.key});
//
//   @override
//   State<ResultView> createState() => _ResultViewState();
// }
//
// class _ResultViewState extends State<ResultView> {
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       builder: (c) {
//         return Scaffold(
//           appBar: PreferredSize(
//             preferredSize: const Size.fromHeight(60),
//             child: Neumorphic(
//               style: const NeumorphicStyle(depth: 4),
//               child: AppBar(
//                 title: Text('Result'.tr),
//                 centerTitle: true,
//                 elevation: 0,
//                 backgroundColor: NeumorphicColors.background,
//                 iconTheme: const IconThemeData(color: Colors.black),
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: const EdgeInsets.all(16),
//             child: Obx(() {
//               final a = c.age.value;
//               if (a == null) {
//                 return Center(
//                   child: Text(
//                     'invalid_future'.tr,
//                     style: Get.textTheme.headlineSmall,
//                   ),
//                 );
//               }
//
//               final from = DateFormat('dd-MM-yyyy').format(c.dob.value);
//               final to = DateFormat('dd-MM-yyyy').format(c.currentDate.value);
//
//               return ListView(
//                 children: [
//                   NeumorphicCardWidget(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text('Your Age', style: Get.textTheme.titleLarge),
//                         const SizedBox(height: 8),
//                         Text('Date From : $from'),
//                         Text('Date To : $to'),
//                         const SizedBox(height: 12),
//                         Center(
//                           child: Text(
//                             '${a.years} ${'years'.tr}  ${a.months} ${'months'.tr}  ${a.days} ${'days'.tr}',
//                             style: Get.textTheme.headlineMedium,
//                           ),
//                         ),
//                         const SizedBox(height: 16),
//                         const Divider(),
//                         ListTile(title: const Text('Total Years'), trailing: Text('${a.years}')),
//                         ListTile(title: const Text('Total Months'), trailing: Text('${a.totalMonths}')),
//                         ListTile(title: const Text('Total Days (approx)'), trailing: Text('${a.totalDays}')),
//                         ListTile(title: const Text('Total Hours'), trailing: Text('${a.totalHours}')),
//                         ListTile(title: const Text('Total Minutes'), trailing: Text('${a.totalMinutes}')),
//                         ListTile(title: const Text('Total Seconds'), trailing: Text('${a.totalSeconds}')),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   NeumorphicCardWidget(
//                     child: ListTile(
//                       title: const Text('Next Birthday'),
//                       subtitle: Text(_nextBirthdayText(c)),
//                     ),
//                   ),
//                 ],
//               );
//             }),
//           ),
//         );
//       },
//     );
//   }
//
//   String _nextBirthdayText(HomeController c) {
//     final now = c.currentDate.value;
//     DateTime nextBirthday = DateTime(now.year, c.dob.value.month, c.dob.value.day);
//
//     if (nextBirthday.isBefore(now) || nextBirthday.isAtSameMomentAs(now)) {
//       nextBirthday = DateTime(now.year + 1, c.dob.value.month, c.dob.value.day);
//     }
//
//     final diff = nextBirthday.difference(now).inDays;
//     return "$diff days left (${DateFormat('dd MMM yyyy').format(nextBirthday)})";
//   }
// }
