import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(IndonesiaBijakApp());
}

class IndonesiaBijakApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indonesia Bijak',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: IndonesiaBijakHomePage(),
    );
  }
}

class IndonesiaBijakHomePage extends StatefulWidget {
  @override
  _IndonesiaBijakHomePageState createState() => _IndonesiaBijakHomePageState();
}

class _IndonesiaBijakHomePageState extends State<IndonesiaBijakHomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeWidget(),
    PartaiWidget(),
    KandidatWidget(),
    CoblosWidget(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indonesia Bijak'),
        backgroundColor: Color.fromARGB(255, 243, 90, 76),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 252, 132, 121),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                        'https://cdn.antaranews.com/cache/1200x800/2023/09/13/Gibran-ruang-publik.jpg'), // Ganti dengan lokasi gambar profil
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Gibran Rakabuming',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      'Gibran@Gmail.com',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.pop(context); // Menutup drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage()), // Buka halaman Edit Profile
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Partai',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Kandidat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Coblos',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 255, 118, 118),
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 1),
            enlargeCenterPage: true,
          ),
          items: [
            'https://awsimages.detik.net.id/visual/2024/02/23/real-count-kpu-capai-7526-anies-ganjar-dapat-segini_169.png?w=650',
            'https://images.bisnis.com/upload/img/Real_Count_KPU.jpg',
            'https://cdn.antaranews.com/cache/1200x800/2024/02/23/antarafoto-pertemuan-ganjar-dengan-tpn-15022024-ada-2.jpg',
          ].map((String imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        'Berita hari ini',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
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

class PartaiWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Partai'),
    );
  }
}

class KandidatWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Kandidat'),
    );
  }
}

class CoblosWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Halaman Coblos'),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color.fromARGB(255, 243, 90, 76),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi aksi untuk menyimpan perubahan profil
                String newUsername = _usernameController.text;
                // Simpan perubahan ke profil
                // Misalnya: updateUserProfile(newUsername);
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
