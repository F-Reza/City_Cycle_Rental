import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home.dart';
import 'launcher_page.dart';
import 'login.dart';
import 'onboarding.dart';
import 'profile.dart';
import 'registration.dart';

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
          backgroundColor: const Color(0xFF2D2E3A),
          iconTheme: const IconThemeData(color: Colors.white),
          elevation: 0, // Removes shadow if any
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2D2E3A),),
        useMaterial3: true,
      ),
      initialRoute: LoginScreen.routeName,
      routes: {
        LauncherPage.routeName : (_) => const LauncherPage(),
        OnboardingScreen.routeName : (_) => const OnboardingScreen(),
        RegistrationScreen.routeName : (_) => const RegistrationScreen(),
        LoginScreen.routeName : (_) => const LoginScreen(),
        HomeScreen.routeName : (_) => const HomeScreen(),
        UserProfile.routeName : (_) => const UserProfile(),
      },
    );
  }
}
