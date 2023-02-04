import '../index.dart';

class DataRepository extends IDataApi {
  final FirebaseApi provider = FirebaseApi.instance;

  @override
  Future<Profile?> getLatestProfile() async {
    return provider.getLatestProfile();
  }
}
