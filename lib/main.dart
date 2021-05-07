import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

import 'core/design_system/colors.dart';
import 'core/design_system/fonts.dart';
import 'core/function/navigation_service.dart';
import 'core/function/push_notification_service.dart';
import 'core/function/setup_locator.dart';
import 'core/resources/routes.dart';
import 'core/resources/strings.dart';
import 'router.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final PushNotificationService _pushNotificationService =
      PushNotificationService();

  @override
  void initState() {
    handleStartUpNotification();

    super.initState();
  }

  Future<dynamic> handleStartUpNotification() async {
    await _pushNotificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
      position: ToastPosition.top,
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.appName,
          builder: (context, child) => MediaQuery(
              data:
                  MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
              child: child),
          theme: ThemeData(
              primaryColor: DSColor.primaryGreen, fontFamily: DSFont.Roboto),
          navigatorKey: locator<NavigationService>().navigationKey,
          onGenerateRoute: Routers.generateRoute,
          initialRoute: splashRoute),
    );
  }
}
