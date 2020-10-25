import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:wabi_clone/core/abstract/address_service_abs.dart';
import 'package:wabi_clone/core/models/address.dart';
import 'package:http/http.dart' as http;

class AddressRepository implements AddressServiceAbs {
  AddressRepository({
    @required this.firestore,
    @required this.apikey,
    @required this.auth,
  });

  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final String apikey;

  static String googleMapsUrl =
      "https://maps.googleapis.com/maps/api/place/autocomplete/json";

  @override
  Future<List<Address>> getPredictions(String text) async {
    String url =
        "$googleMapsUrl?input=$text&types=address&language=es&key=$apikey";
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    if (response.statusCode == 200 && data['status'] == 'OK') {
      return (data['predictions'] as List)
          .map((json) => Address.fromJson(json, ''))
          .toList();
    }
    return [];
  }

  @override
  Future<bool> deleteAddress(String idAddress) async {
    final String uid = auth.currentUser.uid;
    try {
      await firestore
          .collection('address')
          .doc('$uid')
          .collection('address')
          .doc(idAddress)
          .delete();
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<bool> saveAddress(Address address) async {
    final String uid = auth.currentUser.uid;
    try {
      await firestore
          .collection('address')
          .doc('$uid')
          .collection('address')
          .add(address.toJson());
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Stream<List<Address>> getAddressList() {
    final String uid = auth.currentUser.uid;

    return firestore
        .collection('address')
        .doc('$uid')
        .collection('address')
        .snapshots()
        .map((QuerySnapshot snapshot) => snapshot.docs
            .map((QueryDocumentSnapshot doc) =>
                Address.fromJson(doc.data(), doc.id))
            .toList());
  }
}
