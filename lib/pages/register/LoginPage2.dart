import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/pages/register/DaftarPage.dart';
import 'package:kuliner_majalengka_training/pages/register/LupaPasswordPage.dart';

class LoginPage2 extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF231f20),
        centerTitle: true,
        title: Text(
          "Login",
          style: TextStyle(color: Color(0xFF777677)),
        ),
        elevation: 0,
      ),
      backgroundColor: Color(0xFF231f20),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 40,
            right: 40,
            child: Image.asset(
              "assets/images/image_splash_alt.png",
              width: 200,
            ),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Card(
              elevation: 4,
              color: Colors.white,
              borderOnForeground: true,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Silahkan untuk login",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xffffc83c),
                          fontWeight: FontWeight.w300),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextFormField(
                        style:
                        TextStyle(color: Color(0xff696969), fontSize: 14),
                        decoration: InputDecoration(
                            hintText: "Email",
                            filled: true,
                            fillColor: Color(0xfffafafa),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xfff6f6f6), width: 1),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(6))),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: TextFormField(
                        obscureText: true,
                        style:
                        TextStyle(color: Color(0xff696969), fontSize: 14),
                        decoration: InputDecoration(
                            hintText: "Password",
                            filled: true,
                            fillColor: Color(0xfffafafa),
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Color(0xfff6f6f6), width: 1),
                            ),
                            border: const OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(6))),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16)),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      width: double.infinity,
                      height: 54,
                      child: RaisedButton(
                        elevation: 0,
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(6)),
                        onPressed: () {
                          //action saat tombo login diklik
                        },
                        color: Color(0xffffc83c),
                        textColor: Colors.white,
                        child: Text("L O G I N"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "Belum punya akun? DAFTAR",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff606060),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            onTap: () {
                              //action saat klik daftar
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DaftarPage()));
                            },
                          ),
                          InkWell(
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Text(
                                "Lupa Password?",
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Color(0xff606060),
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            onTap: () {
                             //action saat lupa password
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LupaPasswordPage()));
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
