import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trendify2/apps/bindings/initial_binding.dart';
import 'package:trendify2/apps/routes/app_pages.dart';
import 'package:trendify2/apps/routes/app_routes.dart';
import 'package:trendify2/apps/utils/constants.dart';
import 'package:trendify2/apps/utils/theme.dart';
import 'package:trendify2/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(ResponsiveUtils());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      getPages: AppPages.pages,
      initialRoute: AppRoutes.SPLASH,
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
