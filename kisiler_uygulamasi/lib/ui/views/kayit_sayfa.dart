import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';

class Kayit_sayfa extends StatefulWidget {
  const Kayit_sayfa({super.key});

  @override
  State<Kayit_sayfa> createState() => _Kayit_sayfaState();
}









class _Kayit_sayfaState extends State<Kayit_sayfa> {

  var tfkisiadi = TextEditingController();
  var tftelno = TextEditingController();



  Future<void> kaydet (String kisi_ad,String kisi_tel) async
  {
    print("Kişi kaydet kişi ad:  $kisi_ad - Kişi tel : $kisi_tel");

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kayıt Sayfa")),
      body:  Center(
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
                kaydet(tfkisiadi.text, tftelno.text);
              }, child: Text("Kaydet")),
            ],
          ),
        )
      ) ,
    );
  }
}
