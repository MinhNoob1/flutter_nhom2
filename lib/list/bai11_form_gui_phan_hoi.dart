import 'dart:typed_data';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class FormGuiPhanHoi extends StatefulWidget {
  const FormGuiPhanHoi({super.key});

  @override
  State<FormGuiPhanHoi> createState() => _FormGuiPhanHoiState();
}

class _FormGuiPhanHoiState extends State<FormGuiPhanHoi> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  int? selectedStar;
  Uint8List? selectedImageBytes;
  String? selectedImageName;

  Future<void> pickImage() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
        withData: true,
      );

      if (result != null && result.files.isNotEmpty) {
        setState(() {
          selectedImageBytes = result.files.first.bytes;
          selectedImageName = result.files.first.name;
        });
      }
    } catch (e) {
      debugPrint("Lỗi chọn ảnh: $e");
    }
  }

  void submitFeedback() {
    String name = nameController.text;
    String content = contentController.text;

    if (name.isEmpty || selectedStar == null || content.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Vui lòng nhập đầy đủ thông tin"),backgroundColor: Colors.red,));
      return;
    }

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Gửi phản hồi thành công!"),backgroundColor: Colors.green,));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Gửi Phản Hồi"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Họ tên",
                  hintText: "Họ tên",
                  prefixIcon: Icon(Icons.person),
                ),
              ),

              SizedBox(height: 18),
              DropdownButtonFormField<int>(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Đánh giá (1-5sao)",
                  prefixIcon: Icon(Icons.star),
                ),

                initialValue: selectedStar,
                items: List.generate(
                  5,
                  (i) => DropdownMenuItem(
                    value: i + 1,
                    child: Row(
                      children: List.generate(
                        i + 1,
                        (index) =>
                            Icon(Icons.star, color: Colors.orange, size: 20),
                      ),
                    ),
                  ),
                ),
                selectedItemBuilder: (context) {
                  return List.generate(
                    5,
                    (i) => Row(
                      children: List.generate(
                        i + 1,
                        (index) =>
                            Icon(Icons.star, color: Colors.orange, size: 22),
                      ),
                    ),
                  );
                },
                onChanged: (v) => setState(() => selectedStar = v),
              ),

              SizedBox(height: 18),
              TextField(
                controller: contentController,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Nội dung góp ý",
                  prefixIcon: Icon(Icons.chat),
                ),
              ),

              SizedBox(height: 18),
              Text("Đính kèm hình ảnh"),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: pickImage,
                    icon: Icon(Icons.image, color: Colors.white),
                    label: Text("Chọn ảnh"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                    ),
                  ),
                  SizedBox(width: 12),

                  if (selectedImageBytes != null)
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          selectedImageBytes!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                ],
              ),

              SizedBox(height: 30),
              Center(
                child: ElevatedButton.icon(
                  onPressed: submitFeedback,
                  icon: Icon(Icons.send),
                  label: Text("Gửi phản hồi", style: TextStyle(fontSize: 17)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
