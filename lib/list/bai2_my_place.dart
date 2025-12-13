import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bài 2 - My Place"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body:Column(
        children: [
          block1(),
          block2(),
          block3(),
          block4()
        ],
      ),
    );
  }
  
  Widget block1() {
    var src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSx_O5MGUkfRtSyM07PAV1RElEL0L4R214o6Q&s";
    return Image.network(src);
  }
  Widget block2(){
    var title ="Tet trung thu";
    var subtitle ="Van hoa Viet Nam";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold),
                ), 
              Text(
                subtitle,
                style: TextStyle(color: Colors.grey),
                ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.star, color: Colors.red,),
              Text("41")
            ],
          )
        ],
      ),
    );
  }
  Widget block3(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Icon(Icons.phone, color: Colors.blue,),
            const SizedBox(height: 8,),
            Text("CALL"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.near_me, color: Colors.blue,),
            const SizedBox(height: 8,),
            Text("ROUTE"),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue,),
            const SizedBox(height: 8,),
            Text("SHARE"),
          ],
        ),
      ],
    );
  }
  Widget block4() {
    var data ="Tết Trung thu còn được gọi là Tết trông Trăng hay Tết hoa đăng theo Âm lịch là ngày Rằm tháng 8 hằng năm, là một lễ hội truyền thống được kỉ niệm ở văn hóa của Việt Nam.";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(data),
    );
  }

}