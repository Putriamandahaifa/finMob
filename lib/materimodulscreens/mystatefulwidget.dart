import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/materimodulscreens/searchpage.dart';
import 'package:wisata_mobile_5/materimodulscreens/Favorite.dart';
import 'package:wisata_mobile_5/materimodulscreens/userpage.dart';
import 'package:wisata_mobile_5/materimodulscreens/utama.dart';

class Mystatefulwidget extends StatefulWidget {
  const Mystatefulwidget({super.key});

  @override
  State<Mystatefulwidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Mystatefulwidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MainPage(),
      debugShowCheckedModeBanner: false, // Menghilangkan banner debug
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0; // Indeks tab yang aktif
  
   int _selectedIndex = 0;
  TextEditingController getUser = TextEditingController();  // Controller for username
  late String username;  // Declare a variable to store the username

  // Initialize the list of pages
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // Assume that username is retrieved from the login form
    username = getUser.text;  // Get the username from the login form

    // Now initialize the pages list with the username
    _pages = [
      HomePege(username: username),  // Pass the username to HomePage
    CalendarPage(), // Halaman Cari
    Favorite(), // Halaman Pengaturan
    Userpage(), // Halaman Pengguna  // Pass the username to UserPage
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _pages[_currentIndex], // Mengganti halaman berdasarkan tab yang aktif
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            label: 'Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'User',
          ),
        ],
      ),
    );
  }
}
