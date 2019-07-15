import 'package:flutter/material.dart';
import 'package:kuliner_majalengka_training/pages/register/DaftarPage.dart';
import 'package:kuliner_majalengka_training/pages/register/LupaPasswordPage.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController cEmail  = TextEditingController();
  var cPassword = TextEditingController();

  //key untuk scaffold / page
  final _keyScaffold = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      backgroundColor: Color(0xff201b1f),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),

      body: Stack(
        children: <Widget>[
          Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Image.asset("assets/images/image_splash_alt.png"),
            ),
          ),

          //cardview untuk form login
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Card(

              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    //judul di pas login form
                    Text("Silahkan untuk Login",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.deepOrangeAccent,
                        fontWeight: FontWeight.w300
                    ),),

                    //untuk field email
                    //gunakan kelasnya TextField atau TextFormField
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: cEmail,
                        //decorasi / style pada textinput
                        decoration: InputDecoration(
                            //icon sebelah kiri
                            prefixIcon: Icon(Icons.email),
                          hintText: "Email",
                            //untuk merubah warna textfield
                          filled: true,
                          fillColor: Color(0xfff6f6f6f6),
                          enabledBorder: OutlineInputBorder(
                            borderSide:  BorderSide(
                              color: Colors.blueGrey,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          )
                        ),
                      ),
                    ),

                    //input untuk password
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TextFormField(
                        controller: cPassword,
                        obscureText: true,
                        //decorasi / style pada textinput
                        decoration: InputDecoration(
                          //icon sebelah kiri
                            prefixIcon: Icon(Icons.lock),
                            hintText: "Password",
                            //untuk merubah warna textfield
                            filled: true,
                            fillColor: Color(0xfff6f6f6f6),
                            enabledBorder: OutlineInputBorder(
                                borderSide:  BorderSide(
                                  color: Colors.blueGrey,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(8))
                            )
                        ),
                      ),
                    ),

                    //menambhakan tombol submit untuk login
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Container(
                        width: double.infinity,
                        child: RaisedButton(
                          elevation: 0,
                          child: Text("L O G I N"),
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: (){
                            //action ketika diklik tombolnya
                            print("input masuk email : ${cEmail.text} dan password: ${cPassword.text} ");
                            //method untuk handle saat tombol diklik
                            actionLogin();

                          },
                        ),
                      ),

                    ),

                    //untuk link daftar dan lupa password
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        //kelas handle klik efect material design
                        InkWell(
                          onTap: (){
                            //pindahakan ke halaman pendaftaran
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => DaftarPage()
                              ));
                          },
                            child: Text("Belum punya akun? DAFTAR")),
                        GestureDetector(
                          onTap: (){
                            //pindahakan ke halaman pendaftaran
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => LupaPasswordPage()
                            ));
                          },
                            child: Text("Lupa Password?"))
                      ],
                    )


                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void actionLogin() {
    //kita cek isi dari email dan password
    if (cEmail.text == ""){
      print("debug lewat sini");
      _keyScaffold.currentState.showSnackBar(SnackBar(content: Text("Email harus diiisi")));
    }else if (cPassword.text == ""){
      _keyScaffold.currentState.showSnackBar(SnackBar(content: Text("Password harus diiisi")));
    }else if (cPassword.text.length < 6 ){
      _keyScaffold.currentState.showSnackBar(SnackBar(content: Text("Minimal Password 6 digit")));
    }else{
      //proses kirim ke api
    }
  }
}
