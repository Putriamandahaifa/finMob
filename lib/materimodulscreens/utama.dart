import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/materimodulscreens/page/cibodas.dart';
import 'package:wisata_mobile_5/materimodulscreens/page/curugciberem.dart';
import 'package:wisata_mobile_5/materimodulscreens/page/most.dart';
import 'package:wisata_mobile_5/materimodulscreens/page/near.dart';
import 'package:wisata_mobile_5/materimodulscreens/page/popular.dart';
import 'package:wisata_mobile_5/materimodulscreens/page/thenice.dart';
import 'package:wisata_mobile_5/materimodulscreens/profile.dart';
import 'package:wisata_mobile_5/materimodulscreens/searchpage.dart';
import 'package:wisata_mobile_5/materimodulscreens/Favorite.dart';
import 'package:wisata_mobile_5/materimodulscreens/userpage.dart';
import 'package:wisata_mobile_5/models/content.dart';
import 'package:wisata_mobile_5/models/destination_model.dart';
import 'package:wisata_mobile_5/screens/Loginpage.dart';
import 'package:wisata_mobile_5/screens/splashscreen.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String fullname;
  final String address;
  final String birth;

  const HomePage({Key? key, required this.username, required this.fullname, required this.address, required this.birth}) : super(key: key);
  
  @override
  State<HomePage> createState() => _HomePageState();
}
class HomePege extends StatefulWidget {
  final String username;

