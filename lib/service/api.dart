import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nhom2/model/product.dart';

class API {
  Future<List<Product>> getALLProduct() async {
    var dio = Dio();
    var url = "https://fakestoreapi.com/products";
    var response = await dio.request(url);
    List<Product> ls = [];
    if (response.statusCode == 200) {
      List data = response.data;
      ls = data.map((json) => Product.fromJson(json)).toList();
    } else {
      debugPrint("Lỗi khi lấy danh sách sản phẩm");
    }
    return ls;
  }
}

var testAPI = API();