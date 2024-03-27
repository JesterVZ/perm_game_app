import 'dart:io';

import 'package:flutter/material.dart';
import 'package:perm_game_app/core/http_override.dart';
import 'package:perm_game_app/di/injection_container.dart';
import 'package:perm_game_app/main_menu/presentation/main_menu_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  HttpOverrides.global = AppHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Perm Game',
      theme: ThemeData(
        colorSchemeSeed: Colors.red,

        useMaterial3: true,
      ),
      home: const MainMenuPage(),
    );
  }
}