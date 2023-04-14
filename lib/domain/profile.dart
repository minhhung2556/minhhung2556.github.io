import 'package:cloud_firestore/cloud_firestore.dart';

import 'index.dart';

class Profile {
  final String surName;
  final String headline;
  final ContactInfo contactInfo;
  final String coverUrl;
  final String lastName;
  final String about;
  final String firstName;
  final Timestamp createdDate;
  final List<Works> works;
  final String nickName;
  final String avatarUrl;
  final String overlayAvatar;
  final String skillSummary;
  final String jobTitle;

  Profile.fromJsonMap(Map<String, dynamic> map)
      : surName = map["surName"],
        headline = map["headline"],
        contactInfo = ContactInfo.fromJsonMap(map["contactInfo"]),
        coverUrl = map["coverUrl"],
        overlayAvatar = map["overlayAvatar"],
        lastName = map["lastName"],
        about = map["about"],
        firstName = map["firstName"],
        createdDate = map["createdDate"],
        works = List<Works>.from(map["works"].map((it) => Works.fromJsonMap(it))),
        nickName = map["nickName"],
        skillSummary = map["skillSummary"],
        jobTitle = map["jobTitle"],
        avatarUrl = map["avatarUrl"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['surName'] = surName;
    data['headline'] = headline;
    data['contactInfo'] = contactInfo.toJson();
    data['coverUrl'] = coverUrl;
    data['lastName'] = lastName;
    data['about'] = about;
    data['firstName'] = firstName;
    data['createdDate'] = createdDate;
    data['works'] = this.works.map((v) => v.toJson()).toList();
    data['nickName'] = nickName;
    data['avatarUrl'] = avatarUrl;
    data['skillSummary'] = skillSummary;
    data['jobTitle'] = jobTitle;
    data['overlayAvatar'] = overlayAvatar;
    return data;
  }
}
