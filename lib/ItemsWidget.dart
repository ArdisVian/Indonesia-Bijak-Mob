import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:indonesia_bijak/ItemContent.dart';
import 'ProfilPartai.dart';

class ItemsWidget extends StatelessWidget {
  List<String> img = [
    'https://framerusercontent.com/images/RfU29vvdx95uC5rwdjOhZ8dygAg.webp',
    'https://framerusercontent.com/images/CpnFpNERCoYxrQHPG2EOwRj14UQ.webp',
    'https://framerusercontent.com/images/8t5uRJOzcZFxgdabguA4KaLLs.webp',
    'https://framerusercontent.com/images/0V0IduzBnP5bTqJRMCkflIobiE.webp',
    'https://framerusercontent.com/images/fOdt7cbt9PSjcnJnVVZWxYqzMPc.webp',
    'https://framerusercontent.com/images/0VJkRIZP0EaGTEGhqzkJ3IAback.webp',
  ];

  List<Widget> DetailKontent = [
    ProfilPartai(
        namaPartai: "Golkar",
        deskripsi:
            "Berdiri tahun 1964, Partai Golongan Karya (Golkar) adalah salah satu partai politik tertua di Indonesia. Menurut ilmuwan politik Ulla Fionna dan Dirk Tomsa, Golkar masih sering diingat sebagai kendaraan politik kalangan elit zaman rezim Presiden Suharto. Sekarang, Golkar tetap menjadi partai yang kuat dengan pandangan politik tengah-kanan. Wakil Sekretaris Jenderal Golkar Puteri Komarudin menjelaskan bahwa Golkar menjadi ‘matang’ karena fokus ke pemberdayaan pemuda, ekonomi kreatif, dan pembaharuan sektor publik.",
        perolehan: ItemContent(
          item1: "1. Gorontalo 29,1%",
          item2: "2. Jambi 21,4%",
          item3: "3. Sumatera Selatan 20,2%",
        )),
    ProfilPartai(
        namaPartai: "PKB",
        deskripsi:
            "Partai Kebangkitan Bangsa (PKB) adalah partai politik Islam-Nasionalis yang didirikan pada tahun 1998 di awal era reformasi Indonesia. PKB deskripsikan oleh Carnegie Endowment sebagai partai sayap kanan yang memiliki hubungan sejarah kuat dengan organisasi Islam terbesar di Indonesia, Nahdlatul Ulama (NU). PKB didirikan oleh tokoh NU terkemuka dan Presiden Indonesia keempat, Abdurrahman Wahid (biasa dikenal sebagai Gus Dur), sebelum kemudian diambil alih oleh Muhaimin Iskandar (Cak Imin). Menurut Media Survei Nasional, basis utama pendukung PKB terdiri dari umat Muslim yang berafiliasi dengan NU di pulau Jawa, mengingat PKB memiliki hubungan yang kuat dengan para pemimpin agama (kyai) yang memiliki pengaruh besar di kalangan pengikut mereka. Meski demikian, Ketua Umum Pengurus Besar Nahdlatul Ulama (PBNU) Yahya Cholil Staquf (Gus Yahya) menegaskan bahwa PKB bukan partai yang merepresentasikan Nahdlatul Ulama (NU), karena NU telah mengambil jarak dengan politik praktis.",
        perolehan: ItemContent(
          item1: "1. Jawa Timur 19,5%",
          item2: "2. Jawa Tengah 14,7%",
          item3: "3. Daerah Istimewa Yogyakarta 13,2%",
        )),
    ProfilPartai(
        namaPartai: "NasDem",
        deskripsi:
            "NasDem (Nasional Demokrat) awalnya didirikan sebagai organisasi masyarakat oleh beberapa pemimpin Golkar di tahun 2010. Pada tahun 2011, NasDem me-rebranding diri menjadi sebuah partai oleh Surya Paloh. Berkat kekuatan organisasi dan dukungan finansial Surya Paloh, NasDem secara cepat menempatkan diri dan langsung memenuhi syarat pemilihan legislatif tahun 2014. Menurut website mereka sendiri, NasDem mendorong agenda pemulihan Indonesia, dengan menempatkan fokus kepada kedaulatan nasional dan identitas gotong royong sesuai dengan Konstitusi 1945.",
        perolehan: ItemContent(
          item1: "1. Papua 26,8%",
          item2: "2. Gorontalo 25,3%",
          item3: "3. Nusa Tenggara Timur 21,6%",
        )),
    ProfilPartai(
        namaPartai: "PDI-P",
        deskripsi:
            "Partai Demokrasi Indonesia Perjuangan (PDI-P) merupakan partai politik terbesar di Indonesia saat ini, berdasarkan perolehan kursi DPR RI (22.3%). PDI-P dibentuk pada tahun 1999 setelah era Suharto berakhir dan pembatasan partai politik dicabut. Menurut ketua umumnya, Megawati, sebagai partai yang berorientasi nasionalis, PDI-P adalah 'partai wong cilik' yang mewakili suara masyarakat miskin. Sebagai penerus Partai Nasional Indonesia (PNI) yang didirikan oleh presiden pertama Indonesia Soekarno pada tahun 1927, menurut Tenggara Strategics, faktor daya tarik Soekarno juga ikut jadi faktor penting dalam menjaga basis dukungan PDI-P selama pemilu.",
        perolehan: ItemContent(
          item1: "1. Papua 26,8%",
          item2: "2. Gorontalo 25,3%",
          item3: "3. Nusa Tenggara Timur 21,6%",
        )),
    ProfilPartai(
        namaPartai: "Demokrat",
        deskripsi:
            "Partai Demokrat didirikan pada tahun 2001 oleh Susilo Bambang Yudhoyono (SBY), yang merupakan Presiden Indonesia pertama yang dipilih langsung oleh rakyat secara demokratis di tahun 2004. Dengan visi mereformasikan institusi demokrasi Indonesia, New Mandala menyebut Demokrat sebagai partai tengah-kanan. Menurut ilmuwan politik Diego Fossati dan Carnegie Endowment, Demokrat adalah partai yang berbasis figur pemimpinya (figur-centric) dan tidak ber-ideologi tentu. Partai Demokrat memiliki track record mendukung kebijakan ekonomi yang condong liberal, pluralisme budaya, dan pentingnya koperasi internasional buat Indonesia.",
        perolehan: ItemContent(
          item1: "1. Papua 26,8%",
          item2: "2. Gorontalo 25,3%",
          item3: "3. Nusa Tenggara Timur 21,6%",
        )),
    ProfilPartai(
        namaPartai: "Gerindra",
        deskripsi:
            "Gerindra adalah partai dengan ideologi yang berlandaskan nasionalisme dan pertahanan kesatuan negara. Menurut institut riset Carnegie Endowment for International Peace, Gerindra didirikan, dan secara besar berfungsi, sebagai sarana politik Prabowo Subianto setelah ia gagal memenangkan nominasi ketua umum Golkar pada tahun 2004. Menurut kader senior Gerindra, ideologi partai Gerinda pun sangat melekat kepada figur Prabowo, yang berfokus pada penarikan investasi asing sambil tetap mempertahankan kedaulatan nasional. Hal ini sejalan dengan pernyataan visi Gerindra yang ingin menggunakan kekuatan politik untuk memperkuat ekonomi nasional dengan menjaga nilai-nilai kultural.",
        perolehan: ItemContent(
          item1: "1. Papua 26,8%",
          item2: "2. Gorontalo 25,3%",
          item3: "3. Nusa Tenggara Timur 21,6%",
        )),
  ];

  List<String> nama = [
    'Partai Golongan Karya (Golkar)',
    'Partai Kebangkitan Bangsa (PKB)',
    'Partai Nasional Demokrat (NasDem)',
    'Partai Demokrasi Indonesia Perjuangan (PDI-P)',
    'Partai Demokrat',
    'Partai Gerakan Indonesia Raya (Gerindra)',
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < img.length; i++)
          Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 237, 239, 241),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.network(
                        img[i],
                        width: 120,
                        height: 120,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            nama[i],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Partai",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailKontent[i],
                              ),
                            );
                          },
                          child: Text(
                            "Pelajari selengkapnya",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
      ],
    );
  }
}
