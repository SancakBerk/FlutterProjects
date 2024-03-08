import '../../data/models/classes/product.dart';
import '../../data/repos/ecommercerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class mainPageCubit extends Cubit<List<productClass>> {
  mainPageCubit() : super(<productClass>[]);

  var eCommerceRepoooobj = eCommerceRepo();

  Future<void> loadLimitResult() async {
    var list = await eCommerceRepoooobj.loadLimitResultRepo();
    emit(list);
  }
}
