import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class GuideToLayout extends StatelessWidget {
  const GuideToLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bố Cục"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),

          // Column
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.notifications_none, size: 28),
                  SizedBox(width: 10),
                  Icon(Icons.settings_outlined, size: 28),
                ],
              ),
              const SizedBox(height: 20),

              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 28, color: Colors.black),
                  children: [
                    TextSpan(
                      text: "Welcome, \n",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    TextSpan(
                      text: "Hồ Công Minh",
                      style: TextStyle(
                        fontSize: 24
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Ô tìm kiếm
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Tìm kiếm",
                ),
              ),
              const SizedBox(height: 30),

              // Tiêu đề
              const Text(
                "Saved Places",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              // Lưới 4 ảnh
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: [
                    _buildImageCard('assets/images/absolute_cinema.webp'),
                    _buildImageCard('assets/images/doakes.jpg'),
                    _buildImageCard('assets/images/doge.jpg'),
                    _buildImageCard('assets/images/willem_dafoe.gif'),
                    _buildImageCard('assets/images/pedro-pascal-crying-meme-crying.gif'),
                    _buildImageCard('assets/images/what-huh.gif'),
                    _buildImageCard('assets/images/Unsettled-Tom.jpg'),
                    _buildImageCard('assets/images/pain-harold.jpg'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildImageCard(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(url, fit: BoxFit.cover),
    );
  }
}
