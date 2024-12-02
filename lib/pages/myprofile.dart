import 'package:flutter/material.dart';

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Tiêu đề trang
            Text(
              'Giới thiệu bản thân',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Tên
            Text(
              'Tên: Nguyên Đức',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            // Ngày sinh
            Text(
              'Ngày sinh: 6 tháng 1 năm 2003',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            // Địa chỉ
            Text(
              'Địa chỉ: Thành phố Huế',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),

            // Trường học
            Text(
              'Đang học tại: Đại học Khoa học Huế',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
