import 'package:flutter/material.dart';
import 'package:responsi_a1/bloc/ikan_bloc.dart';
import 'package:responsi_a1/ikan_form.dart';
import 'package:responsi_a1/list_data.dart';
import 'package:responsi_a1/model/ikan.dart';

class DetailData extends StatefulWidget {
  Ikan? ikan;

  DetailData({Key? key, this.ikan}) : super(key: key);

  @override
  _DetailDataState createState() => _DetailDataState();
}

class _DetailDataState extends State<DetailData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Detail Ikan'),
            const SizedBox(width: 90),
            const Text('Created by : Gilang',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Nama : ${widget.ikan!.nama}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Jenis : ${widget.ikan!.jenis}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Warna : ${widget.ikan!.warna}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Habitat : ${widget.ikan!.habitat}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],
        ),
      ),
    );
  }

  Widget _tombolHapusEdit() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        //Tombol Edit
        OutlinedButton(
          child: const Text(
            "EDIT",
            style: TextStyle(color: Colors.white),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ikanForm(
                          ikan: widget.ikan!,
                        )));
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        ),
        OutlinedButton(
            child: const Text(
              "DELETE",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => confirmHapus(widget.ikan!),
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: Colors.red),
              backgroundColor: Colors.red,
            )),
      ],
    );
  }

  void confirmHapus(ikan) {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
        //tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            IkanBloc.deleteIkan(id: ikan.id).then((value) => {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => ListData()))
                });
          },
        ),
        //tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(builder: (context) => alertDialog, context: context);
  }
}
