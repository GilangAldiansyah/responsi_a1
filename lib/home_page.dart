import 'package:flutter/material.dart';
import 'package:responsi_a1/side_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: const SideMenu(),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              'Selamat Datang di Dunia Ikan',
              style: TextStyle(
                fontSize: 24, // Ubah ukuran font sesuai yang Anda inginkan
              ),
            ),
          ),
          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Image.asset(
              'images/ikan.png',
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
