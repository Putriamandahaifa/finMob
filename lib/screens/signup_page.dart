import 'package:flutter/material.dart';
import 'package:wisata_mobile_5/materimodulscreens/page/thenice.dart';
import 'package:wisata_mobile_5/materimodulscreens/utama.dart';
import 'package:wisata_mobile_5/screens/Loginpage.dart';

TextEditingController getUser = TextEditingController();
TextEditingController getNama = TextEditingController();
TextEditingController getAlamat = TextEditingController();
TextEditingController getTtl = TextEditingController();
TextEditingController getPass = TextEditingController();

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '', 
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        
      backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            Text(
              'SIGN UP', 
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26.0), 
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Text(
              'Please Enter Your Personal Data', 
              style: TextStyle(fontSize: 16.0), 
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                controller: getUser,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                
                  labelText: 'Username',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                controller: getNama,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                
                  labelText: 'Name',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                controller: getTtl,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                
                  labelText: 'Tempat, Tanggal Lahir',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                controller: getAlamat,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                
                  labelText: 'Alamat',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding:const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                obscureText: true,
                controller: getPass,
                cursorColor: Colors.black,
                
                decoration: InputDecoration(
                  
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  
                  labelText: 'Password',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                cursorColor: Colors.black,
                obscureText: true,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  
                  labelText: 'Confirm Password',
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300.0,
              height: 50.0,
              child: ElevatedButton(
              onPressed: () {
                // Ambil username dari TextField
                String username = getUser.text;
                String fullname = getNama.text;
                String address = getAlamat.text;
                String birth = getTtl.text;

                // Navigasi ke HomePage dan kirimkan username
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(username: username, fullname:fullname, address:address, birth:birth),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black, // Warna background button
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            ),
          ],
        ),
      ),
    );
  }
}
