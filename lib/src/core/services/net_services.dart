import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class GenericApi {
  final JsonDecoder _decoder = const JsonDecoder();
  final JsonEncoder _encoder = const JsonEncoder();
  Future<dynamic> postApi(
    String urlLoader, {
    required Map body,
    required Map<String, String> headers,
  }) async {
    late http.Response response;
    try {
      response = await http.post(
        Uri.parse(urlLoader),
        body: _encoder.convert(body),
        headers: headers,
      );
    } catch (e) {
      log(e.toString(), name: 'Error | GenericApi');
    }
    final int statusCode = response.statusCode;
    final String res = response.body;

    if (statusCode < 200 || statusCode > 400) {
      throw Exception("Error while fetching data");
    }
    return _decoder.convert(res);
  }

  Future<dynamic> getApi(
    String urlLoader, {
    required Map<String, String> headers,
  }) async {
    late http.Response response;
    try {
      response = await http.get(
        Uri.parse(urlLoader),
        headers: headers,
      );
    } catch (e) {
      log(e.toString(), name: 'Error | GenericApi');
    }
    final int statusCode = response.statusCode;
    final String res = response.body;

    if (statusCode < 200 || statusCode > 400) {
      throw Exception("Error while fetching data");
    }
    // return _decoder.convert(res);
    return _decoder.convert(res);
  }
}


// import 'dart:convert';
// import 'dart:developer';
// // ignore: avoid_web_libraries_in_flutter
// import 'dart:html' as html;
// import 'package:http/http.dart' as http;

// class NetworkService {
//   final JsonDecoder _decoder = const JsonDecoder();
//   final JsonEncoder _encoder = const JsonEncoder();

//   Map<String, String> headers = {"content-type": "application/json"};
//   Map<String, String> cookies = {};

//   void _updateCookie(http.Response response) {
//     String? allSetCookie = response.headers['set-cookie'];
//     log(allSetCookie.toString(), name: '_updateCookie');

//     if (allSetCookie != null) {
//       var setCookies = allSetCookie.split(',');

//       for (var setCookie in setCookies) {
//         var cookies = setCookie.split(';');

//         for (var cookie in cookies) {
//           _setCookie(cookie);
//         }
//       }

//       headers['cookie'] = _generateCookieHeader();
//     }
//   }

//   void _setCookie(String? rawCookie) {
//     if (rawCookie != null) {
//       var keyValue = rawCookie.split('=');
//       if (keyValue.length == 2) {
//         var key = keyValue[0].trim();
//         var value = keyValue[1];

//         // ignore keys that aren't cookies
//         if (key == 'path' || key == 'expires') return;

//         cookies[key] = value;
//       }
//     }
//   }

//   String _generateCookieHeader() {
//     String cookie = "";

//     for (var key in cookies.keys) {
//       if (cookie.isNotEmpty) cookie += ";";
//       cookie += key + "=" + cookies[key]!;
//     }

//     return cookie;
//   }

//   Future<dynamic> get(String url) {
//     return http
//         .get(Uri.parse(url), headers: headers)
//         .then((http.Response response) {
//       final String res = response.body;
//       final int statusCode = response.statusCode;

//       _updateCookie(response);

//       if (statusCode < 200 || statusCode > 400) {
//         throw Exception("Error while fetching data");
//       }
//       return _decoder.convert(res);
//     });
//   }

//   Future<dynamic> post(String url, {body, encoding}) {
//     var cookies = html.window.document.cookie;

//     return http
//         .post(Uri.parse(url),
//             body: _encoder.convert(body), headers: headers, encoding: encoding)
//         .then((http.Response response) {
//       final String res = response.body;
//       final int statusCode = response.statusCode;

//       _updateCookie(response);
//       log(cookies.toString(), name: 'NetworkService');

//       if (statusCode < 200 || statusCode > 400) {
//         log(res.toString(), name: 'NetworkService');
//         throw Exception("Error while fetching data");
//       }
//       return _decoder.convert(res);
//     });
//   }

//   // Future<dynamic> post(String url, {body, encoding}) {
//   //   return http
//   //       .post(Uri.parse(url),
//   //           body: _encoder.convert(body), headers: headers, encoding: encoding)
//   //       .then((http.Response response) {
//   //     final String res = response.body;
//   //     final int statusCode = response.statusCode;

//   //     _updateCookie(response);

//   //     if (statusCode < 200 || statusCode > 400) {
//   //       throw Exception("Error while fetching data");
//   //     }
//   //     return _decoder.convert(res);
//   //   });
//   // }

//   Future<dynamic> put(String url, {body, encoding}) {
//     return http
//         .put(Uri.parse(url),
//             body: _encoder.convert(body), headers: headers, encoding: encoding)
//         .then((http.Response response) {
//       final String res = response.body;
//       final int statusCode = response.statusCode;

//       _updateCookie(response);

//       if (statusCode < 200 || statusCode > 400) {
//         throw Exception("Error while fetching data");
//       }
//       return _decoder.convert(res);
//     });
//   }
// }
