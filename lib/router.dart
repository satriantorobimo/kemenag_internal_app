import 'package:flutter/material.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/screen/absensi_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/screen/do_absen_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/screen/log_absen_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/presentation/screen/success_absen_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/beranda/presentation/screen/beranda_asn_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/screen/data_kepegawaian_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/screen/data_utama_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/screen/riwayat_golongan_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/screen/riwayat_jabatan_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/presentation/screen/riwayat_pendidikan_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/edit_password/presentation/screen/edit_password_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/edit_profile/presentation/screen/edit_profile_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/edocument/presentation/screen/edocument_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/screen/forum_comment.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/screen/forum_detail.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/presentation/screen/forum_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/info_statker/presentation/screen/info_statker.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/screen/create_new_meeting_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/meeting/presentation/screen/meeting_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/absensi/data/model/argument_absen_model.dart';
import 'package:kemenag_go_internal_app/asn/feature/profile/presentation/screen/profile_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/ubah_photo_profile/presentation/screen/ubah_photo_profile_screen.dart';
import 'package:kemenag_go_internal_app/core/util/coming_soon.dart';
import 'package:kemenag_go_internal_app/feature/beranda/data/model/news_model.dart';
import 'package:kemenag_go_internal_app/feature/beranda/presentation/screen/beranda_screen.dart';
import 'package:kemenag_go_internal_app/feature/login_non_asn/presentation/screen/login_non_asn_screen.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/beranda/presentation/screen/beranda_screen.dart';
import 'package:kemenag_go_internal_app/non_asn/feature/profile/presentation/screen/profile_screen.dart';
import 'core/resources/routes.dart';
import 'feature/daftar/persentation/screen/daftar_screen.dart';
import 'feature/daftar_sukses/presentation/screen/daftar_sukses_screen.dart';
import 'feature/login/persentation/screen/login_screen.dart';
import 'feature/news/presentation/screen/news_screen.dart';
import 'feature/news_detail/presentation/screen/news_detail.dart';
import 'feature/reset_password/presentation/screen/reset_password_screen.dart';
import 'feature/reset_password_sukses/presentation/screen/reset_password_sukses_screen.dart';
import 'feature/splash/persentation/screen/splash_screen.dart';
import 'package:kemenag_go_internal_app/asn/feature/forum/data/list_forum_model.dart'
    as ForumData;
import 'package:kemenag_go_internal_app/asn/feature/data_kepagawaian/data/data_kepegawaian_model.dart'
    as DataKepegawaian;

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

      case loginNonAsnRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => LoginNonAsnScreen(),
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

      case berandaNonAsnRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => BerandaNonAsnScreen(),
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

      case profilNonAsnRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ProfileNonAsnScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case forumRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ForumScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case forumDetailRoute:
        ForumData.Datas datas = settings.arguments as ForumData.Datas;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ForumDetailScreen(datas),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case commentForumRoute:
        String id = settings.arguments;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => ForumCommentScreen(
                  id,
                ),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case editProfileRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => EditProfileScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case editPasswordRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => EditPasswordScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case ubahPhotoProfileRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => UbahPhotoProfileScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case infoStatkerRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => InfoStatkerScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case absensiRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => AbsensiScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case doAbsenROute:
        ArgumentAbsenModel datas = settings.arguments as ArgumentAbsenModel;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => DoAbsenScreen(datas),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case successAbsenRoute:
        String message = settings.arguments;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => SuccessAbsenScreen(message),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case dataUtamaRoute:
        DataKepegawaian.Datas datas =
            settings.arguments as DataKepegawaian.Datas;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => DataUtamaScreen(datas),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case riwayatPendidikanRoute:
        DataKepegawaian.Datas datas =
            settings.arguments as DataKepegawaian.Datas;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => RiwayatPendidikanScreen(datas),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case riwayatJabatanRoute:
        DataKepegawaian.Datas datas =
            settings.arguments as DataKepegawaian.Datas;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => RiwayatJabatanScreen(datas),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case riwayatGolonganRoute:
        DataKepegawaian.Datas datas =
            settings.arguments as DataKepegawaian.Datas;
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => RiwayatGolonganScreen(datas),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case edocumentRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => EdocumentScreen(),
            transitionsBuilder: (_, a, __, c) =>
                FadeTransition(opacity: a, child: c));

      case logAbsenRoute:
        return PageRouteBuilder(
            pageBuilder: (_, __, ___) => LogAbsenScreen(),
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
