import 'package:authenticationapp/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn _googleSignIn = GoogleSignIn();

class Myprofile extends StatelessWidget {
  const Myprofile({super.key});

  void _logout(BuildContext context) async {
    try {
      // Đăng xuất khỏi Firebase
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Home()),
      );

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đăng xuất thất bại: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Giới thiệu bản thân',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),

            // Tên
            const Text(
              'Tên: Nguyên Đức',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Ngày sinh
            const Text(
              'Ngày sinh: 6 tháng 1 năm 2003',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Địa chỉ
            const Text(
              'Địa chỉ: Thành phố Huế',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Trường học
            const Text(
              'Đang học tại: Đại học Khoa học Huế',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),

            // Nút Đăng xuất
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () => _logout(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                ),
                child: const Text(
                  'Đăng xuất',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
