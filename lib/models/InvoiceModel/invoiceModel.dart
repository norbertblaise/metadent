import 'package:flutter/material.dart';

class Invoice {
  var id;
  var patientId;
  var doctorId;
  var paymentId;
  var facilityId;
  var invoiceId;
  var serviceType;
  var services;
  var prices;
  var vat;
  var totalWithVat;
  var status;
  var invoiceType;
  var paymentDate;
  var paymentStatus;
  var paymentMethod;
  var balanceDue;
  var dueDate;
  var paidAmount;
  var createdAt;
  var updatedAt;
  var receiptNumber;

  Invoice(
      {required this.id,
      required this.patientId,
      required this.doctorId,
      required this.paymentId,
      required this.facilityId,
      required this.invoiceId,
      required this.serviceType,
      required this.services,
      required this.prices,
      required this.vat,
      required this.totalWithVat,
      required this.status,
      required this.invoiceType,
      required this.paymentDate,
      required this.paymentStatus,
      required this.paymentMethod,
      required this.balanceDue,
      required this.dueDate,
      required this.paidAmount,
      required this.createdAt,
      required this.updatedAt,
      required this.receiptNumber});

  factory Invoice.fromJson(Map<String, dynamic> parsedJson) {
    return Invoice(
        id: parsedJson['id'],
        patientId: parsedJson['patient_id'],
        doctorId: parsedJson['doctor_id'],
        paymentId: parsedJson['payment_id'],
        facilityId: parsedJson['facility_id'],
        invoiceId: parsedJson['invoice_id'],
        serviceType: parsedJson['service_type'],
        services: parsedJson['services'],
        prices: parsedJson['prices'],
        vat: parsedJson['vat'],
        totalWithVat: parsedJson['total_with_vat'],
        status: parsedJson['status'],
        invoiceType: parsedJson['invoice_type'],
        paymentDate: parsedJson['payment_date'],
        paymentStatus: parsedJson['payment_status'],
        paymentMethod: parsedJson['payment_method'],
        balanceDue: parsedJson['balance_due'],
        dueDate: parsedJson['due_date'],
        paidAmount: parsedJson['paidamount'],
        createdAt: parsedJson['created_at'],
        updatedAt: parsedJson['updated_at'],
        receiptNumber: parsedJson['receipt_number']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['patient_id'] = this.patientId;
    data['doctor_id'] = this.doctorId;
    data['payment_id'] = this.paymentId;
    data['facility_id'] = this.facilityId;
    data['invoice_id'] = this.invoiceId;
    data['service_type'] = this.serviceType;
    data['services'] = this.services;
    data['prices'] = this.prices;
    data['vat'] = this.vat;
    data['total_with_vat'] = this.totalWithVat;
    data['status'] = this.status;
    data['invoice_type'] = this.invoiceType;
    data['payment_date'] = this.paymentDate;
    data['payment_status'] = this.paymentStatus;
    data['payment_method'] = this.paymentMethod;
    data['balance_due'] = this.balanceDue;
    data['due_date'] = this.dueDate;
    data['paidamount'] = this.paidAmount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['receipt_number'] = this.receiptNumber;

    return data;
  }
}
