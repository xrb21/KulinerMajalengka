import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/pages/register/LoginPage.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //untuk berpindah halaman setelah tampil splash 3detik
    Future.delayed(Duration(seconds: 3), (){
      Navigator.push(context,
          MaterialPageRoute(
              builder: (context) => LoginPage()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Stack(
        children: <Widget>[
          //untuk logo kuliner majalengka yang ditengah
          Center(
            child: Image.asset("assets/images/image_splash.png",
            width: 320),
          ),

          //untuk text ercode posisi dibawah
          Positioned(child: Center(child: Image.asset("assets/images/text_ercode.png", height: 15,)),
            bottom: 50,
            left: 0,
            right: 0,

          )
        ],
      )
    );
  }
}
