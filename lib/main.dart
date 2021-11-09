import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'core/constants/app_theme.dart';
import 'core/constants/strings.dart';
import 'core/utils/translation/messages.dart';
import 'data/storage/hive_service.dart';
import 'data/storage/hive_service_impl.dart';
import 'routing/routes.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await HiveService.init();
  Get.put(HiveServiceImpl());
  runApp(const MyApp());
  configureLoading();
}

void configureLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..progressColor = Colors.black
    ..indicatorColor = Colors.black
    ..animationStyle = EasyLoadingAnimationStyle.scale
    ..textColor = Colors.black
    ..backgroundColor = Colors.grey[200]
    ..userInteractions = false
    ..dismissOnTap = false;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: Strings.appName,
      debugShowCheckedModeBanner: false,
      theme: Get.isDarkMode ? darkThemeData : themeData,
      transitionDuration: const Duration(milliseconds: 250),
      defaultTransition: Transition.cupertino,
      routes: Routes.all(),
      builder: EasyLoading.init(),
      translations: Messages(),
      locale: Get.deviceLocale, // translations will be displayed in that locale
      fallbackLocale: const Locale('en', 'US'),
    );
  }
}
