import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'flavor_config.dart';
import 'main.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  HttpOverrides.global = new MyHttpOverrides();
  FlavorConfig(flavor: Flavor.DEV, values: FlavorValues(baseUrl: "STAGGING"));
  runApp(MyApp());
}
