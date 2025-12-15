import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';
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
      // Xử lý logout an toàn (Capture references pattern)
      final navigator = Navigator.of(context);
      await authService.logout();
      if (mounted) {
         navigator.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => const FormDangNhap()),
          (route) => false,
        );
      }
    } else {
      setState(() {
        data = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Hồ sơ cá nhân"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              // Xử lý logout an toàn
              final navigator = Navigator.of(context);
              await authService.logout();
              if (navigator.context.mounted) {
                 navigator.pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const FormDangNhap()),
                  (route) => false,
                );
              }
            },
          ),
        ],
      ),
      body: data == null
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  // --- PHẦN 1: HEADER (AVATAR & TÊN) ---
                  _buildHeader(),

                  // --- PHẦN 2: THÔNG TIN CHI TIẾT ---
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        _buildInfoCard("Thông tin liên hệ", [
                          _buildRow(Icons.email, "Email", data!['email']),
                          _buildRow(Icons.phone, "Điện thoại", data!['phone']),
                          _buildRow(Icons.cake, "Ngày sinh", data!['birthDate']),
                        ]),

                        const SizedBox(height: 16),

                        _buildInfoCard("Địa chỉ", [
                          _buildRow(Icons.location_on, "Địa chỉ", data!['address']?['address']),
                          _buildRow(Icons.location_city, "Thành phố", data!['address']?['city']),
                        ]),

                        const SizedBox(height: 16),

                        _buildInfoCard("Công việc", [
                          _buildRow(Icons.business, "Công ty", data!['company']?['name']),
                          _buildRow(Icons.work, "Chức vụ", data!['company']?['title']),
                          _buildRow(Icons.apartment, "Phòng ban", data!['company']?['department']),
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  // Widget con: Phần Header màu tím chứa Avatar
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 30),
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          // Avatar có viền trắng
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[200],
              backgroundImage: data!['image'] != null 
                  ? NetworkImage(data!['image']) 
                  : null,
              child: data!['image'] == null 
                  ? const Icon(Icons.person, size: 60, color: Colors.grey) 
                  : null,
            ),
          ),
          const SizedBox(height: 15),
          // Tên đầy đủ
          Text(
            "${data!['firstName']} ${data!['lastName']}",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          // Chức danh công việc (nếu có)
          Text(
            data!['company']?['title'] ?? "Người dùng",
            style: TextStyle(
              fontSize: 16,
              color: Colors.deepPurple[100],
            ),
          ),
        ],
      ),
    );
  }

  // Widget con: Khung chứa thông tin (Card)
  Widget _buildInfoCard(String title, List<Widget> children) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const Divider(),
            ...children,
          ],
        ),
      ),
    );
  }

  // Widget con: Từng dòng thông tin nhỏ
  Widget _buildRow(IconData icon, String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey[600], size: 20),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                ),
                Text(
                  value ?? "Chưa cập nhật",
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}