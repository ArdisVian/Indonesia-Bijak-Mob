import 'package:flutter/material.dart';

class Kandidat {
  final String nama;
  final String fotoUrl;

  Kandidat(this.nama, this.fotoUrl);
}

class KandidatPage extends StatelessWidget {
  final List<Map<String, dynamic>> KandidatData = [
    {
      'name': 'Anies & Muhaimin',
      'image': 'Assets/Images/aniesimin.png',
      'color': Color.fromRGBO(216, 98, 19, 1),
    },
    {
      'name': 'Prabowo & Gibran',
      'image': 'Assets/Images/prabowogibran.jpg',
      'color': Color.fromRGBO(216, 98, 19, 1),
    },
    {
      'name': 'Ganjar & Mahfud',
      'image': 'Assets/Images/ganjarmahfud.jpg',
      'color': Color.fromRGBO(216, 98, 19, 1),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calon Kandidat Presiden'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8, // adjust aspect ratio here
        ),
        itemCount: KandidatData.length,
        itemBuilder: (context, index) {
          final partai = KandidatData[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
              color: partai['color'],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AspectRatio(
                  aspectRatio: 5 / 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      partai['image'],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    partai['name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
