import 'package:ecommerce/data/models/classes/user.dart';
import 'package:ecommerce/data/repos/ecommercerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class signUpCubit extends Cubit<Map<String, dynamic>> {
  signUpCubit() : super({});

  var repoObj = eCommerceRepo();

  int denemefunc() {
    return 1;
  }

  Future<userClass> addUserandreturn(name, surname, username, phone, password,
      mail, latitude, longitude, city, street, postcode, number) async {
    userClass useer = await repoObj.addUserandreturn(
        name,
        surname,
        username,
        phone,
        password,
        mail,
        latitude,
        longitude,
        city,
        street,
        postcode,
        number);

    return useer;
  }
}
