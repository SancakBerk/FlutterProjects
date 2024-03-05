import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/ui/cubit/anasayfa_cubit.dart';
import 'package:kisiler_uygulamasi/ui/views/detay_sayfa.dart';
import 'package:kisiler_uygulamasi/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {

    super.initState();
    context.read<anasayfaCubit>().kisiYukle();

  }

@override

  bool aramaYapiliyormu = false;
  var searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyormu
            ? TextField(
                onChanged: (aramaSonucu) {
                  context.read<anasayfaCubit>().ara(aramaSonucu);
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
                    context.read<anasayfaCubit>().kisiYukle();
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
        child: BlocBuilder<anasayfaCubit,List<Kisiler>>(
          builder: (context, kisilerListesi) {
            if( kisilerListesi.isNotEmpty)
            {

              return ListView.builder(itemBuilder: (context,index) {
                var kisi = kisilerListesi[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Detay_sayfa(kisi: kisi),)).then((value) {
                      context.read<anasayfaCubit>().kisiYukle();
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
                                  context.read<anasayfaCubit>().sil(kisi.kisi_id.toString());
                                  context.read<anasayfaCubit>().kisiYukle();
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
            context.read<anasayfaCubit>().kisiYukle();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
