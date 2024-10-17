import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'atm_event.dart';
part 'atm_state.dart';

class AtmBloc extends Bloc<AtmEvent, AtmState> {
  AtmBloc() : super(AtmInitialState());

  @override
  Stream<AtmState> mapEventToState(AtmEvent event) async* {
    if (event is SubmitAmountEvent) {
      if (event.amount % 100 != 0) {
        yield AtmErrorState('Банкомат не может выдать запрашиваемую сумму');
      } else {
        List<String> issuedNotes = [];
        yield AtmSuccessState(issuedNotes);
      }
    }
  }
}
