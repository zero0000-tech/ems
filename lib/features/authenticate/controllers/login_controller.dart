import 'package:get/get.dart';
import 'package:ems/core/utils/email_validator.dart';
import 'package:ems/features/authenticate/services/login_service.dart';

class LoginController extends GetxController {
  // Observable variables for input fields and state
  var email = 'test@gmail.com'.obs;
  var password = '12345'.obs;
  var showPassword = false.obs;

  // Method to toggle password visibility
  void togglePasswordVisibility() {
    showPassword.value = !showPassword.value;
  }

  // Method for login logic
  void login() {
    if (email.isEmpty) {
      // NitroSnackbar.error(title: "Gagal melog masuk", text: "Sila masukkan alamat emel anda");
      return;
    }
    if (password.isEmpty) {
      // NitroSnackbar.error(title: "Gagal melog masuk", text: "Sila masukkan kata laluan anda");
      return;
    }
    if (!EmailValidator.isValidEmail(email.value)) {
      // NitroSnackbar.error(title: "Gagal melog masuk", text: "Alamat emel anda tidak sah");
      return;
    }

    LoginService.loginNow(email.value, password.value).then((value) {
      print(value);
    }).catchError((onError) {
      // NitroSnackbar.error(title: "Gagal melog masuk", text: onError.toString());
    });
  }
}