  const HomePege({Key? key, required this.username}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0; // Indeks tab yang aktif

  int _selectedIndex = 0;
  TextEditingController getUser =
      TextEditingController(); // Controller for username
  late String username; // Declare a variable to store the username
  TextEditingController getName =
      TextEditingController(); // Controller for username
  late String fullname; // Declare a variable to store the username
  TextEditingController getAlamat =
      TextEditingController(); // Controller for username
  late String address; // Declare a variable to store the username
  TextEditingController getTtl =
      TextEditingController(); // Controller for username
  late String birth; // Declare a variable to store the username
  // Initialize the list of pages
  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    // Inisialisasi halaman dengan meneruskan username ke UserPage
    _pages = [
      buildutama(),
      CalendarPage(), // Halaman utama
      Favorite(),
      builduser(widget.username,context, widget.address, widget.birth, widget.fullname), // Kirim username ke UserPage
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
      body: _pages[_currentIndex], // Tampilkan halaman sesuai indeks
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
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_rounded),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '',
          ),
        ],
      ),
    );
  }

  //=============================================
  int selectedPage = 0;

  List<TravelDestination> popular = listDestination
      .where((element) => element.category == 'popular')
      .toList();

  List<TravelDestination> rekomendasi = listDestination
      .where((element) => element.category == 'rekomendasi')
      .toList();

  bool _isTapped1 = false;
  bool _isTapped2 = false;

  void _resetColors() {
    setState(() {
      _isTapped1 = false;
      _isTapped2 = false;
    });
  }

  @override
  Widget buildutama() {
    automaticallyImplyLeading:
    false;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0), // Tinggi AppBar
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false, // Menghapus tombol kembali default
          flexibleSpace: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Menjaga keselarasan vertikal
              children: [
                // Bagian kiri: Teks dengan subjudul
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Menjaga teks sejajar dengan gambar
                  children: [
                    const SizedBox(height: 15.0),
                    // Replace 'Kevin' with the dynamic username
                    Text(
                      'Hi, ${widget.username} 👋', // Dynamically display username here
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      'Eksplor The World',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                // Bagian kanan: CircleAvatar
                CircleAvatar(
                  radius: 20.0, // Ukuran gambar avatar
                  backgroundImage: AssetImage(
                    'assets//images/barbie.jpg', // Ganti dengan gambar profil
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap:
            _resetColors, // Reset warna kotak ke abu-abu jika tap terjadi di luar kotak
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Popular places',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Aksi ketika "View all" diklik
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Viewall()),
                          );
                        },
                        child: const Text(
                          'View all',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Color.fromARGB(135, 90, 90, 90),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Kotak hitam dengan aksi ketukan
            SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Container(
                height: 45.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    // Kotak pertama ('Most viewed')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Most()),
                          );
                        },
                        child: Container(
                          height: 45.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: _isTapped1
                                ? Colors.black
                                : Colors
                                    .grey[300], // Warna berubah saat ditekan
                            borderRadius:
                                BorderRadius.circular(15.0), // Sudut melengkung
                          ),
                          alignment:
                              Alignment.center, // Agar teks berada di tengah
                          child: const Text(
                            'Most viewed',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0, // Teks menjadi bold
                            ),
                            textAlign: TextAlign
                                .center, // Teks berada di tengah horizontal
                          ),
                        ),
                      ),
                    ),
                    // Kotak kedua ('Nearby')
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Near()),
                          );
                        },
                        splashColor: Colors.black, // Efek splash saat ditekan
                        child: Container(
                          height: 45.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            color: Colors.grey[300], // Warna default
                            borderRadius:
                                BorderRadius.circular(15.0), // Sudut melengkung
                          ),
                          alignment:
                              Alignment.center, // Agar teks berada di tengah
                          child: const Text(
                            'Nearby',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 11.0,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //content gambar
            Padding(
              padding: const EdgeInsets.fromLTRB(15.0, 35.0, 20.0, 20.0),
              child: Container(
                height: 460.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(bottom: 20, left: 20),
                  child: Row(
                    children: List.generate(
                      popular.length,
                      (index) => Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    Detail(destination: popular[index]),
                              ),
                            );
                          },
                          child: Container(
                            height: 445.0,
                            width: 250.0, // Lebar tiap gambar
                            margin: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 15.0,
                            ), // Memberi jarak antar gambar
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      const Color.fromARGB(255, 211, 209, 209)
                                          .withOpacity(1),
                                  offset: const Offset(0, 6),
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(
                                  popular[index].image![
                                      0], // Mengambil gambar pertama dari daftar
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                // Teks di atas gambar
                                Positioned(
                                  bottom: 10,
                                  left: 10,
                                  right: 10,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15.0),
                                    child: BackdropFilter(
                                      filter: ImageFilter.blur(
                                          sigmaX: 5.0, sigmaY: 5.0),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        height: 75,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            popular[index]
                                                .name, // Nama destinasi
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget builduser(String username, BuildContext context, String address, String birth, String fullname) {
  return Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false, // Hilangkan panah kembali
      title: Text(
        "Profile",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    ),
    backgroundColor: Colors.white,
    body: Column(
      children: [
        // Bagian atas (Profile Picture dan Info)
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets//images/barbie.jpg'), // Ganti dengan gambar profil
              ),
              SizedBox(height: 10),
              Text(
                "$username",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5),
              Text(
                "${username}@maling.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),

        // Bagian Statistik
        SizedBox(
          height: 20.0,
        ),
        // Bagian Tombol Menu
        
        Expanded(
          child: ListView(
            children: [
              _buildMenuOption(Icons.person, "Profile", () {
                
                Navigator.push(
                  context,
                  
                  MaterialPageRoute(builder: (context) => Profile(username: username, fullname:fullname, address:address, birth:birth)),
                );
              }),
              _buildMenuOption(Icons.logout, "Log Out", () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Splashscreen()),
                );
              }),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildMenuOption(IconData icon, String title, VoidCallback onTap) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.7),
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            Color iconColor = Colors.grey[600]!; // Warna awal abu-abu
            Color textColor = Colors.grey[700]!; // Teks abu-abu awal

            return InkWell(
              onTap: () {
                setState(() {
                  iconColor = Colors.black; // Ubah ikon menjadi hitam
                  textColor = Colors.black; // Ubah teks menjadi hitam
                });
                onTap();
              },
              child: ListTile(
                leading: Icon(icon, color: iconColor),
                title: Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    color: textColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}
