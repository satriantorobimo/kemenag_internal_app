import 'package:get_it/get_it.dart';
import 'package:kemenag_go_internal_app/core/function/push_notification_service.dart';

import 'navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<NavigationService>(() => NavigationService());
  locator.registerLazySingleton<PushNotificationService>(
      () => PushNotificationService());
}
