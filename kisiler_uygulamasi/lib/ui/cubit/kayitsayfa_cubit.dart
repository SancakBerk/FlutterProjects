import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/data/repo/kisilerdao_repository.dart';

class kayitsayfaCubit extends Cubit<void>
{
 kayitsayfaCubit():super(0);
 var krepo =kisilerDaoRepository();
 

  Future<void> kaydet (String kisi_ad,String kisi_tel) async
  {
    krepo.kaydet(kisi_ad, kisi_tel);
  }

}