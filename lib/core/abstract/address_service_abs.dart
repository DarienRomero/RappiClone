import '../models/models.dart';

abstract class AddressServiceAbs {
  Future<List<Address>> getPredictions(String text);
  Future<List<Address>> getAddressList();
  Future<bool> saveAddress(Address address);
  Future<bool> deleteAddress(String idAddress);
}
