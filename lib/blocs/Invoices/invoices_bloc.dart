import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';
import 'package:metadent/models/InvoiceModel/invoicesList.dart';
import 'package:metadent/providers/resources/authRepository.dart';

import '../../models/InvoiceModel/invoiceApiResponse.dart';

part 'invoices_event.dart';
part 'invoices_state.dart';

class InvoicesBloc extends Bloc<InvoicesEvent, InvoicesState> {
  final AuthRepository authRepository;
  FlutterSecureStorage storage = FlutterSecureStorage();

  InvoicesBloc({required this.authRepository}) : super(InvoicesInitial()) {
    on<FetchInvoices>(_fetchInvoices);
    on<InvoicesEvent>((event, emit) {
      // TODO: implement event handler

    });
  }

  FutureOr<void> _fetchInvoices(FetchInvoices event, Emitter<InvoicesState> emit) async{
    emit(InvoicesFetching());
    try {
      var token = await storage.read(key: 'token');
      InvoiceApiResponse apiResponse = await authRepository.getUserInvoices(token: token!);
      if( apiResponse.status == "SUCCESS"){
        InvoicesList invoices = apiResponse.payload;

        var  invoicesJson = invoices.toJson();
        await storage.write(key: 'invoices', value: invoicesJson);
        if(kDebugMode){
          print(invoices.invoices[0].services);
        }
        emit(InvoicesFetched(invoices));
      }
    }catch(e){
      if(kDebugMode){
        print("error is $e");
        emit(InvoicesFetchingFailed());
      }
    }
  }
}
