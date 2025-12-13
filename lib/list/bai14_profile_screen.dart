import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_nhom2/service/auth_api.dart';
import 'package:flutter_nhom2/list/bai9_form_dang_nhap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final result = await authService.getProfile();
    if (!mounted) return;
    if (result == null) {
      await authService.logout();
      if (!mounted) return;
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const FormDangNhap()),
        (route) => false,
      );
    } else {
      setState(() {
        data = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile JSON"),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authService.logout();
              if (!context.mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const FormDangNhap()),
                (route) => false,
              );
            },
          ),
        ],
      ),
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Text(
                const JsonEncoder.withIndent("  ").convert(data),
                style: const TextStyle(fontSize: 14, height: 1.5),
              ),
            ),
    );
  }
}
