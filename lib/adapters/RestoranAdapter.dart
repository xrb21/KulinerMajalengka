import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/models/Restoran.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class RestoranAdapter extends StatelessWidget {
  final Restoran restoran;

  RestoranAdapter(this.restoran);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Card(
        color: Colors.white,
        //merubah derajat sudut
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
                child: Hero(
                  tag: "hero${restoran.id}",
                    child: Image.network(restoran.image, width: double.infinity, height: 180, fit: BoxFit.cover,))),

            //untuk judul resto dah rating
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: <Widget>[
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(backgroundImage: NetworkImage(restoran.kategori[0].image)),
                    ),
                  ),

                  //untuk yg judul dan ratting resto
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(restoran.nama, style:
                            TextStyle(fontSize: 17, color: Colors.black54, fontWeight: FontWeight.bold),),

                          //untuk ratting dan review
                          Row(
                            children: <Widget>[
                              SmoothStarRating(
                                  allowHalfRating: false,
                                  starCount: 5,
                                  rating: double.parse(restoran.rating),
                                  size: 20.0,
                                  color: Colors.blue,
                                  borderColor: Colors.blue,
                                  spacing:0.0
                              ),
                              SizedBox(width: 4,),
                              Text("${restoran.review} Review")

                            ],
                          ),



                        ],
                      ),
                    ),
                  ),

                  //untuk icon favorite
                  Icon(
                    restoran.isFavorite == 1 ? Icons.bookmark : Icons.bookmark_border,
                    size: 32,
                    color: Colors.blueGrey,
                  )

                ],
              ),
            ),

            //untuk tag kategori
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 16, top: 8),
              child: Container(
                height: 24,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: createTagKategori(),
                ),
              ),
            )


          ],
        ),
      ),
    );
  }

  List<Widget> createTagKategori(){
    List<Widget> data = [];
    for(var kat in restoran.kategori){
      var tag = Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.grey[300]
          )
        ),
        child: Text(kat.nama, style: TextStyle(
          fontSize: 12, color: Colors.black38
        ),),
      );

      //masukkan kedalam array
      data.add(tag);
    }

    return data;
  }
}
