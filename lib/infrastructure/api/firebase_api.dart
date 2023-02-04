import 'package:cloud_firestore/cloud_firestore.dart';

import '../../index.dart';

class FirebaseApi extends IDataApi {
  FirebaseApi._();

  static final FirebaseApi _cachedInstance = FirebaseApi._();

  static FirebaseApi get instance => _cachedInstance;

  FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  var latestProfileId = 'gJCfZyGmOM3fbh6aoi25';

  @override
  Future<Profile?> getLatestProfile() async {
    try {
      final ref = await _fireStore.collection('profiles').doc(latestProfileId).get();
      var data = ref.data() as Map<String, dynamic>;
      return Profile.fromJsonMap(data);
    } catch (e) {
      print('FirebaseApi.getLatestProfile.error: $e');
      return null;
    }
  }
}
