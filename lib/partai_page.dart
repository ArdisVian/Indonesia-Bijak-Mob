import 'package:flutter/material.dart';

class PartaiPage extends StatelessWidget {
  final List<Map<String, dynamic>> partaiData = [
    {
      'name': 'Golkar',
      'image': 'Assets/Images/golkar.jpg',
      'color': Color.fromRGBO(255, 174, 66, 1),
    },
    {
      'name': 'PDIP',
      'image': 'Assets/Images/pdip.jpg',
      'color': Color.fromRGBO(236, 106, 87, 1),
    },
    {
      'name': 'Gerindra',
      'image': 'Assets/Images/gerindra.jpg',
      'color': Color.fromRGBO(64, 75, 96, 1),
    },
    {
      'name': 'PKS',
      'image': 'Assets/Images/pks.jpg',
      'color': Color.fromRGBO(245, 166, 35, 1),
    },
    {
      'name': 'Demokrat',
      'image': 'Assets/Images/demokrat.jpg',
      'color': Color.fromRGBO(104, 118, 131, 1),
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Partai'),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8, // adjust aspect ratio here
        ),
        itemCount: partaiData.length,
        itemBuilder: (context, index) {
          final partai = partaiData[index];
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
