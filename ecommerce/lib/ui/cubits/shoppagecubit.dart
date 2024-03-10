import 'package:dio/dio.dart';
import 'package:ecommerce/data/models/classes/product.dart';
import 'package:ecommerce/data/repos/ecommercerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class shopPageCubit extends Cubit<List<productClass>> {
  shopPageCubit() : super([]);
  var repobject = eCommerceRepo();

  Future<List<dynamic>> getcategories() async {
    var response =
        await Dio().get("https://fakestoreapi.com/products/categories");
    return response.data;
  }

  Future<void> getProducts() async {
    var list = await repobject.getProducts();
    emit(list);
  }

  Future<void> getProductsByCategory(String categorie) async {
    var list = await repobject.getProductsByCategory(categorie);
    emit(list);
  }
}
