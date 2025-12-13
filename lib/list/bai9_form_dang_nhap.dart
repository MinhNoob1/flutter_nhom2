import 'package:flutter/material.dart';

import 'package:flutter_nhom2/list/bai14_profile_screen.dart'; 
import 'package:flutter_nhom2/my_drawer.dart'; 
import 'package:flutter_nhom2/service/auth_api.dart';

class FormDangNhap extends StatefulWidget {
  const FormDangNhap({super.key});

  @override
  State<FormDangNhap> createState() => _FormDangNhapState();
}

class _FormDangNhapState extends State<FormDangNhap> {
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool _obscure = true;

Future<void> _login() async {
  if (!_formKey.currentState!.validate()) return;
  FocusScope.of(context).unfocus();

  final user = _username.text.trim();
  final pass = _password.text.trim();

  final navigator = Navigator.of(context);
  final messenger = ScaffoldMessenger.of(context);

  bool success = await authService.login(user, pass);

  if (!mounted) return;

  if (success) {
    navigator.pushReplacement(
      MaterialPageRoute(builder: (_) => const ProfileScreen()),
    );
  } else {
    messenger.showSnackBar(
      const SnackBar(content: Text("Sai username hoặc password!")),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Đăng nhập", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Username
              TextFormField(
                controller: _username,
                decoration: const InputDecoration(
                  labelText: "Tên đăng nhập",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (v) =>
                    v!.isEmpty ? "Vui lòng nhập tên đăng nhập" : null,
              ),

              const SizedBox(height: 16),

              // Password
              TextFormField(
                controller: _password,
                obscureText: _obscure,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  prefixIcon: const Icon(Icons.lock),
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  ),
                ),
                validator: (v) =>
                    v!.isEmpty ? "Vui lòng nhập mật khẩu" : null,
              ),

              const SizedBox(height: 24),

              // Login Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Đăng nhập", style: TextStyle(fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}