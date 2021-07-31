part of 'detailtransaction_cubit.dart';

abstract class DetailtransactionState extends Equatable {
  const DetailtransactionState();

  @override
  List<Object> get props => [];
}

class DetailtransactionInitial extends DetailtransactionState {}

class DetailtransactionLoaded extends DetailtransactionState {
  final List<DetailTransaction> detailtransactions;
  DetailtransactionLoaded(this.detailtransactions);

  @override
  List<Object> get props => [detailtransactions];
}

class DetailtransactionLoadingFailed extends DetailtransactionState {
  final String message;

  DetailtransactionLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
