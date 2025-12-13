import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class TinhBMI extends StatefulWidget {
  const TinhBMI({super.key});

  @override
  State<TinhBMI> createState() => _TinhBMIState();
}

class _TinhBMIState extends State<TinhBMI> {
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  String _result = "";

  void _calculateBMI() {
    final heightText = _heightController.text.trim();
    final weightText = _weightController.text.trim();

    if (heightText.isEmpty || weightText.isEmpty) {
      setState(() {
        _result = "Vui lòng nhập đầy đủ chiều cao và cân nặng!";
      });
      return;
    }

    final height = double.tryParse(heightText);
    final weight = double.tryParse(weightText);

    if (height == null || weight == null || height <= 0 || weight <= 0) {
      setState(() {
        _result = "Giá trị không hợp lệ! Hãy nhập số lớn hơn 0.";
      });
      return;
    }

    double bmi = weight / (height * height);

    String classification = "";
    if (bmi < 18.5) {
      classification = "Thiếu cân";
    } else if (bmi < 24.9) {
      classification = "Bình thường";
    } else if (bmi < 29.9) {
      classification = "Thừa cân";
    } else {
      classification = "Béo phì";
    }

    setState(() {
      _result = "BMI: ${bmi.toStringAsFixed(2)}\nPhân loại: $classification";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tính chỉ số BMI"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.height),
                labelText: "Chiều cao (m)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 16),
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.scale),
                labelText: "Cân nặng (kg)",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),
            Center(
              child: ElevatedButton.icon(
                onPressed: _calculateBMI,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                ),
                icon: Icon(Icons.calculate, color: Colors.white),
                label: Text(
                  "Tính BMI",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            
            Expanded(
              child: Center(
                child: Text(
                  _result,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
