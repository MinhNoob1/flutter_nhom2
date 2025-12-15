import 'package:flutter/material.dart';
import 'package:flutter_nhom2/my_drawer.dart';

class MyPlace extends StatelessWidget {
  const MyPlace({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Phong Cảnh"),
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
    var src = "https://statics.vinwonders.com/Anh%202%20Nui%20Bach%20Ma%20Hue_1624594895.jpg";
    return Image.network(src);
  }
  Widget block2(){
    var title ="Núi Bạch Mã - Huế";
    var subtitle ="Địa điểm du lịch tại Việt Nam";
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
              Text("36")
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
    var data ="Núi Bạch Mã Huế là điểm nghỉ mát nổi tiếng của Việt Nam, nơi có nhiều con suối trong lành và những ngọn thác ngoạn mục khiến nhiều du khách phải ngẩn ngơ. Ai cũng mong được đến đây để ngắm nhìn vẻ đẹp lung linh của thành phố Huế, của đèo Hải Vân,... trong tầm mắt.";
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(data),
    );
  }

}