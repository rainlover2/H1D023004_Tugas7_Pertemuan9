import 'package:flutter/material.dart';
// Ganti 'proyek_flutter_lengkap' dengan nama proyek Anda
import 'package:h1d023004_tugas7/screens/home_screen.dart';
import 'package:h1d023004_tugas7/screens/login_screen.dart';
import 'package:h1d023004_tugas7/screens/profile_screen.dart';
import 'package:h1d023004_tugas7/screens/settings_screen.dart';
import 'package:h1d023004_tugas7/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, // Menghilangkan banner "DEBUG"
      theme: ThemeData(
        // Kita gunakan tema warna ungu yang elegan
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Atur warna latar belakang default aplikasi
        scaffoldBackgroundColor: const Color(0xFFF4F7FC),
      ),
      // initialRoute menentukan rute pertama yang dibuka
      initialRoute: '/',
      // routes mendefinisikan semua rute yang bisa diakses di aplikasi
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}