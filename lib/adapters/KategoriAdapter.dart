import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/models/Kategori.dart';

class KategoriAdapter extends StatelessWidget {
  final Kategori kategori;

  KategoriAdapter(this.kategori);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.only(left: 8, top: 8, bottom: 8),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
                backgroundImage : NetworkImage("${kategori.image}", )),

            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(kategori.nama, style: TextStyle(
                    fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black54
                  ),),

                  Text("${kategori.jumlah} Resto",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.blueGrey
                  ),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
