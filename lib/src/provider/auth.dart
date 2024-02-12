import 'dart:developer';

import '../core/constants/app_constant.dart';
import '../core/services/net_services.dart';

// 03001234568
Future<int> auth({
  required String password,
  required String phone,
}) async {
  final networkService = GenericApi();

  var url = 'https://faraz369.pythonanywhere.com/api/login/';

  var response = await networkService.postApi(url, body: {
    "phone": phone,
    "password": password
  }, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${AppConstant.jwtToken}',
  });
  String x = response['jwt'];
  log(x, name: 'auth');
  AppConstant.jwtToken = response['jwt'];

  return 200;
}





/* Future<int> auth({
  required String password,
  required String phone,
}) async {
  var url = Uri.parse('https://faraz369.pythonanywhere.com/api/login/');
  var headers = {
    'Content-Type': 'application/json',
  };
  http.Response? response = await http.post(
    url,
    headers: headers,
    body: json.encode(
      {
        "phone": phone,
        "password": password,
      },
    ),
  );
  if (response.statusCode != 200) {
    log(jsonDecode(response.body)['detail']);
  } else {
    log(jsonDecode(response.body)['jwt'], name: 'auth');
    AppConstant.jwtToken = jsonDecode(response.body)['jwt'];
  }
  return response.statusCode;
} */
