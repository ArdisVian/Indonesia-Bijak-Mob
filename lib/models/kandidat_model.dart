class Kandidat {
  final String noUrut;
  final String nama;
  final String fotoUrl;
  final String visi;
  final String misi;
  String? jumlahVote;

  Kandidat(
      {required this.noUrut,
      required this.nama,
      required this.fotoUrl,
      required this.visi,
      required this.misi,
      this.jumlahVote});
}
