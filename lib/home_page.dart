import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  // list image dan caption
  final List<Map<String, String>> carouselItems = [
    {
      'imagePath': 'Assets/Images/beritadua.png',
      'caption': 'Real Count: Prabowo Masih Unggul',
    },
    {
      'imagePath': 'Assets/Images/beritasatu.jpg',
      'caption': 'Prabowo Naik Pangkat',
    },
    {
      'imagePath': 'Assets/Images/Beritatiga.jpg',
      'caption': 'Ganjar Hak Angket',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        // section slider
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
          ),
          items: carouselItems.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Stack(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(item['imagePath']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        color: Colors.black.withOpacity(0.5),
                        child: Text(
                          item['caption']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 20.0), // Jarak antara slider dan teks "Halaman Home"
        Center(
          child: Text(
            'Halaman Home',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
