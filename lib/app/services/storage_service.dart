import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/dob_model.dart';

class StorageService {
  static const _key = 'recent_dobs';
  late SharedPreferences _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  List<DOBModel> getRecent() {
    final list = _prefs.getStringList(_key) ?? [];
    return list.map((s) => DOBModel.fromJson(Map<String, dynamic>.from(jsonDecode(s)))).toList();
  }

  Future<void> save(DOBModel item) async {
    final list = _prefs.getStringList(_key) ?? [];
    list.insert(0, jsonEncode(item.toJson()));
    // keep max 20
    final trimmed = list.take(20).toList();
    await _prefs.setStringList(_key, trimmed);
  }

  Future<void> clear() async {
    await _prefs.remove(_key);
  }
}
