import 'package:flutter/material.dart';
import 'package:projek_injak/splash_screen.dart';
import 'home_page.dart';
import 'partai_page.dart';
import 'kandidat_page.dart';
import 'coblos_page.dart';
import 'editProfile_page.dart';
import 'login_page.dart';

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
      home: SplashScreen(),
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
    HomePage(),
    PartaiPage(),
    KandidatPage(),
    CoblosPage(),
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
                    backgroundImage: AssetImage(
                        'Assets/Images/guest.jpg'), // Ganti dengan lokasi gambar profil
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Guest',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      ' ',
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
                Navigator.pop(context); // close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          EditProfilePage()), // Buka page Edit Profile
                );
              },
            ),
            ListTile(
              title: Text('Login/Register'),
              onTap: () {
                Navigator.pop(context); // close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LoginPage()), // Buka halaman Login
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        // Bottom NavigationBar section
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
