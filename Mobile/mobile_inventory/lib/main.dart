import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
import 'app/modules/profil/controllers/profil_controller.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: Routes.ONBORDING,
      getPages: AppPages.routes,
      
    ),
  );
}
