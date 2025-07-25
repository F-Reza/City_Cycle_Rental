import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'launcher_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'City Cycle Rental',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
          ),
          foregroundColor: Colors.white,
          backgroundColor: const Color(0xFF03a9ff),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0, // Removes shadow if any
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF03a9ff),),
        useMaterial3: true,
      ),
      initialRoute: LauncherPage.routeName,
      routes: {
        LauncherPage.routeName : (_) => const LauncherPage(),
      },
    );
  }
}
