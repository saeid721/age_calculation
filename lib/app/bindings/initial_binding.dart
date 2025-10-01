import 'package:get/get.dart';
import '../controllers/age_controller.dart';
import '../services/storage_service.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StorageService>(() => StorageService());
    Get.lazyPut<AgeController>(() => AgeController());
  }

  static Future<void> initServices() async {
    final storage = StorageService();
    await storage.init();
    Get.put<StorageService>(storage, permanent: true);
  }
}
