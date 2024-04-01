import 'package:flutter/material.dart';
import 'package:indonesia_bijak/ItemContent.dart';

class ProfilPartai extends StatelessWidget {
  final String namaPartai;
  final String deskripsi;
  final ItemContent perolehan;

  ProfilPartai(
      {required this.namaPartai,
      required this.deskripsi,
      required this.perolehan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil $namaPartai'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Text(
              'Tentang $namaPartai',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              '$deskripsi',
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 32.0),
            Text(
              'Top 3 Perolehan Suara Daerah di 2019',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            perolehan
          ],
        ),
      ),
    );
  }
}
