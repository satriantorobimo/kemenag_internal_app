import 'package:flutter/material.dart';

import 'core/resources/string_utils.dart';

enum Flavor { DEV, STAGGING, PRODUCTION }

class FlavorValues {
  FlavorValues({@required this.baseUrl});
  final String baseUrl;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig _instance;

  factory FlavorConfig(
      {@required Flavor flavor, @required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(
        flavor, StringUtils.enumName(flavor.toString()), values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);
  static FlavorConfig get instance {
    return _instance;
  }

  static bool isProduction() => _instance.flavor == Flavor.PRODUCTION;
  static bool isDevelopment() => _instance.flavor == Flavor.DEV;
  static bool isGC() => _instance.flavor == Flavor.STAGGING;
}
