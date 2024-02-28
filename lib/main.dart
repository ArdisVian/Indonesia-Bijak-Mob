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
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
          ),
          items: [
            'Assets/Images/beritadua.png',
            'Assets/Images/beritasatu.jpg',
            'Assets/Images/Beritatiga.jpg',
          ].map((String imagePath) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
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
