import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class MyClassroom extends StatelessWidget {
  const MyClassroom({super.key});

  // 1. Danh sách dữ liệu môn học cố định
  static const List<Map<String, String>> subjects = [
    {'name': 'Lập trình hướng đối tượng', 'code': 'TIN001'},
    {'name': 'Lập trình Java cơ bản', 'code': 'TIN002'},
    {'name': 'Lập trình Python', 'code': 'TIN003'},
    {'name': 'Lập trình ứng dụng di động', 'code': 'TIN004'},
    {'name': 'Lập trình Front End', 'code': 'TIN005'},
    {'name': 'Kỹ thuật lập trình', 'code': 'TIN006'},
    {'name': 'Lập trình ứng dụng web', 'code': 'TIN007'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh Sách Lớp Học"),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 10),
          itemCount: 50,
          itemBuilder: (context, index) {
            return _buildClassItem();
          },
        ),
      ),
    );
  }

  // Hàm tạo từng item lớp học
  Widget _buildClassItem() {
    final random = Random();

    // Random môn học từ danh sách
    final subject = subjects[random.nextInt(subjects.length)];
    final String subjectName = subject['name']!;
    final String subjectCode = subject['code']!;

    // Random màu nền
    final Color bgColor = Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );

    // Tính màu chữ tương phản (Đen hoặc Trắng) dựa trên độ sáng màu nền
    final Color textColor = bgColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
    final Color subTextColor = textColor.withValues(alpha: 0.8);

    // Tạo mã lớp học phần: 2024-2025.HK.MãMôn.MãLớp
    final int semester = random.nextInt(2) + 1;
    final String classCodeSuffix = random.nextInt(100).toString().padLeft(3, '0');
    final String fullClassCode = "2024-2025.$semester.$subjectCode.$classCodeSuffix";

    // Tạo số lượng học viên: xx/yy (20 <= xx < yy <= 80)
    final int maxStudents = 21 + random.nextInt(60); 
    final int currentStudents = 20 + random.nextInt(maxStudents - 20);
    final String studentCount = "$currentStudents/$maxStudents học viên";

    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên môn học
                Text(
                  subjectName,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                
                // Mã lớp học phần
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: textColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    fullClassCode,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
                
                const SizedBox(height: 8),
                
                // Số lượng học viên
                Row(
                  children: [
                    Icon(Icons.people, size: 16, color: subTextColor),
                    const SizedBox(width: 5),
                    Text(
                      studentCount,
                      style: TextStyle(
                        color: subTextColor,
                        fontSize: 14,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Nút menu bên phải
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: textColor),
          ),
        ],
      ),
    );
  }
}