part of 'invoices_bloc.dart';

@immutable
abstract class InvoicesState {}

class InvoicesInitial extends InvoicesState {}
class InvoicesOutdated extends InvoicesState{}
class InvoicesFetching extends InvoicesState{}
class InvoicesFetched extends InvoicesState{
  InvoicesList invoicesList;
  InvoicesFetched(this.invoicesList);
}
class InvoicesFetchingFailed extends InvoicesState{}