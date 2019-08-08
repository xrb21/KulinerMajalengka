import 'Kategori.dart';

class Restoran {
  final int id;
  final String nama;
  final String image;
  final String rating;
  final int review;
  final int isFavorite;
  final List<Kategori> kategori;
  final String deskripsi;

  Restoran({this.id, this.nama, this.image, this.rating, this.review,
      this.isFavorite, this.kategori, this.deskripsi});

  factory Restoran.fromJson(Map<String, dynamic> map){
    //untuk list kategorinya
    List<Kategori> kategories = [];
    //ambil data kategori dari jsonya
    final kategoriJArray = map['kategori'];
    for(var i = 0; i < kategoriJArray.length; i++){
      final kat = kategoriJArray[i];

      Kategori k = Kategori(
        id: kat["id"],
        nama: kat["nama"],
        image: kat["image"]
      );

      kategories.add(k);
    }

    return Restoran(
      id: map["id"],
      nama: map["nama"],
      image: map["image"],
      rating: map["rating"],
      review: map["review"],
      isFavorite: map["isfavorit"],
      kategori: kategories,
      deskripsi: map['deskripsi']
    );
  }
}