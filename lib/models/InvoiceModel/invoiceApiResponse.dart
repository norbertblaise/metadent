import 'package:metadent/models/InvoiceModel/invoicesList.dart';

class InvoiceApiResponse {
  String status;
  InvoicesList payload;
  
  InvoiceApiResponse({required this.status, required this.payload});
  
  factory InvoiceApiResponse.fromJson(Map<String, dynamic> parsedJson){
    return InvoiceApiResponse(
      status: parsedJson['status'], payload: InvoicesList.fromJson(parsedJson['payload']));

  }
}