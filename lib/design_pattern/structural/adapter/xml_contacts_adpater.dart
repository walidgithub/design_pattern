import 'package:design_pattern/design_pattern/structural/adapter/xml_contact_api.dart';

import 'contact.dart';
import 'i_contacts_adapter.dart';

class XmlContactsAdapter implements IContactsAdapter {
  final XmlContactsApi _api = XmlContactsApi();

  @override
  List<Contact> getContacts() {
    var contactsXml = _api.getContactsXml();
    var contactsList = _parseContactsXml(contactsXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactsXml) {
    var xmlDocument = xml.parse(contactsXml);
    var contactsList = List<Contact>();

    for (var xmlElement in xmlDocument.findAllElements('contact')) {
      var fullName = xmlElement.findElements('fullname').single.text;
      var email = xmlElement.findElements('email').single.text;
      var favouriteString = xmlElement.findElements('favourite').single.text;
      var favourite = favouriteString.toLowerCase() == 'true';

      contactsList.add(Contact(
        fullName: fullName,
        email: email,
        favourite: favourite,
      ));
    }

    return contactsList;
  }
}