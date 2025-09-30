// import 'dart:async';
// import 'package:get/get.dart';
// import 'package:intl/intl.dart';
// import '../models/dob_model.dart';
// import '../services/storage_service.dart';
// import '../utils/age_utils.dart';
//
// class AgeController extends GetxController {
//   final StorageService _storage = Get.find<StorageService>();
//
//   final Rx<DateTime> selectedDob = DateTime.now().obs;
//   final Rx<Duration> offset = Duration.zero.obs; // timezone offset from device if user selects
//   final RxBool live = false.obs;
//   final RxBool includeSeconds = true.obs;
//   final RxString dateFormat = 'dd-MM-yyyy'.obs;
//   final RxString tzName = ''.obs;
//
//   Timer? _ticker;
//   Rx<AgeResult?> ageResult = Rxn<AgeResult>();
//
//   @override
//   void onInit() {
//     super.onInit();
//     //_initTimezone();
//   }
//
//   // Future<void> _initTimezone() async {
//   //   try {
//   //     final name = await FlutterNativeTimezone.getLocalTimezone();
//   //     tzName.value = name;
//   //   } catch (e) {
//   //     tzName.value = 'UTC';
//   //   }
//   // }
//
//   void setDob(DateTime dt) {
//     selectedDob.value = dt;
//     compute();
//   }
//
//   void setLive(bool value) {
//     live.value = value;
//     if (value) startTicker();
//     else stopTicker();
//   }
//
//   void startTicker() {
//     stopTicker();
//     _ticker = Timer.periodic(const Duration(seconds: 1), (_) => compute());
//   }
//
//   void stopTicker() {
//     _ticker?.cancel();
//     _ticker = null;
//   }
//
//   void setIncludeSeconds(bool val) {
//     includeSeconds.value = val;
//     compute();
//   }
//
//   void setDateFormat(String fmt) {
//     dateFormat.value = fmt;
//   }
//
//   List<DOBModel> getRecent() => _storage.getRecent();
//
//   Future<void> saveCurrent(String? label) async {
//     await _storage.saveDob(DOBModel(dateTime: selectedDob.value, label: label));
//   }
//
//   void setTimezoneOffset(Duration newOffset) {
//     offset.value = newOffset;
//     compute();
//   }
//
//   void compute() {
//     final now = DateTime.now().toUtc().add(offset.value);
//     final dob = selectedDob.value.toUtc().add(offset.value);
//     if (dob.isAfter(now)) {
//       ageResult.value = null;
//       return;
//     }
//     final result = computeAge(dob, now);
//     ageResult.value = result;
//   }
//
//   String formatSelectedDob() {
//     final dt = selectedDob.value;
//     final f = DateFormat(dateFormat.value);
//     return f.format(dt);
//   }
//
//   String friendly(AgeResult? r) {
//     if (r == null) return '';
//     return '${r.years}y ${r.months}m ${r.days}d ${r.hours}h ${r.minutes}m${includeSeconds.value ? ' ${r.seconds}s' : ''}';
//   }
//
//   @override
//   void onClose() {
//     stopTicker();
//     super.onClose();
//   }
// }
