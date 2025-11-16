import 'package:flutter/material.dart';
import 'package:h1d023004_tugas7/widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 4.0,
        backgroundColor: Colors.deepPurple.shade600,
        foregroundColor: Colors.white,
      ),
      drawer: const AppDrawer(), // Drawer yang sudah kita buat
      body: ListView(
        // Kita gunakan ListView agar bisa di-scroll jika kontennya panjang
        children: [
          _buildProfileHeader(), // Widget helper untuk header
          const SizedBox(height: 24),
          _buildInfoCard(), // Widget helper untuk card info
        ],
      ),
    );
  }

  // WIDGET UNTUK BAGIAN HEADER (AVATAR, NAMA, EMAIL)
  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            // Ganti dengan gambar profil jika ada
            child: Icon(
              Icons.person,
              size: 60,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'User Admin', // Ganti dengan nama user
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF333333),
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'admin@project.com', // Ganti dengan email user
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            icon: const Icon(Icons.edit_outlined, size: 18),
            label: const Text('Edit Profile'),
            onPressed: () {
              // Tambahkan logika untuk edit profile di sini
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // WIDGET UNTUK KARTU INFORMASI & AKSI
  Widget _buildInfoCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Akun',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800],
                ),
              ),
              const SizedBox(height: 10),
              // ListTile untuk Role
              _buildInfoTile(
                icon: Icons.shield_outlined,
                title: 'Role',
                subtitle: 'Admin',
              ),
              // ListTile untuk Tanggal Bergabung
              _buildInfoTile(
                icon: Icons.calendar_today_outlined,
                title: 'Tanggal Bergabung',
                subtitle: '16 November 2025',
              ),
              const Divider(height: 32),
              Text(
                'Pengaturan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple[800],
                ),
              ),
              // ListTile untuk Aksi Ganti Password
              _buildActionTile(
                icon: Icons.lock_outline,
                title: 'Ganti Password',
                onTap: () {
                  // Logika untuk ganti password
                },
              ),
              // ListTile untuk Aksi Notifikasi
              _buildActionTile(
                icon: Icons.notifications_outlined,
                title: 'Notifikasi',
                onTap: () {
                  // Logika untuk pengaturan notifikasi
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget helper untuk ListTile informasi statis
  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(subtitle, style: const TextStyle(fontSize: 15)),
    );
  }

  // Widget helper untuk ListTile yang bisa diklik (aksi)
  Widget _buildActionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: Colors.deepPurple),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}