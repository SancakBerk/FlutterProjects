import 'package:dio/dio.dart';

import 'package:ecommerceproject/data/models/classes/product.dart';

class eCommerceRepo
{
  Future<List<productClass>> loadLimitResultRepo() async {
    try{
      var result = await Dio().get('https://fakestoreapi.com/products?limit=5');
      List<Map<String,dynamic>> list = List<Map<String,dynamic>>.from(result.data);
      return (decodeJson(list));
    }
    catch(err)
    {
      print("HATAAA $err");
      return([]);
    }
  }
  List<productClass> decodeJson(List<Map<String,dynamic>> jsonVeri) {

    List<productClass> products = jsonVeri.map((e) => productClass.fromJson(e)).toList();
    return products;
  }
}