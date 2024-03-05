import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class detaySayfaCubit extends Cubit<void>
{
  detaySayfaCubit():super(0);
  var kisidao = kisilerDaoRepository();

  Future<void> guncelle (String kisi_id,String kisi_ad,String kisi_tel) async
  {
    kisidao.guncelle(kisi_id, kisi_ad, kisi_tel);
  }
}