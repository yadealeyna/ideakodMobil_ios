import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

import '../models/data.dart';
import '../modules/mainPage.dart';

TextEditingController tel = TextEditingController();
TextEditingController tel2 = TextEditingController();
TextEditingController kan = TextEditingController();
TextEditingController sosyal = TextEditingController();
TextEditingController knot = TextEditingController();

class KullaniciBilgileri extends StatefulWidget {
  const KullaniciBilgileri({Key? key, required this.name, required this.plaka}) : super(key: key);
  final String name;
  final String plaka;

  @override
  State<KullaniciBilgileri> createState() => _KullaniciBilgileriState();
}

class _KullaniciBilgileriState extends State<KullaniciBilgileri> {
  bool? checkedValue = false;
  bool? checkedValue2 = false;
  bool? checkedTel = false;

  var db = Mysql();

  void kayit() async{
    MySqlConnection conn = await db.getConnection();
    Results gb = await conn.query("SELECT * FROM girisbilgisi WHERE USERN = ?", [widget.name]);
    for (var row in gb) {
      Results kb = await conn.query("UPDATE kullanicibilgi SET TELD = ? , TELNO = ? , TELD2 = ?, TELNO2 = ?, KAN = ?, SOSYALD = ?, SOSYALM = ?, KNOT = ? WHERE KULID = ?",
       [checkedValue, tel.text, checkedTel, tel2.text, kan.text, checkedValue2, sosyal.text, knot.text, row['KULID']]);
      
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        const SnackBar(
          content: Text('Bilgileriniz Başarıyla Güncellendi'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 7, 22, 27),
      body: SafeArea(
        child: SingleChildScrollView(
        child: Theme(
          data: ThemeData(
            inputDecorationTheme: const InputDecorationTheme(
              hintStyle: TextStyle(
                color: Color.fromARGB(255, 206, 199, 191),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromARGB(255, 61, 115, 127))
              ),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text("Kişisel Bilgiler", style: TextStyle(color: Color.fromARGB(255, 206, 199, 191), fontSize: 22),),
                TextField(
                  controller: tel,
                  decoration: const InputDecoration(
                    hintText: "Telefon Numaranız"
                  ),
                  cursorColor: Color.fromARGB(255, 61, 115, 127),
                  style: const TextStyle(color: Color.fromARGB(255, 206, 199, 191)),
                ),
                CheckboxListTile(
                  checkColor: const Color.fromARGB(255, 7, 22, 27),
                  activeColor: const Color.fromARGB(255, 61, 115, 127),
                  title: const Text("Telefon numaram görünsün", style: TextStyle(
                      color:  Color.fromARGB(255, 206, 199, 191),
                    ),),
                  value: checkedValue,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),

                TextField(
                  controller: tel2,
                  decoration: const InputDecoration(
                    hintText: "2.Telefon"
                  ),
                  cursorColor: Color.fromARGB(255, 61, 115, 127),
                  style: const TextStyle(color: Color.fromARGB(255, 206, 199, 191)),
                ),
                CheckboxListTile(
                  checkColor: const Color.fromARGB(255, 7, 22, 27),
                  activeColor: Color.fromARGB(255, 61, 115, 127),
                  title: const Text("2. Telefon Gözüksün", style:  TextStyle(
                      color:  Color.fromARGB(255, 206, 199, 191),
                    ),),
                  value: checkedTel,
                  onChanged: (newValue2) {
                    setState(() {
                      checkedTel = newValue2;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                ),

                TextField(
                  controller: kan,
                  decoration: const InputDecoration(
                    hintText: "Kan Grubunuz"
                  ),
                  cursorColor: Color.fromARGB(255, 61, 115, 127),
                  style: const TextStyle(color: Color.fromARGB(255, 206, 199, 191)),
                ),
                
                TextField(
                  controller: sosyal,
                  decoration: const InputDecoration(
                    hintText: "Sosyal Medya Adresiniz"
                  ),
                  cursorColor: Color.fromARGB(255, 61, 115, 127),
                  style: const TextStyle(color: Color.fromARGB(255, 206, 199, 191)),
                ),
                CheckboxListTile(
                  checkColor: const Color.fromARGB(255, 7, 22, 27),
                  activeColor: Color.fromARGB(255, 61, 115, 127),
                  title: const Text("Sosyal medya adresim görünsün", style:  TextStyle(
                      color:  Color.fromARGB(255, 206, 199, 191),
                    ),),
                  value: checkedValue2,
                  onChanged: (newValue2) {
                    setState(() {
                      checkedValue2 = newValue2;
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
                ),

                TextField(
                  controller: knot,
                  decoration: const InputDecoration(
                    hintText: "Not"
                  ),
                  cursorColor: Color.fromARGB(255, 61, 115, 127),
                  style: const TextStyle(color: Color.fromARGB(255, 206, 199, 191)),
                ),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: ElevatedButton(
                    onPressed: (){
                      kayit();
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: const Color.fromARGB(255, 206, 199, 191),
                      foregroundColor: const Color.fromARGB(255, 7, 22, 27),
                      textStyle: const TextStyle(fontSize: 17),
                    ),
                    child: const Text("Kaydet"),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextButton(
                    onPressed: (){
                      Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => MainPage(name: widget.name))
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: const Color.fromARGB(255, 206, 199, 191),
                      textStyle: const TextStyle(fontSize: 17),
                    ),
                    child: const Text("Çıkış"),
                  ),
                ),
              ],
            )
          ),
        ),
      ),
      )
    );
  }
}