// lib/widgets/app_drawer.dart
import 'package:flutter/material.dart';
import 'package:h1d023004_tugas7/services/storage_service.dart'; 

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  Future<void> _logout(BuildContext context) async {
    await StorageService.clearLoginStatus();
    if (context.mounted) {
      // Kembali ke login dan hapus semua rute sebelumnya
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    // Ini penting: Dapatkan nama rute saat ini untuk menandai item aktif
    final String? currentRoute = ModalRoute.of(context)?.settings.name;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // Ganti DrawerHeader lama dengan UserAccountsDrawerHeader
          _buildDrawerHeader(context),
          
          _buildDrawerItem(
            context: context,
            icon: Icons.home_rounded,
            text: 'Home',
            route: '/home',
            currentRoute: currentRoute,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.person_rounded,
            text: 'Profile',
            route: '/profile',
            currentRoute: currentRoute,
          ),
          _buildDrawerItem(
            context: context,
            icon: Icons.settings_rounded,
            text: 'Settings',
            route: '/settings',
            currentRoute: currentRoute,
          ),
          
          const Divider(thickness: 1, indent: 16, endIndent: 16),
          
          ListTile(
            leading: const Icon(Icons.logout_rounded, color: Colors.redAccent),
            title: const Text(
              'Logout',
              style: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              _logout(context);
            },
          ),
        ],
      ),
    );
  }

  // WIDGET HEADER DRAWER YANG BARU
  Widget _buildDrawerHeader(BuildContext context) {
    return UserAccountsDrawerHeader(
      accountName: const Text(
        'User Admin',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      accountEmail: const Text('admin@project.com'),
      currentAccountPicture: const CircleAvatar(
        backgroundColor: Colors.white,
        child: Text(
          'A',
          style: TextStyle(fontSize: 40.0, color: Colors.deepPurple),
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade600,
      ),
    );
  }

  // WIDGET ITEM MENU KUSTOM (AGAR BISA DI-HIGHLIGHT)
  Widget _buildDrawerItem({
    required BuildContext context,
    required IconData icon,
    required String text,
    required String route,
    String? currentRoute,
  }) {
    // Cek apakah item ini adalah rute yang sedang aktif
    final bool isSelected = (currentRoute == route);

    return Container(
      // Tambahkan dekorasi (background) jika item sedang aktif
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? Colors.deepPurple.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Icon(icon, color: isSelected ? Colors.deepPurple : Colors.grey[700]),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? Colors.deepPurple : Colors.black87,
          ),
        ),
        onTap: () {
          Navigator.pop(context); // Tutup drawer
          if (!isSelected) {
            // Hanya pindah jika rutenya beda
            Navigator.pushReplacementNamed(context, route);
          }
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}