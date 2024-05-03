import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'core/app_export.dart';
import 'firebase_options.dart';

Future<void> main() async {
  await initServices();
  bool isLogin = await PrefUtils.getIsLogin();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'bustrackingapp',
      initialBinding: InitialBindings(),
      initialRoute:isLogin?AppRoutes.homeContainerScreen: AppRoutes.loginScreen,
      // initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) {
        return AppRoutes.routesFactory(settings);
      },
      // getPages: AppRoutes.pages,
      builder: FToastBuilder(),
      // home: MyApp(),
      // navigatorKey: navigatorKey,

    ));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'bustrackingapp',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.loginScreen,
      // initialRoute: AppRoutes.initialRoute,
      onGenerateRoute: (settings) {
        return AppRoutes.routesFactory(settings);
      },
      // getPages: AppRoutes.pages,
      builder: FToastBuilder(),
      // home: MyApp(),
      // navigatorKey: navigatorKey,

    );
  }
}
initServices() async {
  log('starting services ...');

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  await Firebase.initializeApp(
    // name: "subdsd",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  log('All services started...');
}