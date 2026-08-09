import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppState extends ChangeNotifier {
  bool isLoggedIn = false;
  bool isDarkMode = false;
  String currentUsername = '';
  List<Map<String, dynamic>> chats = [];
  List<Map<String, dynamic>> messages = [];

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    isLoggedIn = prefs.getBool('logged') ?? false;
    isDarkMode = prefs.getBool('dark') ?? false;
    currentUsername = prefs.getString('user') ?? '';
    if (isLoggedIn) loadMockData();
    notifyListeners();
  }

  void login(String username) async {
    currentUsername = username;
    isLoggedIn = true;
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', true);
    prefs.setString('user', username);
    loadMockData();
    notifyListeners();
  }

  void logout() async {
    isLoggedIn = false;
    currentUsername = '';
    chats.clear();
    messages.clear();
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', false);
    prefs.remove('user');
    notifyListeners();
  }

  void toggleTheme() {
    isDarkMode = !isDarkMode;
    SharedPreferences.getInstance().then((p) => p.setBool('dark', isDarkMode));
    notifyListeners();
  }

  void loadMockData() {
    chats = [
      {'name': 'Alice', 'last': 'Привет!', 'time': DateTime.now().subtract(Duration(minutes: 5)), 'unread': 2},
      {'name': 'Bob', 'last': 'Ок, завтра', 'time': DateTime.now().subtract(Duration(hours: 1)), 'unread': 0},
      {'name': 'Charlie', 'last': 'Спасибо!', 'time': DateTime.now().subtract(Duration(days: 1)), 'unread': 1},
    ];
    messages = [
      {'from': 'Alice', 'text': 'Привет!', 'time': DateTime.now().subtract(Duration(minutes: 10))},
      {'from': 'me', 'text': 'Привет! Как дела?', 'time': DateTime.now().subtract(Duration(minutes: 8))},
      {'from': 'Alice', 'text': 'Норм, ты?', 'time': DateTime.now().subtract(Duration(minutes: 5))},
    ];
  }

  void sendMessage(String text, String to) {
    messages.add({'from': 'me', 'text': text, 'time': DateTime.now()});
    notifyListeners();
  }
}
