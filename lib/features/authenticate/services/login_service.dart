import 'package:http/http.dart' as http;
import 'package:ems/core/constant/api_endpoints.dart';
import 'package:ems/features/authenticate/models/user_model.dart';

class LoginService {
  static Future<UserModel> loginNow(String identifier, String password) async {
    final response = await http.post(
      ApiEndpoints.login.loginNow,
      body: {
        'identification': identifier,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return UserModel.fromJson(response.body as Map<String, dynamic>);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
