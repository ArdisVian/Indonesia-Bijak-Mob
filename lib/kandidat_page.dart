import 'package:flutter/material.dart';

class Kandidat {
  final String nama;
  final String fotoUrl;
  final String visi;
  final String misi;

  Kandidat(this.nama, this.fotoUrl, this.visi, this.misi);
}

class KandidatPage extends StatelessWidget {
  final List<Kandidat> kandidatData = [
    Kandidat(
      'Anies & Muhaimin',
      'Assets/Images/aniesimin.png',
      'Visi: Indonesia Adil dan Makmur Untuk Semua',
      'Misi: Memastikan ketersediaan kebutuhan pokok dan biaya hidup murah melalui kemandirian pangan, ketahanan energi, dan kedaulatan air,',
    ),
    Kandidat(
      'Prabowo & Gibran',
      'Assets/Images/prabowogibran.jpg',
      'Visi: Bersama Indonesia Maju Menuju Indonesia Emas 2045',
      'Misi: Memantapkan sistem pertahanan keamanan negara dan mendorong kemandirian bangsa melalui swasembada pangan, energi, air, ekonomi syariah, ekonomi digital, ekonomi hijau, dan ekonomi biru',
    ),
    Kandidat(
      'Ganjar & Mahfud',
      'Assets/Images/ganjarmahfud.jpg',
      'Visi: Gerak Cepat Menuju Indonesia Unggul',
      'Misi: Manusia Indonesia yang sehat, terdidik, dan sejahtera; Indonesia unggul dalam bidang inovasi dan teknologi, Ekonomi yang tangguh dan berdikari;',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calon Kandidat Presiden'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: PageView.builder(
          itemCount: kandidatData.length,
          itemBuilder: (context, index) {
            final kandidat = kandidatData[index];
            return Center(
              child: Container(
                width: MediaQuery.of(context).size.width * 0.8,
                margin: EdgeInsets.symmetric(vertical: 16.0),
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(1),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(height: 16.0),
                    Text(
                      kandidat.nama,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      kandidat.visi,
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      kandidat.misi,
                      style: TextStyle(fontSize: 16.0),
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
