import 'package:dio/dio.dart';
import 'package:flutter_nhom2/model/news.dart';

class NewsAPI {
  final String apiKey = "3e6e3ce5101e4b38861e332289d6598a";

  Future<List<News>> fetchNews() async {
    var url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";
    var response = await Dio().get(url);
    if (response.statusCode == 200) {
      List data = response.data["articles"];
      return data.map((e) => News.fromJson(e)).toList();
    }
    return [];
  }
}