import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class EditData extends StatefulWidget {
  final String id;
  final String nama;
  final String jurusan;

  EditData({required this.id, required this.nama, required this.jurusan});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController jurusanController = TextEditingController();

  @override
  void initState() {
    super.initState();
    namaController.text = widget.nama;
    jurusanController.text = widget.jurusan;
  }

  Future<void> editData(String id, String nama, String jurusan) async {
    String url = Platform.isAndroid
        ? 'http://192.168.20.53/flutter_api/index.php'
        : 'http://localhost/flutter_api/index.php';
    Map<String, String> headers = {'Content-Type': 'application/json'};
    Map<String, dynamic> data = {'id': id, 'nama': nama, 'jurusan': jurusan};

    final response = await http.put(
      Uri.parse(url),
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      // Penanganan jika berhasil mengedit data, misalnya menampilkan pesan sukses.
      print('Data berhasil diperbarui');
    } else {
      // Penanganan jika ada kesalahan saat mengedit data, misalnya menampilkan pesan kesalahan.
      print('Terjadi kesalahan saat mengedit data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Data Mahasiswa'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                hintText: 'Nama Mahasiswa',
              ),
            ),
            TextField(
              controller: jurusanController,
              decoration: InputDecoration(
                hintText: 'Jurusan',
              ),
            ),
            ElevatedButton(
              child: Text('Simpan Perubahan'),
              onPressed: () {
                String id = widget.id;
                String nama = namaController.text;
                String jurusan = jurusanController.text;

                editData(id, nama, jurusan).then((_) {
                  // Setelah berhasil mengedit data, Anda dapat kembali ke halaman ListData.
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
