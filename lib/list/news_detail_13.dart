import 'package:flutter/material.dart';
import 'package:flutter_nhom2/model/news.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetail extends StatelessWidget {
  final News news;

  const NewsDetail({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chi tiết bài viết"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Ảnh lớn
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                news.urlToImage,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/No_Image_Available.jpg");
                },
              ),
            ),
            const SizedBox(height: 15),

            /// Tiêu đề
            Text(
              news.title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            /// Nội dung
            Text(news.content, style: const TextStyle(fontSize: 16)),

            const SizedBox(height: 20),

            /// Nút mở bài gốc
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  Uri url = Uri.parse(news.url);
                  await launchUrl(url, mode: LaunchMode.externalApplication);
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                child: const Text("🔗 Mở bài gốc"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
