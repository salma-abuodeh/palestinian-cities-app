import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home_screen.dart';
import 'screens/jerusalem_screen.dart';
import 'screens/bethlehem_screen.dart';
import 'screens/hebron_screen.dart';
import 'screens/nablus_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palestine Cities Explorer',
      debugShowCheckedModeBanner: false,
      theme: buildAppTheme(),
      initialRoute: '/',
      routes: {
        '/':           (context) => const HomeScreen(),
        '/jerusalem':  (context) => const JerusalemScreen(),
        '/bethlehem':  (context) => const BethlehemScreen(),
        '/hebron':     (context) => const HebronScreen(),
        '/nablus':     (context) => const NablusScreen(),
      },
    );
  }
}
