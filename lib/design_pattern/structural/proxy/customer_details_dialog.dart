import 'package:flutter/material.dart';

import 'customer.dart';
import 'customer_details.dart';
import 'i_customer_details_service.dart';

class CustomerDetailsDialog extends StatefulWidget {
  final Customer? customer;
  final ICustomerDetailsService? service;

  const CustomerDetailsDialog({
    this.customer,
    this.service,
  })  : assert(customer != null),
        assert(service != null);

  @override
  _CustomerDetailsDialogState createState() => _CustomerDetailsDialogState();
}

class _CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  @override
  void initState() {
    super.initState();

    widget.service!
        .getCustomerDetails(widget.customer!.id!)
        .then((CustomerDetails customerDetails) => setState(() {
              widget.customer!.details = customerDetails;
            }));
  }

  void _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customer!.name),
      content: Container(
        height: 200.0,
        child: widget.customer!.details == null
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: lightBackgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black.withOpacity(0.65),
                  ),
                ),
              )
            : CustomerDetailsColumn(
                customerDetails: widget.customer!.details,
              ),
      ),
      actions: <Widget>[
        PlatformButton(
          child: Text('Close'),
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: _closeDialog,
        ),
      ],
    );
  }
}
