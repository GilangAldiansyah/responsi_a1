import 'package:flutter/material.dart';
import 'package:responsi_a1/bloc/ikan_bloc.dart';
import 'package:responsi_a1/ikan_form.dart';
import 'package:responsi_a1/model/ikan.dart';
import 'package:responsi_a1/detail_data.dart';
import 'package:responsi_a1/side_menu.dart';

class ListData extends StatefulWidget {
  const ListData({Key? key}) : super(key: key);
  @override
  _ListDataState createState() => _ListDataState();
}

class _ListDataState extends State<ListData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('List Ikan'),
            const SizedBox(width: 50), // Spasi antara judul dan "designed by"
            const Text('Created by : Gilang',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ],
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                child: const Icon(Icons.add, size: 26.0),
                onTap: () async {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ikanForm()));
                },
              ))
        ],
      ),
      drawer: const SideMenu(),
      body: FutureBuilder<List>(
        future: IkanBloc.getIkans(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListIkan(
                  list: snapshot.data,
                )
              : const Center(
                  child: CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ListIkan extends StatelessWidget {
  final List? list;

  const ListIkan({Key? key, this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list!.length,
        itemBuilder: (context, i) {
          return ItemIkan(
            ikan: list![i],
          );
        });
  }
}

class ItemIkan extends StatelessWidget {
  final Ikan ikan;

  const ItemIkan({Key? key, required this.ikan}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailData(
                      ikan: ikan,
                    )));
      },
      child: Card(
        child: ListTile(
          title: Text(ikan.nama!),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Jenis: ${ikan.jenis.toString()}'),
              Text('Warna: ${ikan.warna.toString()}'),
              Text('Habitat: ${ikan.habitat.toString()}'),
            ],
          ),
        ),
      ),
    );
  }
}
