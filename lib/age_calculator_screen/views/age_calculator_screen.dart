import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/age_controller.dart';

class AgeCalculatorScreen extends StatelessWidget {
  const AgeCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AgeController>(builder: (ageController) {
      return Scaffold(
        backgroundColor: Color(0xFFDDE6E8),
        //drawer: const CustomDrawer(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Neumorphic(
            style: const NeumorphicStyle(depth: 4),
            child: AppBar(
              title: const Text('Age Calculator', style: TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF607D8B))),
              centerTitle: true,
              elevation: 0,
              backgroundColor: NeumorphicColors.background,
              iconTheme: const IconThemeData(color: Colors.black),
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 15),
              Center(
                child: Image.asset(
                  "assets/images/family.png",
                  height: 150,
                  width: Get.width,
                  fit: BoxFit.cover,
                ),
              ),
              const Text(
                "Calculate Your Age",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF607D8B)),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),

              // Current Date Picker
              _dateTile(
                title: "Current Date",
                date: ageController.currentDate,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: ageController.currentDate,
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                  );
                  if (picked != null) ageController.setCurrentDate(picked);
                },
              ),
              const SizedBox(height: 15),

              // DOB Picker
              _dateTile(
                title: "Date of Birth",
                date: ageController.dateOfBirth,
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: ageController.dateOfBirth,
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) ageController.setDob(picked);
                },
              ),
              const SizedBox(height: 20),

              // Calculate Button
              Center(
                child: NeumorphicButton(
                  onPressed: ageController.calculateAge,
                  style: NeumorphicStyle(
                    color: Color(0xB3FFFFFF),
                    boxShape: NeumorphicBoxShape.roundRect(
                      BorderRadius.circular(12),
                    ),
                  ),
                  padding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.calculate, color: Color(0xFF607D8B)),
                      SizedBox(width: 10),
                      Text("Calculate Age",
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF607D8B))),
                    ],
                  ),
                ),
              ),

              // Result
              if (ageController.showResult) ...[
                const SizedBox(height: 20),
                if (ageController.age == null)
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
                              // Text('Your Age',
                              //     style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF607D8B))),
                              // const SizedBox(height: 8),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     RichText(
                              //       text: TextSpan(
                              //         style: TextStyle(color: Colors.black, fontSize: 16),
                              //         children: [
                              //           TextSpan(
                              //             text: 'Birth Date: ',
                              //             style: TextStyle(fontWeight: FontWeight.w500),
                              //           ),
                              //           TextSpan(
                              //             text: DateFormat('dd-MM-yyyy').format(ageController.dateOfBirth),
                              //             style: TextStyle(fontWeight: FontWeight.normal),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //     RichText(
                              //       text: TextSpan(
                              //         style: TextStyle(color: Colors.black, fontSize: 16),
                              //         children: [
                              //           TextSpan(
                              //             text: 'Current Date: ',
                              //             style: TextStyle(fontWeight: FontWeight.w500),
                              //           ),
                              //           TextSpan(
                              //             text: DateFormat('dd-MM-yyyy').format(ageController.currentDate),
                              //             style: TextStyle(fontWeight: FontWeight.normal),
                              //           ),
                              //         ],
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              //
                              // const SizedBox(height: 12),
                              Center(
                                child: Text('${ageController.age!.years} years  ${ageController.age!.months} months  ${ageController.age!.days} days',
                                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                  minTileHeight: 16,
                                  minVerticalPadding: 0,
                                  title: const Text('Total Years'),
                                  trailing: Text('${ageController.age!.years}',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                              ListTile(
                                  minTileHeight: 16,
                                  minVerticalPadding: 0,
                                  title: const Text('Total Months'),
                                  trailing: Text('${ageController.age!.totalMonths}',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                              ListTile(
                                  minTileHeight: 16,
                                  minVerticalPadding: 0,
                                  title: const Text('Total Days (approx)'),
                                  trailing: Text('${ageController.age!.totalDays}',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                              ListTile(
                                  minTileHeight: 16,
                                  minVerticalPadding: 0,
                                  title: const Text('Total Hours'),
                                  trailing: Text('${ageController.age!.totalHours}',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                              ListTile(
                                  minTileHeight: 16,
                                  minVerticalPadding: 0,
                                  title: const Text('Total Minutes'),
                                  trailing: Text('${ageController.age!.totalMinutes}',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                              ListTile(
                                  minTileHeight: 16,
                                  minVerticalPadding: 0,
                                  title: const Text('Total Seconds'),
                                  trailing: Text('${ageController.age!.totalSeconds}',
                                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
                              ListTile(
                                minTileHeight: 16,
                                title: const Text('Live Ticking'),
                                minVerticalPadding: 0,
                                trailing: Text(
                                  '${ageController.age!.hours.toString().padLeft(2, '0')} : '
                                      '${ageController.age!.minutes.toString().padLeft(2, '0')} : '
                                      '${ageController.age!.seconds.toString().padLeft(2, '0')}',
                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // ✅ Next Birthday with H:M:S
                      Neumorphic(
                        style: const NeumorphicStyle(depth: 4),
                        child: ListTile(
                          title: const Text('Next Birthday'),
                          subtitle: Text(_nextBirthdayText(ageController)),
                        ),
                      ),

                      const SizedBox(height: 20),
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
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          // Expanded(
          //   child: Text(
          //     //"$title\n${DateFormat('dd-MM-yyyy EEEE').format(date)}",
          //     "$title: ${DateFormat('dd-MM-yyyy').format(date)}",
          //     style: const TextStyle(fontSize: 16),
          //   ),
          // ),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black),
                children: [
                  TextSpan(
                    text: "$title: ",
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: DateFormat('dd-MM-yyyy').format(date),
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
          ),

          NeumorphicButton(
            onPressed: onTap,
            style: const NeumorphicStyle(
              color: NeumorphicColors.background,
              boxShape: NeumorphicBoxShape.circle(),
              depth: 4,
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.calendar_today, color: Color(0xFF607D8B), size: 20),
          ),
        ],
      ),
    );
  }

  String _nextBirthdayText(AgeController c) {
    final now = c.currentDate;
    DateTime nextBirthday = DateTime(now.year, c.dateOfBirth.month, c.dateOfBirth.day,
        c.dateOfBirth.hour, c.dateOfBirth.minute, c.dateOfBirth.second);

    if (nextBirthday.isBefore(now) || nextBirthday.isAtSameMomentAs(now)) {
      nextBirthday = DateTime(now.year + 1, c.dateOfBirth.month, c.dateOfBirth.day,
          c.dateOfBirth.hour, c.dateOfBirth.minute, c.dateOfBirth.second);
    }

    final diff = nextBirthday.difference(now);
    final days = diff.inDays;
    final hours = diff.inHours % 24;
    final minutes = diff.inMinutes % 60;
    final seconds = diff.inSeconds % 60;

    return "$days days, ${hours.toString().padLeft(2,'0')}h "
        "${minutes.toString().padLeft(2,'0')}m "
        "${seconds.toString().padLeft(2,'0')}s left "
        "(${DateFormat('dd MMM yyyy').format(nextBirthday)})";
  }
}
