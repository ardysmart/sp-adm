import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sp_adm_new/controllers/services.dart';
import 'package:sp_adm_new/models/models.dart';

part 'dansosduk_state.dart';

class DansosdukCubit extends Cubit<DansosdukState> {
  DansosdukCubit() : super(DansosdukInitial());
  Future<void> getDansosduk(String id) async {
    ApiReturnValue<List<Dansosduk>> result =
        await DansosdukServices.getDansosduk(id);

    if (result.value != null) {
      emit(DansosdukLoaded(result.value));
    } else {
      emit(DansosdukLoadingFailed(result.message));
    }
  }
}
