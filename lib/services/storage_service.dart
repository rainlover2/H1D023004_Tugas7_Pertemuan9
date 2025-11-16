import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const String _loginStatusKey = 'isLoggedIn';

  // Menyimpan status login
  static Future<void> saveLoginStatus(bool isLoggedIn) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_loginStatusKey, isLoggedIn);
  }

  // Mengambil status login
  static Future<bool> getLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    // Mengembalikan false jika key tidak ditemukan (default)
    return prefs.getBool(_loginStatusKey) ?? false;
  }

  // Menghapus status login (untuk logout)
  static Future<void> clearLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_loginStatusKey);
  }
}