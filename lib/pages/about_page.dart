import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tentang Aplikasi")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER: Judul + Deskripsi singkat
            Text(
              "H1D023114 — Tugas 7",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.pink.shade400,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              "Aplikasi Flutter dengan fitur Login, Routes, Side Menu, dan Local Storage",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            const SizedBox(height: 28),

            // CARD: Fitur Utama
            _sectionTitle("Fitur Utama"),
            const SizedBox(height: 8),
            _infoCard([
              "Login sederhana dengan validasi form",
              "Penyimpanan username menggunakan SharedPreferences",
              "Navigasi antar halaman menggunakan Named Routes",
              "Side Menu (Drawer) dengan avatar dinamis",
            ]),

            const SizedBox(height: 24),

            // CARD: Tujuan
            _sectionTitle("Tujuan Pembuatan"),
            const SizedBox(height: 8),
            _infoCard([
              "Mengenalkan konsep manajemen state sederhana (setState).",
              "Memahami struktur navigasi Flutter.",
              "Mengimplementasikan penyimpanan lokal.",
              "Melatih konsistensi desain antar halaman.",
            ]),

            const SizedBox(height: 24),

            // CARD: Teknologi yang dipakai
            _sectionTitle("Teknologi yang Digunakan"),
            const SizedBox(height: 8),
            _infoCard([
              "Flutter 3.x",
              "Dart",
              "Google Fonts",
              "Shared Preferences",
              "Material 3",
            ]),

            const SizedBox(height: 24),

            // CARD: Identitas Pembuat
            _sectionTitle("Pembuat"),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.pink.shade50,
                border: Border.all(color: Colors.pink.shade100),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.pink.shade200.withOpacity(0.4),
                    child: Text(
                      "B", // First letter of your name, bisa diganti
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink.shade500,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Bina (H1D023114)",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Mahasiswa Informatika • Pemrograman Mobile",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            Center(
              child: Text(
                "Terima kasih sudah menggunakan aplikasi ini.",
                style: TextStyle(
                  color: Colors.pink.shade300,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // SECTION TITLE
  Widget _sectionTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Colors.pink.shade400,
      ),
    );
  }

  // CARD LIST ITEM
  Widget _infoCard(List<String> items) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.pink.shade100),
        boxShadow: [
          BoxShadow(
            color: Colors.pink.shade100.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items
            .map(
              (e) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    Icon(Icons.favorite_rounded,
                        size: 18, color: Colors.pink.shade300),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        e,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
