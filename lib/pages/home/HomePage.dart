import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/adapters/KategoriAdapter.dart';
import 'package:kuliner_majalengka_training/models/Kategori.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<List<Kategori>> _future;

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
    if (hasil){
      //ambil list katageori yg berupa json
      final List<dynamic>kategories = data["data"];



      //loop data kategori dari serve/json
      for(var i=0; i<kategories.length; i++){
        var kat = kategories[i];

        Kategori kategori = Kategori(
          id: kat["id"],
          nama: kat["nama"],
          image: kat["image"],
          jumlah: kat["jumlah"]
        );

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
                child: Text("Mau Makan\nApa Sekarang?", style: TextStyle(
                  fontSize: 24,
                  color: Color(0xff181b20),
                  fontWeight: FontWeight.w700
                ),),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:36.0, right: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.notifications_none),

                      Image.asset("assets/images/text_majalengkakuliner@2x.png",
                      height: 50,)
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
              builder: (context, snapshot){
                //cek apakah masih ambil data atau sudah
                if (snapshot.connectionState == ConnectionState.waiting){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else if (snapshot.connectionState == ConnectionState.done){
                  if (snapshot.hasData){
                    //wiew untuk nampilin data
                    return showDataKategori(snapshot.data);

                  }else if (snapshot.hasError){
                    //view untuk informasikan ada error
                    return Text("error fetch data : ${snapshot.error.toString()}");
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }

  Widget showDataKategori(List<Kategori> data) {
    //cek lagi datanya kosng atau ngga
    if (data.isEmpty){
      return Center(
        child: Text("Data Kategori kosong"),
      );
    }else{
      return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
            itemBuilder: (BuildContext context, int index){
              final kategori = data[index];
              print("nama kategori ${index} ${kategori.nama} -- ${kategori.jumlah}");
              return KategoriAdapter(kategori);
            }),
      );
    }
  }
}
