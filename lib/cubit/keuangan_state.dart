part of 'keuangan_cubit.dart';

abstract class KeuanganState extends Equatable {
  const KeuanganState();

  @override
  List<Object> get props => [];
}

class KeuanganInitial extends KeuanganState {}

class KeuanganLoaded extends KeuanganState {
  final List<Keuangan> keuangans;
  KeuanganLoaded(this.keuangans);

  @override
  List<Object> get props => [keuangans];
}

class KeuanganLoadingFailed extends KeuanganState {
  final String message;

  KeuanganLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}