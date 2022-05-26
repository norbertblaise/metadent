import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  InvoicesBloc() : super(InvoicesInitial()) {
    on<InvoicesEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
