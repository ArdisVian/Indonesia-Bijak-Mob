import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(NewsApp());
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list image dan caption
  final List<Map<String, String>> carouselItems = [
    {
      'imagePath': 'Assets/Images/beritadua.png',
      'caption': 'Real Count: Prabowo Masih Unggul',
      'description':
          'Pemilu masih berlangsung dengan ketat dan hasil real count menunjukkan Prabowo masih unggul.',
    },
    {
      'imagePath': 'Assets/Images/beritasatu.jpg',
      'caption': 'Prabowo Naik Pangkat',
      'description':
          'Prabowo naik pangkat menjadi Panglima Tertinggi dalam pertarungan politik.',
    },
    {
      'imagePath': 'Assets/Images/Beritatiga.jpg',
      'caption': 'Ganjar Hak Angket',
      'description':
          'Ganjar diberi hak angket oleh DPR untuk menyelidiki kasus korupsi yang terjadi di daerahnya.',
    },
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Berita terbaru hari ini',
          style: TextStyle(fontSize: 30),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            // section slider
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
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
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 3,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
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
            SizedBox(height: 20.0), // Jarak antara slider dan indikator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: carouselItems.map((item) {
                int index = carouselItems.indexOf(item);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: EdgeInsets.symmetric(horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.blue : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
                height: 10.0), // Jarak antara indikator dan teks "Latest News"
            Text(
              'Latest News',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
                height: 20.0), // Jarak antara teks "Latest News" dan konten

            // Konten berita
            for (var item in carouselItems)
              Container(
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                padding: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100.0,
                      height: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(item['imagePath']!),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['caption']!,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            item['description']!,
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
