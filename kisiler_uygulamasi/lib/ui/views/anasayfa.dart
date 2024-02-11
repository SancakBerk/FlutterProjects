import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyormu = false;
  var searchController = TextEditingController();

  Future<void> ara(String aramakelimesi) async {
    print("$aramakelimesi");
  }


  Future<List<Kisiler>> kisiYukle() async {
    var kisilerlistesi =<Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Berk", kisi_tel: "222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Aslı", kisi_tel: "333");
    var k4 = Kisiler(kisi_id: 4, kisi_ad: "Umut", kisi_tel: "444");
    kisilerlistesi.add(k1);
    kisilerlistesi.add(k2);
    kisilerlistesi.add(k3);
    kisilerlistesi.add(k4);
    return(kisilerlistesi);
  }

  Future<void> sil(int kisiid) async {
    print("$kisiid");
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu
            ? TextField(
                onChanged: (aramaSonucu) {
                  ara(aramaSonucu);
                },
                decoration: InputDecoration(hintText: "Ara"),
              )
            : Text("Kişiler"),
        actions: [
          aramaYapiliyormu
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyormu = false;
                    });
                  },
                  icon: Icon(Icons.clear),
                )
              : IconButton(
                  onPressed: () {
                    setState(() {
                      aramaYapiliyormu = true;
                    });
                  },
                  icon: Icon(Icons.search),
                )
        ],
      ),
      body: Center(
        child: FutureBuilder<List<Kisiler>>(
          future: kisiYukle(),
          builder: (context, snapshot) {
            if( snapshot.hasData)
            {
              var kisilerListesi = snapshot.data;
              return ListView.builder(itemBuilder: (context,index) {
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detay_sayfa(kisi: kisi),)).then((value) {
                      print("Anasayfaya dönüldü");
                    });
                  } ,
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(kisi.kisi_ad,style: TextStyle(fontSize: 20),),
                                Text(kisi.kisi_tel,style: TextStyle(fontSize: 20),),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(" ${kisi.kisi_ad } silinsin mi?"),action: SnackBarAction(
                                label: "Evet",
                                onPressed: () {
                                  sil(kisi.kisi_id);
                                },
                              ),));
                            },
                            icon: Icon(Icons.clear,color: Colors.black54,),
                          )
                        ],

                      ),
                    ),
                  ),
                );
              } , itemCount: kisilerListesi!.length,);
            }
            else
            {
              return Center();
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Kayit_sayfa()))
              .then((value) {
            print("Ana sayfaya dönüldü");
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
