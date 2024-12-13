import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wisata_mobile_5/materimodulscreens/utama.dart';
import 'package:wisata_mobile_5/screens/signup_page.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController getUser = TextEditingController();
  final TextEditingController getPass = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    getUser.addListener(_checkInput);
    getPass.addListener(_checkInput);
  }

  @override
  void dispose() {
    getUser.dispose();
    getPass.dispose();
    super.dispose();
  }

  void _checkInput() {
    setState(() {
      isButtonEnabled = getUser.text.isNotEmpty && getPass.text.isNotEmpty;
    });
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          '',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 50),
             Text(
              'LOGIN',
              style: GoogleFonts.inter(fontWeight: FontWeight.bold, fontSize: 60.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Text(
                'Miindung ka waktu, Mibapa ka zaman',
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                controller: getUser,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 30.0, top: 20.0, bottom: 20.0),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  labelText: 'Email or Username',
                  labelStyle: const TextStyle(color: Colors.black), fillColor: Colors.grey
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
              child: TextFormField(
                obscureText: true,
                controller: getPass,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  contentPadding: const EdgeInsets.only(
                    left: 30.0,
                    top: 20.0,
                    bottom: 20.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 2.0),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.black), fillColor: Colors.grey, focusColor: Colors.white
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 320.0,
              height: 50.0,
              child: ElevatedButton(
                onPressed: isButtonEnabled
                    ? () {
                        // Ambil username dari TextField
                        String username = getUser.text;

                        // Navigasi ke HomePage dan kirimkan username
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomePege(username: username),
                          ),
                        );
                      }
                    : () {
                        _showSnackBar(
                            context, 'Tolong Masukan Username dan Password');
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black, // Warna background button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Don't have an account?  "),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignupPage()),
                );
              },
              child: const Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
