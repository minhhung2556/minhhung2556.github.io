import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class ContactInfo {
  final List<Websites> websites;
  final Timestamp birthdaySinceEpoch;
  final String phoneNumber;
  final String email;
  final String locationUrl;

  ContactInfo.fromJsonMap(Map<String, dynamic> map)
      : websites = List<Websites>.from(map["websites"].map((it) => Websites.fromJsonMap(it))),
        birthdaySinceEpoch = map["birthdaySinceEpoch"],
        phoneNumber = map["phoneNumber"],
        email = map["email"],
        locationUrl = map["locationUrl"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['websites'] = this.websites.map((v) => v.toJson()).toList();
    data['birthdaySinceEpoch'] = birthdaySinceEpoch;
    data['phoneNumber'] = phoneNumber;
    data['email'] = email;
    data['locationUrl'] = locationUrl;
    return data;
  }
}
