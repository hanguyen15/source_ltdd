import 'package:flutter_login/models/profile.dart';
import 'package:flutter_login/services/api_services.dart';

class LoginRepository {
  final ApiService api = ApiService();
  Future<Profile> login(String username, String password) async {
    Profile profile = Profile();
    final response = await api.loginUser(username, password);
    if (response?.statusCode == 200) {
      profile.token = response?.data['token'];
      profile.SetUserPassword(username, password);
    } else {
      profile.token = '';
    }
    return profile;
  }
}
