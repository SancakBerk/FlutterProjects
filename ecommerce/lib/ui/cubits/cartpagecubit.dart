import 'package:ecommerce/data/models/classes/product.dart';
import 'package:ecommerce/data/models/classes/usercart.dart';
import 'package:ecommerce/data/repos/ecommercerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class cartpageCubit extends Cubit<List<productClass>> {
  cartpageCubit() : super([]);
  var repoObject = eCommerceRepo();

  Future<void> getcartbyUserid(int id) async {
    List<productClass> data = await repoObject.getcartbyUserid(id);
    emit(data);
  }
}
