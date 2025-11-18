import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/side_menu.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  Future<void> _loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => username = prefs.getString('username') ?? 'Pengguna');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
      ),
      drawer: const SideMenu(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              "Selamat datang, $username!",
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.pink.shade400,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              "Berikut rangkuman singkat dari aplikasi ini:",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: 28),

            // Section: Ringkasan fitur
            Text(
              "Fitur Aplikasi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.pink.shade400,
              ),
            ),
            const SizedBox(height: 12),

            _featureCard(
              title: "Login dan Penyimpanan Akun",
              description:
                  "Aplikasi ini menyimpan username pengguna menggunakan SharedPreferences sehingga tetap tersimpan ketika aplikasi dibuka kembali.",
              icon: Icons.lock_open_rounded,
            ),
            const SizedBox(height: 14),

            _featureCard(
              title: "Navigasi Menggunakan Route",
              description:
                  "Setiap halaman terhubung menggunakan Named Routes untuk mempermudah pengembangan dan pemeliharaan aplikasi.",
              icon: Icons.route_rounded,
            ),
            const SizedBox(height: 14),

            _featureCard(
              title: "Tampilan dengan Side Menu",
              description:
                  "Drawer digunakan sebagai menu navigasi utama yang berisi akses cepat ke Beranda, Profil, dan Tentang.",
              icon: Icons.menu_open_rounded,
            ),

            const SizedBox(height: 28),

            // Section tambahan
            Text(
              "Informasi Aplikasi",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.pink.shade400,
              ),
            ),
            const SizedBox(height: 12),

            _infoBox(
              "Aplikasi ini dibuat sebagai bagian dari tugas pemrograman mobile.",
            ),

            const SizedBox(height: 24),

            _infoBox(
              "Struktur kode dibagi ke beberapa file seperti routes, pages, widgets, dan theme "
              "untuk menjaga kerapian dan keterbacaan.",
            ),

            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  // Kartu fitur
  Widget _featureCard({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.pink.shade100),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 28, color: Colors.pink.shade300),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600)),
                const SizedBox(height: 6),
                Text(description, style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Box informasi tambahan
  Widget _infoBox(String text) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.pink.shade50,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.pink.shade100),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
