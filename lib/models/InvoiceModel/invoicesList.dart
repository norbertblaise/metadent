import 'package:metadent/models/InvoiceModel/invoiceModel.dart';

class InvoicesList {
  final List<Invoice> invoices;

  InvoicesList({required this.invoices});

  factory InvoicesList.fromJson(List<dynamic> parsedJson) {
    List<Invoice> invoices = <Invoice>[];

    invoices = parsedJson.map((i) => Invoice.fromJson(i)).toList();

    return InvoicesList(invoices: invoices);
  }
}
