import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  String username = '';

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() => username = prefs.getString('username') ?? 'Tamu');
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            DrawerHeader(
              child: Row(children: [
                CircleAvatar(radius: 28, child: Text(username.isEmpty ? 'T' : username[0].toUpperCase())),
                SizedBox(width: 12),
                Expanded(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
                    Text(username.isEmpty ? 'Tamu' : username, style: Theme.of(context).textTheme.titleMedium),
                    Text('halo, semoga harimu menyenangkan', style: Theme.of(context).textTheme.bodySmall),
                  ]),
                )
              ]),
            ),
            ListTile(
              leading: Icon(Icons.home_rounded),
              title: Text('Beranda'),
              onTap: () => Navigator.pushReplacementNamed(context, '/home'),
            ),
            ListTile(
              leading: Icon(Icons.person_rounded),
              title: Text('Profil'),
              onTap: () => Navigator.pushNamed(context, '/profile'),
            ),
            ListTile(
              leading: Icon(Icons.info_rounded),
              title: Text('Tentang'),
              onTap: () => Navigator.pushNamed(context, '/about'),
            ),
            Spacer(),
            ListTile(
              leading: Icon(Icons.logout_rounded),
              title: Text('Keluar'),
              onTap: _logout,
            )
          ],
        ),
      ),
    );
  }
}
