import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_bijak/models/kandidat_model.dart';

class KandidatPage extends StatefulWidget {
  const KandidatPage({super.key});

  @override
  State<KandidatPage> createState() => _KandidatPageState();
}

class _KandidatPageState extends State<KandidatPage> {
  bool _isLoading = true;
  List<Kandidat> kandidatData = [];
  QuerySnapshot? querySnapshot;

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
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        centerTitle: true,
        title: const Text(
          'Calon Kandidat Presiden',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: PageView.builder(
                itemCount: kandidatData.length,
                itemBuilder: (context, index) {
                  final kandidat = kandidatData[index];
                  return Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      margin: const EdgeInsets.symmetric(vertical: 16.0),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.asset(
                                  kandidat.fotoUrl,
                                  height: 200,
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
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Text(
                                kandidat.visi,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14.0),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                kandidat.misi,
                                textAlign: TextAlign.justify,
                                style: const TextStyle(fontSize: 14.0),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('pemilu')
                                    .doc(DateTime.now().year.toString())
                                    .collection('voting')
                                    .where('no_urut',
                                        isEqualTo: kandidat.noUrut)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return const Center(
                                        child: CircularProgressIndicator
                                            .adaptive());
                                  }
                                  if (!snapshot.hasData || snapshot.hasError) {
                                    return const Center(
                                        child: CircularProgressIndicator
                                            .adaptive());
                                  }
                                  return Text(
                                    '${snapshot.data!.docs.length} Vote',
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
