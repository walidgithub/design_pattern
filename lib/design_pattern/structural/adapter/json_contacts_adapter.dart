import 'dart:convert';

import 'contact.dart';
import 'i_contacts_adapter.dart';
import 'json_contact_api.dart';

class JsonContactsAdapter implements IContactsAdapter {
  final JsonContactsApi _api = JsonContactsApi();

  @override
  List<Contact> getContacts() {
    var contactsJson = _api.getContactsJson();
    var contactsList = _parseContactsJson(contactsJson);

    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    var contactsMap = json.decode(contactsJson) as Map<String, dynamic>;
    var contactsJsonList = contactsMap['contacts'] as List;
    var contactsList = contactsJsonList
        .map((json) => Contact(
      fullName: json['fullName'],
      email: json['email'],
      favourite: json['favourite'],
    ))
        .toList();

    return contactsList;
  }
}