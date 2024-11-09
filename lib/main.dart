import 'package:flutter/material.dart';
import 'package:veil_application/screens/home_screen.dart';
import 'package:veil_application/screens/qr_scanner.dart';
import 'package:veil_application/utils/theme.dart';
import 'package:veil_application/screens/welcome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Veil',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Uses device's theme setting
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/home': (context) => HomeScreen(),
        '/scan': (context) => QRScannerPage(),
      },
    );
  }
}
