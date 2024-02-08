import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranbilgisi = MediaQuery.of(context);
    var ekran_yuksekligi = ekranbilgisi.size.height;
    var ekran_genisligi = ekranbilgisi.size.width;
    print("Ekran genisligi$ekran_genisligi");
    print("Ekran yüksekligi $ekran_yuksekligi");


    var d = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("Pizza",style: TextStyle(color:yaziRenk1,fontFamily:"Pacificoo", fontSize: ekran_genisligi/19),),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body:Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(d!.pizzaBaslik,style: TextStyle(fontSize: 36,color: anaRenk,fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Image.asset("resimler/pizza.webp",height: 200,),
          ),
          Padding(padding: EdgeInsets.only(top:16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                chip(metin: d.peynirYazi),
                chip(metin: d.sucukYazi),
                chip(metin: d.zeytinYazi),
                chip(metin: d.biberYazi),
              ],
            ),
          ),
         Padding(padding: EdgeInsets.all(18),
         child:
         Column(
           children: [
             Text(d.teslimatSure,style: TextStyle(color: yaziRenk2,fontSize: 22,fontWeight: FontWeight.bold),),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Text(d.teslimatBaslik,style: TextStyle(color: Colors.red,fontSize: 22,fontWeight: FontWeight.bold),),
             ),
             Text(d.pizzaAciklama,style: TextStyle(color: yaziRenk2,fontSize: 22,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),

           ],
         ),
         ),
          Padding(padding: EdgeInsets.only(left: 10,right: 10,bottom: 2),child:Row(

            children: [
               Text(d.fiyat,style: TextStyle(color: Colors.red,fontSize: 44,fontWeight: FontWeight.bold),),
              const Spacer(),
              SizedBox(
                width: 200,
                height: 60,
                child: TextButton(onPressed: (){},
                  child: Text(d.buttonYazi,style: TextStyle(color: yaziRenk1,fontSize: 18),),
                  style: TextButton.styleFrom(backgroundColor: anaRenk,shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),),),
              )

            ],
          ),)


        ],
      )
    );
  }
}

class chip extends StatelessWidget {
  String metin;

  chip({ required this.metin});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: (){},
      child: Text(metin,style: TextStyle(color: yaziRenk1),),
      style: TextButton.styleFrom(backgroundColor: anaRenk),
    );
  }
}
