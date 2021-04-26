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
}
