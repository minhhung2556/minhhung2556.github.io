import '../index.dart';

class DataRepository extends IDataApi {
  final FirebaseApi _provider = FirebaseApi.instance;

  @override
  Future<Profile?> getLatestProfile() async {
    return _provider.getLatestProfile();
  }
}
