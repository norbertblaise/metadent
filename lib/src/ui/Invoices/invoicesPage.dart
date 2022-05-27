import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:metadent/src/ui/Invoices/invoiceDetailPage.dart';
import '../../../app.dart';
import '../../../blocs/Invoices/invoices_bloc.dart';
import '../../../models/InvoiceModel/invoiceModel.dart';
import '../../../models/InvoiceModel/invoicesList.dart';
import '../CustomWidgets/InvoiceCard.dart';
import 'package:shimmer/shimmer.dart';
import 'package:metadent/routes.dart' as routes;

import '../CustomWidgets/InvoiceListShimmer.dart';

class InvoicesPage extends StatefulWidget {
  const InvoicesPage({Key? key}) : super(key: key);

  @override
  State<InvoicesPage> createState() => _InvoicesPageState();
}

class _InvoicesPageState extends State<InvoicesPage> {
  FlutterSecureStorage storage = FlutterSecureStorage();
  var invoiceTitle;
  var invoiceStatus;
  var date;
  var amountDue;

  var shortenedTitle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        // flexibleSpace: const GradientAppBar(),
        title: Text(
          localizedString!.invoices,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<InvoicesBloc, InvoicesState>(
        buildWhen: (context, state) {
          return state is InvoicesFetched || state is InvoicesFetchingFailed;
        },
        builder: (context, state) {
          if (state is InvoicesInitial) {
            context.read<InvoicesBloc>().add(FetchInvoices());
          }
          if (kDebugMode) {
            print("State in the beginning is $state");
          }
          if (state is InvoicesFetched) {
            InvoicesList invoicesList = state.invoicesList;
            List<Invoice> invoices = invoicesList.invoices;

            invoiceTitle = invoices[0].services;
            shortenedTitle =
                invoiceTitle.replaceRange(13, invoiceTitle.length, "...");
            invoiceStatus = invoices[0].status;
            date = invoices[0].dueDate;
            amountDue = invoices[0].balanceDue;

            return ListView.builder(
                itemCount: invoices.length,
                itemBuilder: (BuildContext context, int index) {
                  var invoiceTitle = invoices[index].services;
                  String shortenedTitle =
                      invoiceTitle.replaceRange(13, invoiceTitle.length, "...");
                  String shortenedDate = invoices[index].createdAt.toString().substring(0, 10);
                  return Padding(
                    padding: const EdgeInsets.all(8.0).r,
                    child: InvoiceCard(
                      title: shortenedTitle,
                      status: invoices[index].paymentStatus.toString(),
                      date: shortenedDate ?? "2022-04-25",
                      amountDue: invoices[index].balanceDue != null
                          ? invoices[index].balanceDue.toString()
                          : "null",
                      onTap: () {
                        //todo go to details page
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InvoiceDetailPage(
                                      invoice: invoices[index],
                                    )));
                      },
                    ),
                  );
                });
          } else if (state is InvoicesFetching || state is InvoicesInitial || state is InvoicesFetching) {
            return InvoiceListShimmer();
          } else if (state is InvoicesFetchingFailed) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    context.read<InvoicesBloc>().add(FetchInvoices());
                  },
                  child: Text(
                    "RETRY",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8).r)),
                ),
                Text("something went wrong, try again"),
              ],
            ));
          } else {
            return Text("something went wrong, try again Later");
          }
        },
      ),
    );
  }
}
