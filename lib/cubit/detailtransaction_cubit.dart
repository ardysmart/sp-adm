import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sp_adm_new/controllers/services.dart';
import 'package:sp_adm_new/models/models.dart';

part 'detailtransaction_state.dart';

class DetailtransactionCubit extends Cubit<DetailtransactionState> {
  DetailtransactionCubit() : super(DetailtransactionInitial());
  Future<void> getDetailtransaction(String id) async {
    ApiReturnValue<List<DetailTransaction>> result =
        await TransactionService.getDetailtransaction(id);

    if (result.value != null) {
      emit(DetailtransactionLoaded(result.value));
    } else {
      emit(DetailtransactionLoadingFailed(result.message));
    }
  }
}
