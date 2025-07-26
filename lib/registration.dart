import 'package:flutter/material.dart';

class RegistrationScreen extends StatelessWidget {
  static const String routeName = '/registration';
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Registration Screen',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to home screen
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Go to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
