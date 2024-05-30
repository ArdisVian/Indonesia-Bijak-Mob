import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia_bijak/bloc/user_bloc.dart';
import 'package:indonesia_bijak/editProfile_page.dart';
import 'package:indonesia_bijak/auth/login_page.dart';
import 'package:indonesia_bijak/models/user_model.dart';

class DrawerPage extends StatefulWidget {
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _currentUser = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 252, 132, 121),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Halo,',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                BlocBuilder<UserBloc, UserModel?>(builder: (context, state) {
                  return Text(
                    state == null ? 'Guest' : '${state.name}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  );
                }),
              ],
            ),
          ),
          BlocBuilder<UserBloc, UserModel?>(builder: (context, state) {
            return ListTile(
              title: Text('Edit Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        state == null ? LoginPage() : EditProfilePage(),
                  ),
                );
              },
            );
          }),
          ListTile(
            title:
                _currentUser != null ? Text('Logout') : Text('Login/Register'),
            onTap: _currentUser != null
                ? () async {
                    await FirebaseAuth.instance.signOut();
                    context.read<UserBloc>().saveUser(null);
                    setState(() {});
                  }
                : () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
          ),
        ],
      ),
    );
  }
}
