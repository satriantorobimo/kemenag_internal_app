import 'dart:convert';
import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:kemenag_go_internal_app/core/function/navigation_service.dart';
import 'package:kemenag_go_internal_app/core/function/setup_locator.dart';

class LocalNotificationService {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final NavigationService _navigationService = locator<NavigationService>();

  Future<dynamic> initialize() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);
  }

  Future<dynamic> onSelectNotification(String payload) async {
    if (payload != null) {
      final dynamic message = jsonDecode(payload);

      print('onSelectNotification payload: $message');

      String title;
      String desc;
      String notifId;
      String viewName;
      String createdDate;

      if (Platform.isIOS) {
        title = message['title'] as String;
        desc = message['body'] as String;
        notifId = message['notif_id'] as String;
        viewName = message['view_name'] as String;
        createdDate = message['created_at'] as String;
        print(title);
        print(desc);
        print(notifId);
        print(viewName);
        print(createdDate);
      } else {
        title = message['data']['title'] as String;
        desc = message['data']['body'] as String;
        notifId = message['data']['notif_id'] as String;
        viewName = message['data']['view_name'] as String;
        createdDate = message['data']['created_at'] as String;
        print(title);
        print(desc);
        print(notifId);
        print(viewName);
        print(createdDate);
      }

      // if (viewName == '/notif_detail') {
      //   if (notifId.isNotEmpty) {
      //     _navigationService.push(
      //       notifDetail,
      //       arguments: PushNotif(
      //           title: title,
      //           description: desc,
      //           notif_id: notifId,
      //           is_read: false,
      //           created_date: createdDate),
      //     );
      //   }
      // }
    } else {
      print('payload is null, cant get notification data');
    }
  }

  Future<dynamic> onDidReceiveLocalNotification(
      int id, String body, String data, String title) async {
    print('onDidReceiveLocalNotification = $data');

    showNotification(91, title, body, data: data);
  }

  Future<dynamic> showNotification(int id, String title, String body,
      {Map<String, dynamic> message, String data}) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'BFIApps',
      'BFIApp',
      'BFI Apps for customer',
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
      timeoutAfter: 5000,
      styleInformation: DefaultStyleInformation(true, true),
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        id, title, body, platformChannelSpecifics,
        payload: jsonEncode(message));
  }
}
