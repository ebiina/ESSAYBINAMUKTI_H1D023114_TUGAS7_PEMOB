import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _loading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);

    // contoh verifikasi sederhana (BUKAN untuk produksi)
    await Future.delayed(Duration(milliseconds: 700));
    if (_userCtrl.text.trim().toLowerCase() == 'admin' && _passCtrl.text == 'password') {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', _userCtrl.text.trim());

      // pindah ke home dan hapus back
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login gagal — cek username/password')),
      );
    }

    setState(() => _loading = false);
  }

  @override
  void dispose() {
    _userCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 40),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // header GIF
                Image.asset('assets/images/header.gif', height: 140),
                SizedBox(height: 20),
                Text('Selamat Datang', style: Theme.of(context).textTheme.headlineSmall),
                SizedBox(height: 8),
                Text('Masuk untuk melanjutkan', style: Theme.of(context).textTheme.bodyMedium),

                SizedBox(height: 24),
                Form(
                  key: _formKey,
                  child: Column(children: [
                    TextFormField(
                      controller: _userCtrl,
                      decoration: InputDecoration(labelText: 'Username'),
                      validator: (v) => (v == null || v.trim().isEmpty) ? 'Masukkan username' : null,
                    ),
                    SizedBox(height: 12),
                    TextFormField(
                      controller: _passCtrl,
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (v) => (v == null || v.isEmpty) ? 'Masukkan password' : null,
                    ),
                    SizedBox(height: 18),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _loading ? null : _login,
                        child: _loading ? CircularProgressIndicator.adaptive() : Text('Masuk'),
                      ),
                    ),
                    SizedBox(height: 12),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/about'),
                      child: Text('Tentang Aplikasi'),
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
