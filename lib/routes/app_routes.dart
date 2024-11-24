import 'package:get/get.dart';
import 'package:ems/features/authenticate/bindings/login_binding.dart';
import 'package:ems/features/authenticate/views/forgot_password.dart';
import 'package:ems/features/authenticate/views/login.dart';
import 'package:ems/features/authenticate/views/sign_up.dart';
import 'package:ems/features/bootstrap/bindings/accordian_binding.dart';
import 'package:ems/features/bootstrap/views/accordian.dart';
import 'package:ems/features/component/bindings/form_element_binding.dart';
import 'package:ems/features/component/views/form_element.dart';

class AppRoutes {
  static AppRouteNames routeNames = AppRouteNames();
  // static String initialRoute = AppRouteNames.login;
  static String initialRoute = AppRouteNames.accordianBootstrap;

  static final routes = [
    GetPage(
      name: AppRouteNames.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouteNames.forgetPassword,
      page: () => const ForgetPasswordScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouteNames.signUp,
      page: () => const SignUpScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRouteNames.formComponent,
      page: () => const FormComponent(),
      binding: FormElementBinding(),
    ),
    GetPage(
      name: AppRouteNames.accordianBootstrap,
      page: () => const Accordian(),
      binding: AccordianBinding(),
    ),
  ];
}

class AppRouteNames {
  static const String login = '/login';
  static const String forgetPassword = '/forgetPassword';
  static const String signUp = '/signupNow';
  static const String formComponent = '/xhtml/formComponent';
  static const String accordianBootstrap = '/bootstrap/accordian';
}
