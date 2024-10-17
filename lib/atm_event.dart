part of 'atm_bloc.dart';

@immutable
sealed class AtmEvent {}

class SubmitAmountEvent extends AtmEvent {
  final double amount;
  SubmitAmountEvent(this.amount);
}