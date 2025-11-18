import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'Pengguna';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Foto profil bulat cantik
            CircleAvatar(
              radius: 55,
              backgroundColor: Colors.pink.shade200.withOpacity(0.4),
              child: CircleAvatar(
                radius: 48,
                backgroundColor: Colors.pink.shade50,
                child: Text(
                  username.isEmpty ? "U" : username[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.pink.shade400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              username,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),

       
            const SizedBox(height: 25),

            // Kartu informasi profil
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.pink.shade300),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Username",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700),
                          ),
                        ),
                        Text(
                          username,
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),

                    const Divider(height: 28),

                    Row(
                      children: [
                        Icon(Icons.color_lens, color: Colors.pink.shade300),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            "Tema",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.grey.shade700),
                          ),
                        ),
                        Text("Soft Pink",
                            style: TextStyle(color: Colors.grey.shade700)),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(),

            // Tombol kembali
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                child: const Text("Kembali"),
                onPressed: () => Navigator.pop(context),
              ),
            )
          ],
        ),
      ),
    );
  }
}
