import 'package:get/get.dart';
import '../views/about_view.dart';
import '../views/home_view.dart';
import '../views/saved_view.dart';
import '../views/settings_view.dart';

abstract class Routes {
  static const home = '/';
  static const saved = '/saved';
  static const settings = '/settings';
  static const about = '/about';
}

class AppPages {
  static const initial = Routes.home;

  static final routes = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.saved, page: () => const SavedView()),
    GetPage(name: Routes.settings, page: () => const SettingsView()),
    GetPage(name: Routes.about, page: () => const AboutView()),
  ];
}
