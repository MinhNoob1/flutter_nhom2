import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class CounterTime extends StatefulWidget {
  const CounterTime({super.key});

  @override
  State<CounterTime> createState() => _CounterTimeState();
}

class _CounterTimeState extends State<CounterTime> {
  Timer? _timer;
  int _currentTime = 0;
  bool _isRunning = false;
  
  final TextEditingController _controller = TextEditingController();

  // Hàm chuyển đổi số giây thành chuỗi 00:00:00 gọn gàng
  String _formatTime(int totalSeconds) {
    final int hours = totalSeconds ~/ 3600;
    final int minutes = (totalSeconds % 3600) ~/ 60;
    final int seconds = totalSeconds % 60;

    final String m = minutes.toString().padLeft(2, '0');
    final String s = seconds.toString().padLeft(2, '0');

    // Nếu có giờ thì hiện giờ, không thì chỉ hiện phút:giây
    return hours > 0 
        ? '${hours.toString().padLeft(2, '0')}:$m:$s' 
        : '$m:$s';
  }

  void _startTimer() {
    FocusScope.of(context).unfocus();

    final int? inputSeconds = int.tryParse(_controller.text);

    if (inputSeconds == null || inputSeconds <= 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vui lòng nhập số giây lớn hơn 0!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    _timer?.cancel();
    setState(() {
      _currentTime = inputSeconds;
      _isRunning = true;
    });

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) return;

      if (_currentTime > 0) {
        setState(() {
          _currentTime--;
        });
      } else {
        timer.cancel();
        setState(() {
          _isRunning = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Đã hết giờ!')),
        );
      }
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _currentTime = 0;
      _isRunning = false;
      _controller.clear();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Đếm Ngược Thời Gian", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        drawer: const MyDrawer(),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 30),
              const Text(
                "Nhập số giây cần đếm:",
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),

              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: const EdgeInsets.symmetric(vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              Text(
                _formatTime(_currentTime),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: _startTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isRunning ? Colors.grey : Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      _isRunning ? "Đang chạy..." : "Bắt đầu",
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: _resetTimer,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text(
                      "Đặt lại",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}