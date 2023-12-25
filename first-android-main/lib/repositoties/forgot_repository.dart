import 'package:flutter_login/services/api_services.dart';

class ForgotRepository {
  final ApiService api = ApiService();
  Future<bool> forgot(String email) async {
    final response = await api.forgotPassword(email);
    if (response != null && response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
