import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class VeritabaniYardimcisi
{
  static final String veritabanAdi ="rehber.sqlite";
  static Future<Database> veritabaniErisim() async
  {
    String veritabaniyolu = join(await getDatabasesPath(),veritabanAdi);
    if(await databaseExists(veritabaniyolu))
    {
      print("Veri tabanı var kopyalamaya gerek yok");

    }
    else
    {
      ByteData data = await rootBundle.load("veritabani/$veritabanAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniyolu).writeAsBytes(bytes,flush: true);
      print("Veri tabani kopyaladnı");
    }
    return openDatabase(veritabaniyolu);
  }
}