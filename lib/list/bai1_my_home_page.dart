import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bài Đầu Tiên"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Center(
            child: Text(
              "Hello World",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          Icon(Icons.heart_broken, size: 100, color: Colors.red),
          Text(
            "Lập trình ứng dụng di động",
            style: TextStyle(color: Colors.blueAccent, fontSize: 30),
          ),
        ],
      ),
    );
  }
}
