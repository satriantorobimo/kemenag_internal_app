import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkUtil {
  factory NetworkUtil() => _instance;
  NetworkUtil.internal();

  static final NetworkUtil _instance = NetworkUtil.internal();

  final JsonDecoder _decoder = const JsonDecoder();

  String newAccessToken = '';

  Future<dynamic> get(String url, {Map<String, dynamic> headers}) async {
    return http.get(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403 ||
          statusCode == 400) {
        return _decoder.convert(res);
      } else {
        throw Exception(res);
      }
    }).catchError((dynamic err) {
      throw Exception(err);
    }); //.timeout(Duration(milliseconds: 10000));
  }

  Future<dynamic> getParam(String url,
      {Map<String, dynamic> headers,
      Map<String, String> queryParameters}) async {
    final Uri uri = Uri.http(url, '/path', queryParameters);
    return http.get(uri, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403 ||
          statusCode == 400) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while fetching data');
      }
    }).catchError((dynamic err) => throw Exception(
        'Error while fetching data')); //.timeout(Duration(milliseconds: 10000));
  }

  Future<dynamic> post(String url,
      {Map<String, dynamic> headers, String body}) async {
    return http
        .post(url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(headers);
      print(body);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403 ||
          statusCode == 400) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while fetching data');
      }
    }).catchError(
            (dynamic err) => throw Exception('Error while fetching data'));
  }

  Future<dynamic> postMultiPart(
      String url, String fileName, String token) async {
    final http.MultipartRequest request =
        http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('files', fileName));
    request.headers.addAll({
      'Content-Type': 'multipart/form-data',
      'Authorization': 'Bearer $token'
    });
    final http.Response res =
        await http.Response.fromStream(await request.send());

    print("Result: ${res.statusCode}");

    if (res.statusCode == 200 ||
        res.statusCode == 201 ||
        res.statusCode == 202 ||
        res.statusCode == 206 ||
        res.statusCode == 401 ||
        res.statusCode == 403 ||
        res.statusCode == 400) {
      return _decoder.convert(res.body);
    } else {
      return throw Exception('Error while fetching data');
    }
  }

  Future<dynamic> put(String url,
      {Map<String, dynamic> headers, String body}) async {
    return http
        .put(url, body: body, headers: headers)
        .then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(body);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403 ||
          statusCode == 400) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while fetching data');
      }
    }).catchError(
            (dynamic err) => throw Exception('Error while fetching data'));
  }

  Future<dynamic> delete(String url, {Map<String, dynamic> headers}) async {
    return http.delete(url, headers: headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      print(url);
      print(response.statusCode);
      print(response.body);

      if (statusCode == 200 ||
          statusCode == 201 ||
          statusCode == 202 ||
          statusCode == 206 ||
          statusCode == 401 ||
          statusCode == 403 ||
          statusCode == 400) {
        return _decoder.convert(res);
      } else {
        throw Exception('Error while executing data');
      }
    }).catchError(
        (dynamic err) => throw Exception('Error while executing data'));
  }
}
