import 'package:flutter/material.dart';
import '../Drawer/aracEkle.dart';
import '/pdf/qr.dart';

import '../modules/loginPage.dart';
import '../modules/signupPage.dart';
import 'kullaniciBilgileri.dart';
import 'ios.dart';

class drawerMenu extends StatefulWidget {
  const drawerMenu({Key? key, required this.name, required this.plaka}) : super(key: key);
  final String name;
  final String plaka;

  @override
  State<drawerMenu> createState() => _drawerMenuState();
}

class _drawerMenuState extends State<drawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 206, 199, 191),
      child: SafeArea(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Container(
                decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Color.fromARGB(255, 61, 115, 127)))),
                padding: EdgeInsets.only(left: 15, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name, style: TextStyle(fontSize: 24),),
                    Text(widget.plaka)
                  ]
                ),
              ),
              ListTile(
                title: const Text('QR PDF'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QrImage(plaka: widget.plaka,)),
                  );
                }
              ),
              ListTile(
                title: const Text('Ios'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => IosApp()),
                  );
                }
              ),
              ListTile(
                title: const Text('Hesap Bilgileri'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KullaniciBilgileri(name: widget.name, plaka: widget.plaka,))
                  );
                }
              ),
              ListTile(
                title: const Text('Yeni Araba Ekle'),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AracEkle(kAdi: widget.name,))
                  );
                },
              ),
              ListTile(
                title: const Text('Çıkış'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginForm())
                  );
                  usern.clear();
                  pass.clear();

                  ePostaAdresi.clear();
                  adSoyad.clear();
                  password.clear();
                  passwordControl.clear();
                },
              ),
            ],
          ),
        )
    );
  }
}