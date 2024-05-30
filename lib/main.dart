import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia_bijak/Drawer_page.dart';
import 'package:indonesia_bijak/bloc/user_bloc.dart';
import 'package:indonesia_bijak/splash_screen.dart';
import 'home_page.dart';
import 'partai_page.dart';
import 'kandidat_page.dart';
import 'coblos_page.dart';
import 'editProfile_page.dart';
import 'auth/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: IndonesiaBijakApp(),
    ),
  );
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
      drawer: DrawerPage(),

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
