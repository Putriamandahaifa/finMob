import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/models/content.dart';
import 'package:wisata_mobile_5/models/destination_model.dart';
import 'package:wisata_mobile_5/screens/signup_page.dart';
import 'package:wisata_mobile_5/widget/rekomendasi_destination.dart';

class Profile extends StatelessWidget {
  final String username;
  final String fullname;
  final String address;
  final String birth;

  const Profile({Key? key, required this.username, required this.fullname, required this.address, required this.birth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile picture
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/barbie.png'), // Replace with your avatar image path
            ),
            SizedBox(height: 8),
            // User Name
            Text(
              username,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),

            // Profile Fields
            ProfileField(
              label: 'User Name',
              value: username,
            ),
            SizedBox(height: 16),
            ProfileField(
              label: 'Full Name',
              value: fullname,
            ),
            SizedBox(height: 16),
            ProfileField(
              label: 'Birth Day',
              value: birth,
            ),
            SizedBox(height: 16),
            ProfileField(
              label: 'Address',
              value: address,
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 4),
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}