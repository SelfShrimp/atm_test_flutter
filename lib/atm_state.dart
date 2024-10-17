part of 'atm_bloc.dart';

@immutable
sealed class AtmState {}

final class AtmInitial extends AtmState {}

class AtmInitialState extends AtmState {}

class AtmErrorState extends AtmState {
  final String error;
  AtmErrorState(this.error);
}

class AtmSuccessState extends AtmState {
  final List<String> issuedNotes;
  AtmSuccessState(this.issuedNotes);
}