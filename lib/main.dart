import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ems/core/config/app_config.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const NitroCatalyst());
}

class NitroCatalyst extends StatelessWidget {
  const NitroCatalyst({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.routes,
    );
  }
}
