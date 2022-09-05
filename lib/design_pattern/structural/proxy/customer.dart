import 'package:faker/faker.dart';

import 'customer_details.dart';

class Customer {
  String? id;
  String? name;
  CustomerDetails? details;

  Customer() {
    //faker to get fake data
    id = faker.guid.guid();
    name = faker.person.name();
  }
}