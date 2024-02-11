import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class Detay_sayfa extends StatefulWidget {

  Kisiler kisi;
  Detay_sayfa({required this.kisi});

  @override
  State<Detay_sayfa> createState() => _Detay_sayfaState();
}

class _Detay_sayfaState extends State<Detay_sayfa> {


  @override
  void initState() {
    super.initState();
    var kisi = widget.kisi;
    tfkisiadi.text = kisi.kisi_ad;
    tftelno.text = kisi.kisi_tel;
  }

  var tfkisiadi = TextEditingController();
  var tftelno = TextEditingController();

  Future<void> guncelle (int kisi_id,String kisi_ad,String kisi_tel) async
  {
    print("Kişi Güncelle kisi id: $kisi_id kişi ad:  $kisi_ad - Kişi tel : $kisi_tel");

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detay sayfa")),
      body: Center(
          child:
          Padding(
            padding: EdgeInsets.only(left: 50,right: 50,),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(controller: tfkisiadi ,decoration: InputDecoration(
                  hintText:"Ad",
                ),),
                TextField( keyboardType: TextInputType.number,controller: tftelno,decoration: InputDecoration(
                  hintText:"Tel",
                ),),
                ElevatedButton(onPressed: (){
                  guncelle( widget.kisi.kisi_id ,tfkisiadi.text, tftelno.text);
                }, child: Text("Kaydet")),
              ],
            ),
          )
      ) ,
    );
  }
}
