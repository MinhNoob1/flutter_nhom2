import 'package:flutter/material.dart';

import 'package:flutter_nhom2/list/bai1_my_home_page.dart';
import 'package:flutter_nhom2/list/bai2_my_place.dart';
import 'package:flutter_nhom2/list/bai3_guide_to_layout.dart';
import 'package:flutter_nhom2/list/bai4_my_classroom.dart';
import 'package:flutter_nhom2/list/bai5_changer_color_app.dart';
import 'package:flutter_nhom2/list/bai6_counter_app.dart';
import 'package:flutter_nhom2/list/bai7_counter_time.dart';
import 'package:flutter_nhom2/list/bai8_tinh_bmi.dart';
import 'package:flutter_nhom2/list/bai9_form_dang_nhap.dart';
import 'package:flutter_nhom2/list/bai10_form_dang_ky.dart';
import 'package:flutter_nhom2/list/bai11_form_gui_phan_hoi.dart';
import 'package:flutter_nhom2/list/bai12_my_product.dart';
import 'package:flutter_nhom2/list/bai13_news_list.dart';
import 'package:flutter_nhom2/list/bai14_profile_screen.dart';

import 'my_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trang chủ"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        
      ),
      drawer: const MyDrawer(),
      body: GridView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: _items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final item = _items[index];
          return _GridItem(item: item);
        },
      ),
    );
  }
}

class HomeItem {
  final String title;
  final IconData icon;
  final Widget page;

  HomeItem({
    required this.title,
    required this.icon,
    required this.page,
  });
}

final List<HomeItem> _items = [
  HomeItem(title: "Bài 1", icon: Icons.home, page: const MyHomePage()),
  HomeItem(title: "Bài 2", icon: Icons.place, page: const MyPlace()),
  HomeItem(title: "Bài 3", icon: Icons.grid_view, page: const GuideToLayout()),
  HomeItem(title: "Bài 4", icon: Icons.class_, page: const MyClassroom()),
  HomeItem(title: "Bài 5", icon: Icons.color_lens, page: const ChangeColorApp()),
  HomeItem(title: "Bài 6", icon: Icons.plus_one, page: const CounterApp()),
  HomeItem(title: "Bài 7", icon: Icons.timer, page: const CounterTime()),
  HomeItem(title: "Bài 8", icon: Icons.monitor_weight, page: const TinhBMI()),
  HomeItem(title: "Bài 9", icon: Icons.login, page: const FormDangNhap()),
  HomeItem(title: "Bài 10", icon: Icons.app_registration, page: const FormDangKy()),
  HomeItem(title: "Bài 11", icon: Icons.feedback, page: const FormGuiPhanHoi()),
  HomeItem(title: "Bài 12", icon: Icons.shopping_cart, page: const MyProduct()),
  HomeItem(title: "Bài 13", icon: Icons.newspaper, page: const NewsList()),
  HomeItem(title: "Bài 14", icon: Icons.person, page: const ProfileScreen()),
];

class _GridItem extends StatelessWidget {
  final HomeItem item;
  const _GridItem({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => item.page),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(item.icon, size: 40, color: Colors.blue),
            const SizedBox(height: 10),
            Text(
              item.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

