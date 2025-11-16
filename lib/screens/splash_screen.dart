import 'package:flutter/material.dart';
import 'package:h1d023004_tugas7/services/storage_service.dart';
import 'dart:async'; // Untuk Future.delayed

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Beri sedikit jeda agar splash screen terlihat
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = await StorageService.getLoginStatus();

    if (mounted) { // Pastikan widget masih ada di tree
      if (isLoggedIn) {
        // Jika sudah login, arahkan ke Home
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Jika belum login, arahkan ke Login
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.deepPurple,
            ),
            SizedBox(height: 20),
            Text('Memuat...'),
          ],
        ),
      ),
    );
  }
}