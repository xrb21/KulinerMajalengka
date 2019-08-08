import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kuliner_majalengka_training/adapters/KategoriAdapter.dart';
import 'package:kuliner_majalengka_training/adapters/RestoranAdapter.dart';
import 'package:kuliner_majalengka_training/models/Kategori.dart';
import 'package:kuliner_majalengka_training/models/Restoran.dart';

import 'DetailRestoran.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Kategori>> _future;

  //variable untuk menyimpan data restoran
  Future<List<Restoran>> _futureRestoran;
  //fungsi untuk ambild ata restoran favorite
  Future<List<Restoran>> getDataRestoran() async {
    List<Restoran> dataResto = [];
    //url api restoran
    final url = "http://training.ercode.id/api/favorit";
    //fetch data keserver
    final respon = await http.get(url);
    //convert ke bentuk json
    final data = json.decode(respon.body);

    print("Respon dari server resto: $data");
    final hasil = data['result'];

    if (hasil){
      dataResto = List<Restoran>.from(data["data"].map((item) =>
        Restoran.fromJson(item)));
    }

    print("jumlah resto : ${dataResto.length}");

    return dataResto;
  }

  //untuk ambil dat akategori
  Future<List<Kategori>> getData() async {
    //siapkan variabel list untuk nampung list kategori
    final List<Kategori> dataKategori = [];

    final url = "http://training.ercode.id/api/kategori";
    //fetch data dari server
    final response = await http.get(url);
    //convert ke bentuk json
    final data = json.decode(response.body);
    //cek hasild atanya
    final hasil = data['result'];
    final msg = data["msg"];

    //jika hasilnya trus maka ambild ata kategori yanga ada di key "data"
    if (hasil) {
      //ambil list katageori yg berupa json
      final List<dynamic> kategories = data["data"];

      //loop data kategori dari serve/json
      for (var i = 0; i < kategories.length; i++) {
        var kat = kategories[i];

        Kategori kategori = Kategori(
            id: kat["id"],
            nama: kat["nama"],
            image: kat["image"],
            jumlah: kat["jumlah"]);

        dataKategori.add(kategori);
      }
    }

    print("data kategori : ${dataKategori.length}");

    return dataKategori;
  }

  @override
  void initState() {
    super.initState();

    //panggil fungsi untuk ambil data dr server
    setState(() {
      _future = getData();

      //panggil method untuk ambil dat arestoran
      _futureRestoran = getDataRestoran();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          //untuk header
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 36, left: 16, right: 16),
                child: Text(
                  "Mau Makan\nApa Sekarang?",
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xff181b20),
                      fontWeight: FontWeight.w700),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 36.0, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.notifications_none),
                      Image.asset(
                        "assets/images/text_majalengkakuliner@2x.png",
                        height: 50,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),

          //untuk kategori kuliner
          Container(
            height: 90,
            child: FutureBuilder(
              future: _future,
              builder: (context, snapshot) {
                //cek apakah masih ambil data atau sudah
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    //wiew untuk nampilin data
                    return showDataKategori(snapshot.data);
                  } else if (snapshot.hasError) {
                    //view untuk informasikan ada error
                    return Text(
                        "error fetch data : ${snapshot.error.toString()}");
                  }
                }
              },
            ),
          ),

          Container(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Restoran Favorite",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.brown[300]),
                  ),

                  Text(
                    "42 Resto",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.brown[200]),
                  ),
                ],
              ),
            ),
          ),

          //untuk list data favorite restoran
          buildFavoriteView(),
        ],
      ),
    );
  }

  Widget showDataKategori(List<Kategori> data) {
    //cek lagi datanya kosng atau ngga
    if (data.isEmpty) {
      return Center(
        child: Text("Data Kategori kosong"),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final kategori = data[index];
              print(
                  "nama kategori ${index} ${kategori.nama} -- ${kategori.jumlah}");
              return KategoriAdapter(kategori);
            }),
      );
    }
  }

  //method untuk view favorite
  Widget buildFavoriteView() {
    return Expanded(
      child: FutureBuilder(
        future: _futureRestoran,
        builder: (context, snapshot) {
          //cek apakah masih ambil data atau sudah
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              //wiew untuk nampilin data
              return showDataRestoran(snapshot.data);
            } else if (snapshot.hasError) {
              //view untuk informasikan ada error
              return Text(
                  "error fetch data : ${snapshot.error.toString()}");
            }
          }
        },
      ),
    );
  }

  Widget showDataRestoran(List<Restoran> data) {
    //cek lagi datanya kosng atau ngga
    if (data.isEmpty) {
      return Center(
        child: Text("Data Restoran kosong"),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              final resto = data[index];
              print(
                  "nama resto ${index} ${resto.nama} -- ${resto.isFavorite}");
              return InkWell(
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(builder: (context) {
                    return DetailRestoran(resto);
                  })
                  );
                },
                  child: RestoranAdapter(resto));
            }),
      );
    }
  }
}
