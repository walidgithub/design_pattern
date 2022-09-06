import 'package:flutter/material.dart';

import '../contact.dart';
import '../i_contacts_adapter.dart';

class ContactsSection extends StatefulWidget {
  final IContactsAdapter? adapter;
  final String? headerText;

  const ContactsSection({
    this.adapter,
    this.headerText,
  })  : assert(adapter != null),
        assert(headerText != null);

  _ContactsSectionState createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> {
  final List<Contact> contacts = List<Contact>();

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter!.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(

    );
  }
}