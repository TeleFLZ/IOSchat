import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'ui/splash_screen.dart';
import 'ui/login_screen.dart';
import 'ui/home_tab.dart';
import 'ui/custom_theme.dart';

void main() => runApp(TelegramIosApp());

class TelegramIosApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState()..init(),
      child: Consumer<AppState>(
        builder: (_, state, __) {
          return MaterialApp(
            title: 'Telegram iOS',
            theme: iosLightTheme,
            darkTheme: iosDarkTheme,
            themeMode: state.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: state.isLoggedIn ? HomeTab() : const SplashScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
