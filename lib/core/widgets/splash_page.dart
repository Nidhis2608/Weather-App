import 'dart:async';

import 'package:flutter/material.dart';

import 'auth_gate.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(milliseconds: 1500), () {
      if (mounted) {
        Navigator.of(
          context,
        ).pushReplacement(MaterialPageRoute(builder: (_) => AuthGate()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16),

            Text('Weather App', style: Theme.of(context).textTheme.titleLarge),
          ],
        ),
      ),
    );
  }
}
