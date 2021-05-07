import '../../flavor_config.dart';

class UrlString {
  static String loginUrl = 'api/auth/login';
  final _baseUrl = FlavorConfig.instance.values.baseUrl;

  static Map<String, String> headerType = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  Map<String, String> getHeaderType() {
    return headerType;
  }

  static Map<String, String> headerTypeWithToken(String _token) => {
        'Authorization': 'Bearer $_token',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

  Map<String, String> getHeaderTypeWithToken(String _token) {
    return headerTypeWithToken(_token);
  }

  static String urlLogin() => 'api/auth/login';

  String getUrlLogin() {
    final String urlLogin2 = urlLogin();
    return _baseUrl + urlLogin2;
  }

  static String urlRegister() => 'api/auth/register';

  String getUrlRegister() {
    final String urlRegister2 = urlRegister();
    return _baseUrl + urlRegister2;
  }

  static String urlNews() => 'api/news';

  String getUrlNews() {
    final String urlNews2 = urlNews();
    return _baseUrl + urlNews2;
  }

  static String urlNewsCategory() => 'api/news-category';

  String getUrlNewsCategory() {
    final String urlNewsCategory2 = urlNewsCategory();
    return _baseUrl + urlNewsCategory2;
  }

  static String urlListForum() => 'api/forum';

  String getUrlListForum() {
    final String urlListForum2 = urlListForum();
    return _baseUrl + urlListForum2;
  }

  static String urlListForumDetail(String id) => 'api/forum/$id';

  String getUrlListForumDetail(String id) {
    final String urlListForumDetail2 = urlListForumDetail(id);
    return _baseUrl + urlListForumDetail2;
  }

  static String urlListForumDetailPagination(int id, int page) =>
      'api/forum/$id?page=$page';

  String getUrlListForumDetailPagination(int id, int page) {
    final String urlListForumDetailPagination2 =
        urlListForumDetailPagination(id, page);
    return _baseUrl + urlListForumDetailPagination2;
  }

  static String urlUploadFile() => 'api/upload-files';

  String getUrlUploadFile() {
    final String urlUploadFile2 = urlUploadFile();
    return _baseUrl + urlUploadFile2;
  }

  static String urlGetProfile(int id) => 'api/profile/$id';

  String getUrlGetProfile(int id) {
    final String urlGetProfile2 = urlGetProfile(id);
    return _baseUrl + urlGetProfile2;
  }

  static String urlAttendaceToday() => 'api/attendance-today';

  String getUrlAttendaceToday() {
    final String urlAttendaceToday2 = urlAttendaceToday();
    return _baseUrl + urlAttendaceToday2;
  }

  static String urlAttendaceMonthly() => 'api/attendance-month';

  String getUrlAttendaceMonthly() {
    final String urlAttendaceMonthly2 = urlAttendaceMonthly();
    return _baseUrl + urlAttendaceMonthly2;
  }

  static String urlAttendace() => 'api/attendance';

  String getUrlAttendace() {
    final String urlAttendace2 = urlAttendace();
    return _baseUrl + urlAttendace2;
  }

  static String urlDataKepegawaian() => 'api/employee-detail';

  String getUrlDataKepegawaian() {
    final String urlDataKepegawaian2 = urlDataKepegawaian();
    return _baseUrl + urlDataKepegawaian2;
  }

  static String urlAddDoc() => 'api/document';

  String getUrlAddDoc() {
    final String urlAddDoc2 = urlAddDoc();
    return _baseUrl + urlAddDoc2;
  }
}
