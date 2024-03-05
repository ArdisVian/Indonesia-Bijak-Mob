import 'package:flutter/material.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 243, 90, 76),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implementasi logika untuk login di sini
              },
              child: Text('Login'),
            ),
            SizedBox(height: 10), // Tambahkan jarak antara tombol dan teks
            GestureDetector(
              onTap: () {
                // Navigasi ke halaman registrasi
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterPage()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'Belum punya akun? ',
                  style: TextStyle(
                    color: Colors.black, // Warna teks sebelumnya
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Daftar Sekarang',
                      style: TextStyle(
                        color: Colors.blue, // Warna biru untuk teks ini
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
