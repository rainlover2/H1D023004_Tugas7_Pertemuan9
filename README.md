# SS dan Penjelasan Kode #
# 1. login screen.dart
Ini adalah StatefulWidget karena ia perlu "mengingat" apa yang diketik pengguna di dalam TextEditingController.
Stack: Widget ini digunakan untuk menumpuk elemen. Kita menumpuk _buildBackgroundGradient() (latar belakang ungu) di bagian bawah dan _buildLoginForm() (kotak form putih) di atasnya.
_login(): Fungsi ini dipanggil saat tombol "Login" ditekan.
Logika Inti: if (_usernameController.text == 'admin' && ...): Ini adalah simulasi login.
Jika Sukses: Panggil StorageService.saveLoginStatus(true) untuk menyimpan status, lalu Navigator.pushReplacementNamed(context, '/home') untuk pindah ke dashboard.
Jika Gagal: Tampilkan SnackBar (pesan error di bawah layar).

# 2. home_screen.dart
Ini adalah StatelessWidget karena halaman ini hanya bertugas menampilkan informasi. Tidak ada data yang berubah di halaman ini (berbeda dengan toggles di Settings).
Scaffold: Kerangka dasar halaman yang memiliki appBar (atas) dan body (tengah).
drawer: const AppDrawer(): Di sinilah kita memanggil dan menampilkan widget side menu yang kita buat tadi.
ListView: Membuat halaman bisa di-scroll ke bawah.
_buildWelcomeHeader() dan _buildDashboardCard(): Ini adalah fungsi helper yang kita buat agar kode di build() tetap bersih dan rapi. Mereka hanya mengembalikan Widget.

# 3. profile_screen.dart
Sama seperti HomeScreen, ini adalah StatelessWidget yang hanya menampilkan data.
Strukturnya mirip: Scaffold -> appBar -> drawer: const AppDrawer() -> body.
_buildProfileHeader(): Fungsi helper untuk bagian atas (Avatar, nama, tombol "Edit Profile").
_buildInfoCard(): Fungsi helper untuk Card yang berisi ListTile (menu-menu di bawahnya).

# 4. settings_screen.dart
Ini adalah StatefulWidget! Kenapa? Karena halaman ini perlu mengingat status dari toggles (apakah _isDarkMode sedang true atau false).
bool _isDarkMode = false; dst.: Ini adalah variabel "state" atau "memori" yang disimpan oleh halaman ini.
setState(() { ... }): Ini adalah perintah paling penting di StatefulWidget. Saat toggle digeser, kita memanggil setState dan mengubah nilai variabel (misal _isDarkMode = newValue). setState memberi tahu Flutter untuk "menggambar ulang" halaman dengan nilai yang baru.

_buildSwitchTile(): Fungsi helper yang menggunakan SwitchListTile. Ini adalah widget bawaan Flutter yang sangat praktis untuk membuat baris menu yang memiliki tombol geser (Switch).
_buildSectionHeader(): Hanya widget Text biasa untuk memberi judul "UMUM", "NOTIFIKASI", dll.

<img width="465" height="1076" alt="Screenshot 2025-11-16 160508" src="https://github.com/user-attachments/assets/70d660a8-3664-4d84-826b-15076ad9cc68" />
<img width="459" height="1075" alt="Screenshot 2025-11-16 163535" src="https://github.com/user-attachments/assets/4fd1eabb-e162-4208-b9b2-404b1b1de9a5" />
<img width="465" height="1077" alt="Screenshot 2025-11-16 163550" src="https://github.com/user-attachments/assets/2cfe14f1-b945-4a3d-8ae8-bcc6055b7938" />
<img width="470" height="1076" alt="Screenshot 2025-11-16 160525" src="https://github.com/user-attachments/assets/120549d1-741f-49a4-9cc8-6a21bac595fe" />



_buildInfoTile() dan _buildActionTile(): Fungsi helper untuk membuat ListTile (baris menu) agar kita tidak perlu mengetik kode yang sama berulang-ulang.
