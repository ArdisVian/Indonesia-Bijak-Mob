import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:indonesia_bijak/home_page.dart';
import 'package:indonesia_bijak/main.dart';
import 'register_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Color.fromARGB(255, 243, 90, 76),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _login();
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
              SizedBox(height: 10), // Tambahkan jarak antara tombol dan teks
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
        .then((value) {
      // Berhasil masuk, navigasi ke halaman beranda
      Navigator.push(
        context,
        MaterialPageRoute(builder: ((context) => IndonesiaBijakHomePage())),
      );
    }).catchError((error) {
      // Menangani kesalahan otentikasi
      setState(() {
        _errorMessage = 'Gagal masuk. Pastikan email dan password Anda benar.';
      });
    });
  }
}
