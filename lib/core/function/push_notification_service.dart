import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:kemenag_go_internal_app/core/function/local_notification.dart';
import 'package:kemenag_go_internal_app/core/function/setup_locator.dart';

import 'navigation_service.dart';

class PushNotificationService {
  final FirebaseMessaging _fcm = FirebaseMessaging();
  final NavigationService _navigationService = locator<NavigationService>();
  final LocalNotificationService _localNotificationService =
      LocalNotificationService();

  Future<void> initialize() async {
    _localNotificationService.initialize();
    if (Platform.isIOS) {
      // request permissions if we're on ios
      _fcm.requestNotificationPermissions(const IosNotificationSettings(
          alert: true, sound: true, badge: true, provisional: false));

      _fcm.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print('Settings registered: $settings');
      });
    }

    if (Platform.isIOS) {
      _fcm.requestNotificationPermissions(const IosNotificationSettings());
    }

    _fcm.getToken().then((value) {
      print('Tokennnn : $value');
    });

    _fcm.configure(
      // Called when the app is in the foreground and we receive a push notification
      onMessage: (Map<String, dynamic> message) async {
        print('onMessage: $message');
        final dynamic notification = message['notification'];

        if (Platform.isIOS) {
          _localNotificationService.showNotification(
              0, message['title'], message['body'],
              message: message);
        } else
          _localNotificationService.showNotification(0,
              notification['title'].toString(), notification['body'].toString(),
              message: message);
      },
      // Called when the app has been closed comlpetely and it's opened
      // from the push notification.
      onLaunch: (Map<String, dynamic> message) async {
        print('onLaunch: $message');
        _serialiseAndNavigateOnLaunch(message);
      },
      // Called when the app is in the background and it's opened
      // from the push notification.
      onResume: (Map<String, dynamic> message) async {
        print('onResume: $message');
        _serialiseAndNavigate(message);
      },
    );

    _fcm.setAutoInitEnabled(true);
  }

  //FCM Subscribe Topic
  Future<void> fcmSubscribe(String topic) async {
    await _fcm.subscribeToTopic(topic);
  }

  //FCM Unsubscribe Topic
  Future<void> fcmUnSubscribe(String topic) async {
    await _fcm.unsubscribeFromTopic(topic);
    // await _fcm.deleteInstanceID().then((value) => print(value));
  }

  Future<void> _serialiseAndNavigate(Map<String, dynamic> message) async {
    print('onResumeSerialise: $message');
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
  }

  Future<void> _serialiseAndNavigateOnLaunch(
      Map<String, dynamic> message) async {
    print('onLaunchSerialise: $message');
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
    //     Future<void>.delayed(const Duration(seconds: 5), () async {
    //       _navigationService.push(
    //         notifDetail,
    //         arguments: PushNotif(
    //             title: title,
    //             description: desc,
    //             notif_id: notifId,
    //             is_read: false,
    //             created_date: createdDate),
    //       );
    //     });
    //   }
    // }
  }
}
