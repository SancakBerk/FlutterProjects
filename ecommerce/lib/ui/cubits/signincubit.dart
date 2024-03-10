import 'package:ecommerce/data/models/classes/user.dart';
import 'package:ecommerce/data/repos/ecommercerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signinCubit extends Cubit<String> {
  signinCubit() : super("");

  var repoObject = eCommerceRepo();
  Future<userClass> userLogin(username, password) async {
    return repoObject.userLogin(username, password);
  }
}
