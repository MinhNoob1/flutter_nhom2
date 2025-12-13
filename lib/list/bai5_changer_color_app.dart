import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class ChangeColorApp extends StatefulWidget {
  const ChangeColorApp({super.key});

  @override
  State<ChangeColorApp> createState() => _ChangeColorAppState();
}

class _ChangeColorAppState extends State<ChangeColorApp> {
  late Color currentColor = Colors.purple;

  List<Color> colors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
    Colors.pink,
    Colors.brown,
    Colors.cyan,
    Colors.lime,
  ];

  List<String> colorNames = [
    "Đỏ",
    "Xanh lá",
    "Xanh dương",
    "Vàng",
    "Cam",
    "Tím",
    "Hồng",
    "Nâu",
    "Xanh ngọc",
    "Vàng chanh",
  ];

  late String currentColorName = "Tím";

  @override
  void initState() {
    super.initState();
    currentColor = Colors.purple;
  }

  void changeColor() {
    var random = Random();
    int index = random.nextInt(colors.length);
    setState(() {
      currentColor = colors[index];
      currentColorName = colorNames[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(), 
      body: myBody(),
      drawer: const MyDrawer(),
      );
  }

  Widget myBody() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, currentColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Màu sắc hiện tại:", style: TextStyle(fontSize: 20)),
          Text(
            currentColorName,
            style: TextStyle(
              color: currentColor,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            onPressed: changeColor,
            icon: const Icon(Icons.color_lens),
            label: const Text("Đổi màu"),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget myAppBar() {
    return AppBar(
      title: const Text("Ứng dụng đổi màu"),
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      centerTitle: true,
    );
  }
}
