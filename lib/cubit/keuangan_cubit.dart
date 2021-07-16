import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sp_adm_new/controllers/services.dart';
import 'package:sp_adm_new/models/models.dart';

part 'keuangan_state.dart';

class KeuanganCubit extends Cubit<KeuanganState> {
  KeuanganCubit() : super(KeuanganInitial());
  Future<void> getLaporanKeuangan(String spadmKey) async {
    ApiReturnValue<List<Keuangan>> result = await KeuanganService.getLaporanKeuangan(spadmKey);

    if (result.value != null) {
      emit(KeuanganLoaded(result.value));
    } else {
      emit(KeuanganLoadingFailed(result.message));
    }
  }
}
