import 'package:flutter/material.dart';

import 'list/bai1_my_home_page.dart';
import 'list/bai2_my_place.dart';
import 'list/bai3_guide_to_layout.dart';
import 'list/bai4_my_classroom.dart';
import 'list/bai5_changer_color_app.dart';
import 'list/bai6_counter_app.dart';
import 'list/bai7_counter_time.dart';
import 'list/bai8_tinh_bmi.dart';
import 'list/bai9_form_dang_nhap.dart';
import 'list/bai10_form_dang_ky.dart';
import 'list/bai11_form_gui_phan_hoi.dart';
import 'list/bai12_my_product.dart';
import 'list/bai13_news_list.dart';
import 'list/bai14_profile_screen.dart';

import 'home_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void _go(BuildContext context, Widget page) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => page));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Colors.purple),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: const Image(
                image: NetworkImage(
                  "https://i1.sndcdn.com/avatars-zAo5N9j7XXVVwKPC-6lrkmw-t1080x1080.jpg",
                ),
              ),
            ),
            accountName: const Text(
              "Hồ Công Minh",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            accountEmail: const Text("22T1080075"),
          ),

          ListTile(
            leading: const Icon(Icons.home, color: Colors.purple),
            title: const Text(
              "Trang chủ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
                (route) => false,
              );
            },
          ),

          _item(context, "Bài 1 - Bài Đầu Tiên", const MyHomePage()),
          _item(context, "Bài 2 - Phong Cảnh", const MyPlace()),
          _item(context, "Bài 3 - Bố Cục", const GuideToLayout()),
          _item(context, "Bài 4 - Lớp Học", const MyClassroom()),
          _item(context, "Bài 5 - Đổi Màu", const ChangeColorApp()),
          _item(context, "Bài 6 - Đếm Số", const CounterApp()),
          _item(context, "Bài 7 - Đếm Ngược Thời Gian", const CounterTime()),
          _item(context, "Bài 8 - Tính BMI", const TinhBMI()),
          _item(context, "Bài 9 - Đăng Nhập", const FormDangNhap()),
          _item(context, "Bài 10 - Đăng Ký", const FormDangKy()),
          _item(context, "Bài 11 - Gửi Phản Hồi", const FormGuiPhanHoi()),
          _item(context, "Bài 12 - Thương Mại Điện Tử", const MyProduct()),
          _item(context, "Bài 13 - Tin Tức", const NewsList()),
          _item(context, "Bài 14 - Hồ Sơ Cá Nhân", const ProfileScreen()),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      leading: const Icon(Icons.arrow_right, color: Colors.grey),
      onTap: () => _go(context, page),
    );
  }
}
