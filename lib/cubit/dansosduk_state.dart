part of 'dansosduk_cubit.dart';

abstract class DansosdukState extends Equatable {
  const DansosdukState();

  @override
  List<Object> get props => [];
}

class DansosdukInitial extends DansosdukState {}

class DansosdukLoaded extends DansosdukState {
  final List<Dansosduk> dansosduks;
  DansosdukLoaded(this.dansosduks);

  @override
  List<Object> get props => [dansosduks];
}

class DansosdukLoadingFailed extends DansosdukState {
  final String message;

  DansosdukLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
