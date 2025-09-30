import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/home_controller.dart';
import 'widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (homeController) {
      return Scaffold(
        drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Neumorphic(
            style: const NeumorphicStyle(depth: 4),
            child: AppBar(
              title: const Text('Age Calculator'),
              centerTitle: true,
              elevation: 0,
              backgroundColor: NeumorphicColors.background,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  "assets/images/family.png",
                  height: 200,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Calculate Your Age",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),

              // ✅ Current Date Picker
              _dateTile(
                title: "Current Date",
                date: homeController.currentDate,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: homeController.currentDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) homeController.setCurrentDate(picked);
                },
              ),
              const SizedBox(height: 20),

              // ✅ DOB Picker
              _dateTile(
                title: "Date of Birth",
                date: homeController.dateOfBirth,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: homeController.dateOfBirth,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) homeController.setDob(picked);
                },
              ),
              const SizedBox(height: 30),

              // ✅ Calculate Button
              Center(
                child: NeumorphicButton(
                  onPressed: homeController.calculateAge,
                  style: NeumorphicStyle(
                    color: Colors.blue.shade100,
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.calculate, color: Colors.black),
                      SizedBox(width: 10),
                      Text("Calculate Age",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // ✅ Settings
              Neumorphic(
                style: const NeumorphicStyle(depth: 4),
                child: ListTile(
                  title: const Text('Live ticking'),
                  trailing: NeumorphicSwitch(
                    value: homeController.live,
                    onChanged: homeController.toggleLive,
                  ),
                ),
              ),

              // ✅ Result
              if (homeController.showResult) ...[
                const SizedBox(height: 30),
                if (homeController.age == null)
                  Text('Invalid: DOB is after Current Date!',
                      style: Get.textTheme.headlineSmall)
                else
                  Column(
                    children: [
                      Neumorphic(
                        style: const NeumorphicStyle(depth: 4),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Your Age', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Birth Date : ${DateFormat('dd-MM-yyyy').format(homeController.dateOfBirth)}'),
                                  Text('Current Date : ${DateFormat('dd-MM-yyyy').format(homeController.currentDate)}'),
                                ],
                              ),
                              const SizedBox(height: 12),
                              Center(
                                child: Text(
                                  '${homeController.age!.years} years  ${homeController.age!.months} months  ${homeController.age!.days} days',
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                  minTileHeight: 16,
                                  title: const Text('Total Years'),
                                  trailing: Text('${homeController.age!.years}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                              ListTile(
                                  minTileHeight: 16,
                                  title: const Text('Total Months'),
                                  trailing: Text('${homeController.age!.totalMonths}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                              ListTile(
                                  minTileHeight: 16,
                                  title: const Text('Total Days (approx)'),
                                  trailing: Text('${homeController.age!.totalDays}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                              ListTile(
                                  minTileHeight: 16,
                                  title: const Text('Total Hours'),
                                  trailing: Text('${homeController.age!.totalHours}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                              ListTile(
                                  minTileHeight: 16,
                                  title: const Text('Total Minutes'),
                                  trailing: Text('${homeController.age!.totalMinutes}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                              ListTile(
                                  minTileHeight: 16,
                                  title: const Text('Total Seconds'),
                                  trailing: Text('${homeController.age!.totalSeconds}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold))),
                              ListTile(
                                minTileHeight: 16,
                                  title: const Text('Live Ticking'),
                                  trailing: Text(
                                    '${homeController.age!.hours.toString().padLeft(2, '0')} : '
                                        '${homeController.age!.minutes.toString().padLeft(2, '0')} : '
                                        '${homeController.age!.seconds.toString().padLeft(2, '0')}',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                  ),),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Neumorphic(
                        style: const NeumorphicStyle(depth: 4),
                        child: ListTile(
                          title: const Text('Next Birthday'),
                          subtitle: Text(_nextBirthdayText(homeController)),
                        ),
                      ),
                    ],
                  ),
              ],
            ],
          ),
        ),
      );
    });
  }

  Widget _dateTile({
    required String title,
    required DateTime date,
    required VoidCallback onTap,
  }) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: 4,
        color: NeumorphicColors.background,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(12),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "$title\n${DateFormat('dd-MM-yyyy EEEE').format(date)}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
          NeumorphicButton(
            onPressed: onTap,
            style: NeumorphicStyle(
              color: NeumorphicColors.background,
              boxShape: NeumorphicBoxShape.roundRect(
                BorderRadius.circular(12),
              ),
            ),
            child: const Icon(Icons.calendar_today),
          ),
        ],
      ),
    );
  }

  String _nextBirthdayText(HomeController c) {
    final now = c.currentDate;
    DateTime nextBirthday = DateTime(now.year, c.dateOfBirth.month, c.dateOfBirth.day);

    if (nextBirthday.isBefore(now) || nextBirthday.isAtSameMomentAs(now)) {
      nextBirthday = DateTime(now.year + 1, c.dateOfBirth.month, c.dateOfBirth.day);
    }

    final diff = nextBirthday.difference(now).inDays;
    return "$diff days left (${DateFormat('dd MMM yyyy').format(nextBirthday)})";
  }
}
