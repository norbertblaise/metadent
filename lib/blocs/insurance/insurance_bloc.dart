import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'insurance_event.dart';
part 'insurance_state.dart';

class InsuranceBloc extends Bloc<InsuranceEvent, InsuranceState> {
  InsuranceBloc() : super(InsuranceInitial()) {
    on<InsuranceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
