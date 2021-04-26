import 'package:flutter/material.dart';

import 'core/design_system/colors.dart';
import 'core/design_system/fonts.dart';
import 'core/resources/routes.dart';
import 'core/resources/strings.dart';
import 'router.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Strings.appName,
        builder: (context, child) => MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child),
        theme: ThemeData(
            primaryColor: DSColor.primaryGreen, fontFamily: DSFont.Roboto),
        onGenerateRoute: Routers.generateRoute,
        initialRoute: splashRoute);
  }
}
