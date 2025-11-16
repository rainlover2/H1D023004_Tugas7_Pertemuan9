// lib/screens/home_screen.dart
import 'package:flutter/material.dart';
import 'package:h1d023004_tugas7/widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        // Beri sedikit bayangan pada AppBar
        elevation: 4.0, 
        // Samakan warna dengan tema
        backgroundColor: Colors.deepPurple.shade600, 
        // Warna ikon dan teks di AppBar
        foregroundColor: Colors.white, 
      ),
      drawer: const AppDrawer(),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildWelcomeHeader(),
          const SizedBox(height: 24),
          _buildDashboardCard(
            context: context,
            icon: Icons.people_alt_rounded,
            title: 'Total Pengguna',
            value: '1,204',
            color: Colors.orange.shade700,
          ),
          const SizedBox(height: 16),
          _buildDashboardCard(
            context: context,
            icon: Icons.shopping_cart_rounded,
            title: 'Penjualan Hari Ini',
            value: '82',
            color: Colors.green.shade600,
          ),
          const SizedBox(height: 16),
          _buildDashboardCard(
            context: context,
            icon: Icons.error_outline_rounded,
            title: 'Laporan Masuk',
            value: '5',
            color: Colors.red.shade600,
          ),
        ],
      ),
    );
  }

  // WIDGET UNTUK SAMBUTAN
  Widget _buildWelcomeHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selamat Datang, Admin!',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF333333),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  // WIDGET KUSTOM UNTUK KARTU DASHBOARD
  Widget _buildDashboardCard({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.1),
              child: Icon(icon, size: 30, color: color),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}