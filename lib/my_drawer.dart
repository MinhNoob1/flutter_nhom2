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
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.purple),
            child: Center(
              child: Text(
                "BÀI TẬP",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ),
                    ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Trang chủ"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
                (route) => false,
              );
            },
          ),

          const Divider(),

          _item(context, "Bài 1 - Home Page", const MyHomePage()),
          _item(context, "Bài 2 - My Place", const MyPlace()),
          _item(context, "Bài 3 - Guide Layout", const GuideToLayout()),
          _item(context, "Bài 4 - Classroom", const MyClassroom()),
          _item(context, "Bài 5 - Change Color", const ChangeColorApp()),
          _item(context, "Bài 6 - Counter", const CounterApp()),
          _item(context, "Bài 7 - Counter Time", const CounterTime()),
          _item(context, "Bài 8 - BMI", const TinhBMI()),
          _item(context, "Bài 9 - Login", const FormDangNhap()),
          _item(context, "Bài 10 - Register", const FormDangKy()),
          _item(context, "Bài 11 - Feedback", const FormGuiPhanHoi()),
          _item(context, "Bài 12 - Product", const MyProduct()),
          _item(context, "Bài 13 - News", const NewsList()),
          _item(context, "Bài 14 - Profile", const ProfileScreen()),
        ],
      ),
    );
  }

  Widget _item(BuildContext context, String title, Widget page) {
    return ListTile(
      title: Text(title),
      leading: const Icon(Icons.arrow_right),
      onTap: () => _go(context, page),
    );
  }
}
