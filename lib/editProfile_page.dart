import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia_bijak/bloc/user_bloc.dart';
import 'package:indonesia_bijak/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController? _nikController = TextEditingController();
  TextEditingController? _fullNameController = TextEditingController();
  TextEditingController? _addressController = TextEditingController();

  void _editProfile(BuildContext context) async {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update(
        {
          'name': _fullNameController!.text,
          'nik': _nikController!.text,
          'address': _addressController!.text
        },
      );
      if (!mounted) {
        return;
      }
      context.read<UserBloc>().saveUser(UserModel(
          nik: _nikController!.text,
          name: _fullNameController!.text,
          address: _addressController!.text));
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("success"),
          showCloseIcon: true,
        ),
      );
    } on FirebaseException catch (error) {
      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(error.message!),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color.fromARGB(255, 243, 90, 76),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<UserBloc, UserModel?>(builder: (context, state) {
          if (state != null) {
            _nikController!.text = state.nik;
            _fullNameController!.text = state.name;
            _addressController!.text = state.address!;
          }
          return Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().length != 16) {
                      return 'tidak valid';
                    }
                    return null;
                  },
                  controller: _nikController,
                  decoration: InputDecoration(
                    labelText: 'NIK',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'tidak valid';
                    }
                    return null;
                  },
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  maxLines: 4,
                  controller: _addressController,
                  decoration: InputDecoration(
                    labelText: 'Address',
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    _editProfile(context);
                  },
                  child: Text('Simpan'),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
