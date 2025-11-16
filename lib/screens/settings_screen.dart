// lib/screens/settings_screen.dart
import 'package:flutter/material.dart';
import 'package:h1d023004_tugas7/widgets/app_drawer.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  // Variabel untuk menyimpan status dari toggles
  bool _isDarkMode = false;
  bool _isPushNotification = true;
  bool _isEmailNotification = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 4.0,
        backgroundColor: Colors.deepPurple.shade600,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(),
      body: ListView(
        // Kita gunakan ListView untuk daftar pengaturan
        children: [
          // Bagian Umum
          _buildSectionHeader(title: 'Umum'),
          _buildSwitchTile(
            title: 'Dark Mode',
            subtitle: 'Aktifkan mode gelap',
            icon: Icons.dark_mode_outlined,
            value: _isDarkMode,
            onChanged: (bool newValue) {
              setState(() {
                _isDarkMode = newValue;
                // Di sini Anda bisa menambahkan logika untuk mengubah tema aplikasi
              });
            },
          ),
          _buildActionTile(
            title: 'Bahasa',
            subtitle: 'Indonesia',
            icon: Icons.language_outlined,
            onTap: () {
              // Logika untuk ganti bahasa
            },
          ),

          // Bagian Notifikasi
          _buildSectionHeader(title: 'Notifikasi'),
          _buildSwitchTile(
            title: 'Notifikasi Push',
            subtitle: 'Terima notifikasi di perangkat Anda',
            icon: Icons.notifications_active_outlined,
            value: _isPushNotification,
            onChanged: (bool newValue) {
              setState(() {
                _isPushNotification = newValue;
              });
            },
          ),
          _buildSwitchTile(
            title: 'Notifikasi Email',
            subtitle: 'Terima pembaruan melalui email',
            icon: Icons.email_outlined,
            value: _isEmailNotification,
            onChanged: (bool newValue) {
              setState(() {
                _isEmailNotification = newValue;
              });
            },
          ),

          // Bagian Lainnya
          _buildSectionHeader(title: 'Lainnya'),
          _buildActionTile(
            title: 'Tentang Kami',
            icon: Icons.info_outline,
            onTap: () {
              // Logika untuk halaman 'Tentang Kami'
            },
          ),
          _buildActionTile(
            title: 'Bantuan & Dukungan',
            icon: Icons.help_outline,
            onTap: () {
              // Logika untuk halaman 'Bantuan'
            },
          ),
        ],
      ),
    );
  }

  // WIDGET HELPER UNTUK JUDUL BAGIAN (SECTION)
  Widget _buildSectionHeader({required String title}) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 24.0, bottom: 8.0),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          color: Colors.deepPurple[800],
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ),
    );
  }

  // WIDGET HELPER UNTUK TOMBOL GESER (TOGGLE)
  Widget _buildSwitchTile({
    required String title,
    String? subtitle,
    required IconData icon,
    required bool value,
    required Function(bool) onChanged,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1.0,
      child: SwitchListTile(
        // Gunakan SwitchListTile yang sudah jadi
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: Colors.grey[600])) : null,
        secondary: Icon(icon, color: Colors.deepPurple),
        value: value,
        onChanged: onChanged,
        activeColor: Colors.deepPurple,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // WIDGET HELPER UNTUK MENU YANG BISA DIKLIK (AKSI)
  Widget _buildActionTile({
    required String title,
    String? subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1.0,
      child: ListTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        subtitle: subtitle != null ? Text(subtitle, style: TextStyle(color: Colors.grey[600])) : null,
        leading: Icon(icon, color: Colors.deepPurple),
        trailing: const Icon(Icons.chevron_right, color: Colors.grey),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}