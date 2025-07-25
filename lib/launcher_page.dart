
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LauncherPage extends StatefulWidget {
  static const String routeName = '/launcher';
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    /*bool isLoggedIn = await AuthService.isLoggedIn(context);
    if (isLoggedIn) {
      Navigator.pushNamedAndRemoveUntil(context, IndexScreen.routeName, (route) => false,);
    } else {
      Navigator.pushReplacementNamed(context, LoginPage.routeName);
    }*/
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('City Cycle Rental',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                fontFamily: 'Roboto',
                color: Colors.white,
              ),
            ),
            LoadingAnimationWidget.progressiveDots(
              color: Color(0xFF03a9ff),
              size: 60,
            ),
          ],
        ),
      ),
    );
  }
}
