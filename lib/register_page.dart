import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:indonesia_bijak/home_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
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
                controller: _fullNameController,
                decoration: InputDecoration(
                  labelText: 'Full Name',
                ),
              ),
              SizedBox(height: 20),
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
                  _register();
                },
                child: Text('Register'),
              ),
              SizedBox(height: 10),
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

  void _register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
        .then((value) {
      // Tambahkan nama lengkap ke profil pengguna

      value.user
          ?.updateProfile(displayName: _fullNameController.text)
          .then((_) {
        print("berhasil");
        // Registrasi berhasil, navigasi ke halaman beranda
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: ((context) => HomePage())),
        );
      }).catchError((error) {
        // Tangani kesalahan pembaruan profil
        setState(() {
          _errorMessage = 'Gagal memperbarui profil. ${error.message}';
        });
      });
    }).catchError((error) {
      // Tangani kesalahan registrasi
      setState(() {
        _errorMessage = 'Gagal mendaftar. ${error.message}';
      });
    });
  }
}
