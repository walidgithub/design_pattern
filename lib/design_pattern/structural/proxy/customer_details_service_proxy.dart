import 'customer_details.dart';
import 'customer_details_service.dart';

class CustomerDetailsServiceProxy implements ICustomerDetailsService {
  final ICustomerDetailsService service;
  final Map<String, CustomerDetails> customerDetailsCache =
  Map<String, CustomerDetails>();

  CustomerDetailsServiceProxy(this.service);

  @override
  Future<CustomerDetails> getCustomerDetails(String id) async {
    if (customerDetailsCache.containsKey(id)) {
      return customerDetailsCache[id];
    }

    var customerDetails = await service.getCustomerDetails(id);
    customerDetailsCache[id] = customerDetails;

    return customerDetails;
  }
}