import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:indonesia_bijak/bloc/user_bloc.dart';
import 'package:indonesia_bijak/models/kandidat_model.dart';
import 'package:indonesia_bijak/models/user_model.dart';

class CoblosPage extends StatefulWidget {
  const CoblosPage({super.key});

  @override
  State<CoblosPage> createState() => _CoblosPageState();
}

class _CoblosPageState extends State<CoblosPage> {
  bool _isLoading = true;
  List<Kandidat> kandidatData = [];
  QuerySnapshot? querySnapshot;
  var _currentUser = FirebaseAuth.instance.currentUser;

  Future<void> _vote(Kandidat kandidat) async {
    if (_currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('anda harus login untuk melakukan pemilihan!'),
        showCloseIcon: true,
      ));
      return;
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_currentUser!.uid)
          .collection('voting')
          .doc(DateTime.now().year.toString())
          .set(
        {
          'no_urut': kandidat.noUrut,
          'user_id': _currentUser!.uid,
        },
      );
      await FirebaseFirestore.instance
          .collection('pemilu')
          .doc(DateTime.now().year.toString())
          .collection('voting')
          .doc(_currentUser!.uid)
          .set({
        'no_urut': kandidat.noUrut,
        'user_id': _currentUser!.uid,
      });
      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _showConfirmVote(Kandidat kandidat) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pilih no urut ${kandidat.noUrut}'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                  'Yakin pilih pasangan ${kandidat.nama}',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'anda tidak dapat membatalkan ini',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: const ButtonStyle(
                  foregroundColor: WidgetStatePropertyAll(
                      Color.fromARGB(255, 249, 116, 107))),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'batal',
              ),
            ),
            TextButton(
              child: const Text(
                'PILIH',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(
                      const Color.fromARGB(255, 249, 116, 107))),
              onPressed: () async {
                await _vote(kandidat);
              },
            ),
          ],
        );
      },
    );
  }

  void _fetchUserData() async {
    try {
      querySnapshot = await FirebaseFirestore.instance
          .collection('pemilu')
          .doc(DateTime.now().year.toString())
          .collection('kandidat')
          .get();
      kandidatData = [
        ...querySnapshot!.docs.map(
          (kandidat) {
            return Kandidat(
                noUrut: kandidat['no_urut'],
                nama: kandidat['nama'],
                fotoUrl: kandidat['foto'],
                visi: kandidat['visi'],
                misi: kandidat['misi'],
                jumlahVote: 'No vote yet.');
          },
        )
      ];
    } catch (e) {
      print(e);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _fetchUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool _isLoggedIn = _currentUser != null;
    return BlocBuilder<UserBloc, UserModel?>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          leading: SizedBox(),
        ),
        body: state == null
            ? Center(
                child: Text('Anda harus login untuk melakukan pemilihan'),
              )
            : _isLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  )
                : StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('users')
                        .doc(_currentUser!.uid)
                        .collection('voting')
                        .doc(DateTime.now().year.toString())
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }
                      if (!snapshot.hasData || snapshot.hasError) {
                        return CircularProgressIndicator();
                      }
                      if (snapshot.data?.data() == null ||
                          snapshot.data!.data()!.isEmpty) {
                        return Column(
                          children: [
                            const Text(
                              'TENTUKAN PILIHANMU!',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            Center(
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child: PageView.builder(
                                  itemCount: kandidatData.length,
                                  itemBuilder: (context, index) {
                                    final kandidat = kandidatData[index];
                                    return Center(
                                      child: Container(
                                        margin: const EdgeInsets.symmetric(
                                            vertical: 16.0, horizontal: 16),
                                        padding: const EdgeInsets.all(0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.grey.withOpacity(1),
                                              spreadRadius: 2,
                                              blurRadius: 5,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  kandidat.noUrut,
                                                  style: const TextStyle(
                                                      fontSize: 48,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(0),
                                                  child: Image.asset(
                                                    kandidat.fotoUrl,
                                                    height: 250,
                                                    width: double.infinity,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 16,
                                                ),
                                                Text(
                                                  kandidat.nama,
                                                  textAlign: TextAlign.justify,
                                                  style: const TextStyle(
                                                    fontSize: 20.0,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 8,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.all(16.0),
                                                child: FilledButton(
                                                  style: const ButtonStyle(
                                                      minimumSize:
                                                          WidgetStatePropertyAll(
                                                        Size(120, 50),
                                                      ),
                                                      backgroundColor:
                                                          WidgetStatePropertyAll(
                                                              const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  245,
                                                                  86,
                                                                  74))),
                                                  onPressed: () {
                                                    _showConfirmVote(kandidat);
                                                  },
                                                  child: const Text(
                                                    "PILIH",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        );
                      }
                      return const Center(
                        child: Text('Kamu sudah memilih'),
                      );
                      ;
                    }),
      );
    });
  }
}
