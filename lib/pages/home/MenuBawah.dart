import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/pages/cari/CariPage.dart';
import 'package:kuliner_majalengka_training/pages/favorite/FavoritePage.dart';
import 'package:kuliner_majalengka_training/pages/home/HomePage.dart';
import 'package:kuliner_majalengka_training/pages/map/MapPage.dart';

class MenuBawah extends StatefulWidget {
  @override
  _MenuBawahState createState() => _MenuBawahState();
}

class _MenuBawahState extends State<MenuBawah> {
  //buat index untuk posisi menu yg aktif
  int indexPage = 0;
  //data halaman yang akan masuk ke bottomnavigationbar
  List<Widget> pages = [];

  //variable untuk cotroller saat pageview berubah
  PageController controllerPage;

  @override
  void initState() {
    super.initState();

    //inisiasi data halaman
    setState(() {
      pages = [
        HomePage(),
        MapPage(),
        FavoritePage(),
        CariPage(),
      ];

      //inisiasi variable pageController
      controllerPage = PageController(
        initialPage: indexPage,
        keepPage: true
      );

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: pages[indexPage], //jika hanya pakai bottomnaviagionbar saja
      body: buildPageView(),
      bottomNavigationBar: menuBawah(),
    );
  }

  Widget menuBawah(){
    final menu = BottomNavigationBar(
      currentIndex: indexPage,
      type: BottomNavigationBarType.fixed,
      onTap: (index){
        setState(() {
          indexPage = index;

          //untuk pageview agar berpindahsesuia posisi navigationbottomnya
          controllerPage.animateToPage(indexPage,
              duration: Duration(microseconds: 500),
              curve: Curves.ease);

        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          title: Text("Home")
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.map),
            title: Text("Map")
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            title: Text("Favorite")
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Cari")
        )
      ],
    );

    return menu;
  }

  //untuk handle pageview
  Widget buildPageView(){
    return PageView(
      controller: controllerPage,
      children: pages,
      onPageChanged: (index){
        setState(() {
          indexPage = index;
        });
      },
    );
  }
}
