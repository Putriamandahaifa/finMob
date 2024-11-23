import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/screens/splashscreen.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Tambahkan aksi tombol kembali
          },
        ),
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
                  "Kevin",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Kevin@maling.com",
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
                  // Aksi ketika tombol Profile ditekan
                }),
                _buildMenuOption(Icons.bookmark, "Bookmarked", () {
                  // Aksi ketika tombol Bookmarked ditekan
                }),
                _buildMenuOption(Icons.history, "Previous Trips", () {
                  // Aksi ketika tombol Previous Trips ditekan
                }),
                _buildMenuOption(Icons.settings, "Settings", () {
                  // Aksi ketika tombol Settings ditekan
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
}
