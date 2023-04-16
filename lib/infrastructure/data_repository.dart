import '../index.dart';

class DataRepository extends IDataApi {
  final FirebaseApi _provider = FirebaseApi.instance;

  @override
  Future<Profile?> getLatestProfile() async {
    var profile = await _provider.getLatestProfile();
    if (profile != null) {
      final sortedWorks = profile.works..sort((a, b) => a.order < b.order ? -1 : 1);
      profile = profile.copyWith(works: sortedWorks);
    }
    return profile;
  }
}
