import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ems/core/config/app_config.dart';
import 'package:ems/features/authenticate/controllers/login_controller.dart';
import 'package:ems/shared/widgets/form_input.dart';
import 'package:ems/shared/widgets/nitro/scaffold_single_page.dart';
import 'package:ems/routes/app_routes.dart';

class ForgetPasswordScreen extends GetView<LoginController> {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return NitroScaffoldSinglePage(
      infotainment: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network("${AppConfig.assetBaseUrl}images/logo-full.png"),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: const Text(
              "Welcome back!",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: 250,
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: const Text(
              "User Experience & Interface Design Strategy SaaS Solutions",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Image.network(
              "${AppConfig.assetBaseUrl}illustrations/pic1.png",
              width: 400,
              height: 400,
            ),
          ),
        ],
      ),
      child: Center(
        child: SizedBox(
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Forgot password",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const FormInput(
                label: "Email",
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  Get.toNamed(AppRouteNames.formComponent);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 116, 255, 1),
                  foregroundColor: Colors.white,
                  fixedSize: const Size(400, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text("SUBMIT"),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Already have an account?",
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRouteNames.login);
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      surfaceTintColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      alignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      splashFactory: NoSplash.splashFactory,
                      overlayColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text("Sign in"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
