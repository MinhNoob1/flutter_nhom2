import 'package:flutter/material.dart';
import 'package:flutter_nhom2/model/product.dart';
import 'package:flutter_nhom2/my_drawer.dart';
import 'package:flutter_nhom2/service/api.dart';

class MyProduct extends StatefulWidget {
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  List<Product> ls = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    ls = await API().getALLProduct();
    setState(() {
      isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("THƯƠNG MẠI ĐIỆN TỬ"),
        centerTitle: true,
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      drawer: const MyDrawer(),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : myListView(),
    );
  }

  Widget myListView() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GridView.builder(
        itemCount: ls.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 260,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return myItem(ls[index]);
        },
      ),
    );
  }

  Widget myItem(Product p) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            children: [
              const Icon(Icons.star, color: Colors.orange, size: 20),
              const SizedBox(width: 4),
              Text(
                p.rating.rate.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),

          Expanded(
            child: Center(
              child: Image.network(
                p.image,
                height: 90,
              ),
            ),
          ),

          const SizedBox(height: 5),

          /// 📌 Title
          Text(
            p.title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            "# ${p.category}",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),

          Text(
            "\$${p.price.toString()}",
            style: const TextStyle(
              color: Colors.green,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          
          const SizedBox(height: 5),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white
              ),
              child: const Text("Mua Ngay"),
            ),
          ),
        ],
      ),
    );
  }
}