import 'package:ems/core/config/app_config.dart';

class LoginEndpoints {
  Uri get loginNow => Uri.parse("${AppConfig.apiBaseUrl}/login/loginNow");
}
