import '../../index.dart';

abstract class IDataApi {
  Future<Profile?> getLatestProfile();
}
