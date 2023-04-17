
class Websites {

  final String url;
  final String name;

	Websites.fromJsonMap(Map<String, dynamic> map): 
		url = map["url"],
		name = map["name"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['url'] = url;
		data['name'] = name;
		return data;
	}
}
