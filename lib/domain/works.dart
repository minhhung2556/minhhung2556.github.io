import 'package:cloud_firestore/cloud_firestore.dart';

class Works {
  final String companyWebsite;
  final String companyName;
  final Timestamp? startDate;
  final Timestamp? endDate;
  final String jobTitle;
  final String description;
  final List<String> images;
  final num order;

  Works.fromJsonMap(Map<String, dynamic> map)
      : companyWebsite = map["companyWebsite"],
        companyName = map["companyName"],
        startDate = map["startDate"],
        endDate = map["endDate"],
        order = map["order"] ?? 0,
        description = map["description"],
        images = map["images"] == null ? [] : List<String>.from(map["images"]),
        jobTitle = map["jobTitle"];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['companyWebsite'] = companyWebsite;
    data['companyName'] = companyName;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['jobTitle'] = jobTitle;
    data['order'] = order;
    data['description'] = description;
    data['images'] = images;
    return data;
  }
}
