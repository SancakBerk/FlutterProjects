import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler_cevap.dart';
import 'package:kisiler_uygulamasi/sqlite/veritabani_yardimcisi.dart';
class kisilerDaoRepository
{

  Future<List<Kisiler>> kisiYukle() async {
    var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php";
    var cevap = await Dio().get(url);
    return parseKisiler(cevap.data.toString());
  }




  List<Kisiler> parseKisiler(String cevap)
  {
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }


  Future<void> kaydet (String kisi_ad,String kisi_tel) async
  {
    var url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php";
    var veri = {"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));


  }
  Future<void> guncelle (String kisi_id,String kisi_ad,String kisi_tel) async
  {
    var url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php";
    var veri = {"kisi_id":kisi_id,"kisi_ad":kisi_ad,"kisi_tel":kisi_tel};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));
  }

  Future<List<Kisiler>> ara(String aramakelimesi) async {
   var url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php";
   var veri = {"kisi_ad":aramakelimesi};
   var cevap = await Dio().post(url,data: FormData.fromMap(veri));
   return parseKisiler(cevap.toString());

  }

  Future<void> sil(String kisi_id) async {
    var url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php";
    var veri = {"kisi_id":kisi_id};
    var cevap = await Dio().post(url,data: FormData.fromMap(veri));

  }

}