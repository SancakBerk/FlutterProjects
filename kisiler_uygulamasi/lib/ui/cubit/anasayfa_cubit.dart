import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class anasayfaCubit extends Cubit<List<Kisiler>> {
  anasayfaCubit() : super([]);
  var kisilerDaorep = kisilerDaoRepository();

  Future<void> kisiYukle() async {
    var list = await kisilerDaorep.kisiYukle();
    emit(list);
  }

  Future<void> ara(String aramakelimesi) async {
    var list = await kisilerDaorep.ara(aramakelimesi);
    emit(list);
  }
  Future<void> sil(String kisiid) async {
    await kisilerDaorep.sil(kisiid);
    await kisilerDaorep.kisiYukle();
  }


}

