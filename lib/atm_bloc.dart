import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'atm_event.dart';
part 'atm_state.dart';

class AtmBloc extends Bloc<AtmEvent, AtmState> {
  AtmBloc() : super(AtmInitial()) {
    on<AtmEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
