import '../models/models.dart';

abstract class AddressServiceAbs {
  Future<List<Address>> getPredictions(String text);
  Stream<List<Address>> getAddressList();
  Future<bool> saveAddress(Address address);
  Future<bool> deleteAddress(String idAddress);
}
