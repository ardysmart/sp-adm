import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sp_adm_new/controllers/services.dart';
import 'package:sp_adm_new/models/models.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());
  Future<String> createTransaction(
      String userId, String merchandiseId, String qty, String total) async {
    ApiReturnValue result = await TransactionService.createTransaction(
        userId, merchandiseId, qty, total);
    return result.message;
  }

  Future<void> getTransaction(String id) async {
    ApiReturnValue<List<Transaction>> result =
        await TransactionService.getTransaction(id);

    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionLoadingFailed(result.message));
    }
  }

  Future<String> uploadPhotoTransaction(String id, File pictureFile) async {
    ApiReturnValue result =
        await TransactionService.uploadPhotoTransaction(id, pictureFile);
    print(result.message);
    return result.message;
  }
}
