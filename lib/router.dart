import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/beranda/presentation/screen/beranda_asn_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/screen/data_kepegawaian_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/screen/create_new_meeting_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/screen/meeting_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/screen/profile_screen.dart';
import 'package:kemenag_go_internal_app/core/util/coming_soon.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_model.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/screen/beranda_screen.dart';
import 'core/resources/routes.dart';
import 'feature/daftar/persentation/screen/daftar_screen.dart';
import 'feature/daftar_sukses/presentation/screen/daftar_sukses_screen.dart';
import 'feature/login/persentation/screen/login_screen.dart';
import 'feature/news/presentation/screen/news_screen.dart';
import 'feature/news_detail/presentation/screen/news_detail.dart';
import 'feature/reset_password/presentation/screen/reset_password_screen.dart';
import 'feature/reset_password_sukses/presentation/screen/reset_password_sukses_screen.dart';
import 'feature/splash/persentation/screen/splash_screen.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case vospayDashboardRoute:
      //   ArgumentDashboardModel argumentDashboardModel =
      //       settings.arguments as ArgumentDashboardModel;
      //   return PageRouteBuilder(
      //       pageBuilder: (_, __, ___) =>
      //           VospayDashboardScreen(argumentDashboardModel),
      //       transitionsBuilder: (_, a, __, c) =>
      //           FadeTransition(opacity: a, child: c));

      // case vospayWebviewRoute:
      //   bool isActive = settings.arguments;
      //   return PageRouteBuilder(
      //       pageBuilder: (_, __, ___) => VospayWebScreen(isActive),
      //       transitionsBuilder: (_, a, __, c) =>
      //           FadeTransition(opacity: a, child: c));
      case splashRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => SplashScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case berandaRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => BerandaScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case loginRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case daftarRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => DaftarScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case daftarSuksesRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => DaftarSuksesScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case resetPasswordSuksesRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ResetPasswordSuksesScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case resetPasswordRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ResetPasswordScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case newsRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => NewsScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case detailNewsRoute:
        Datas datas = settings.arguments as Datas;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => NewsDetailScreen(datas: datas),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case berandaAsnRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => BerandaAsnScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case meetingRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => MeetingScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case createNewMeetingRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => CreateNewMeetingScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case comingSoonRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ComingSoon(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case dataKepegawaianRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => DataKepegawaianScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case profilRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ProfileScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
