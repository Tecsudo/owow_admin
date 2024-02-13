import 'dart:convert';

class Res {
  final int status;
  final String message;
  final List<Datum> data;

  Res({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Res.fromJson(str) => Res.fromMap(str);

  factory Res.fromMap(Map<String, dynamic> json) => Res(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );
}

class Datum {
  final int id;
  final List<String> answerChoicesList;
  final String questionsQuery;
  final DateTime createdOn;
  final DateTime updatedOn;
  final String companyName;
  final String companyUrl;
  final String answerChoices;
  final String questionType;
  final int restaurantId;
  final int user;

  Datum({
    required this.id,
    required this.answerChoicesList,
    required this.questionsQuery,
    required this.createdOn,
    required this.updatedOn,
    required this.companyName,
    required this.companyUrl,
    required this.answerChoices,
    required this.questionType,
    required this.restaurantId,
    required this.user,
  });

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        answerChoicesList:
            List<String>.from(json["answer_choices_list"].map((x) => x)),
        questionsQuery: json["questions_query"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        companyName: json["company_name"],
        companyUrl: json["company_url"],
        answerChoices: json["answer_choices"],
        questionType: json["question_type"],
        restaurantId: json["restaurant_id"],
        user: json["user"],
      );
}



// Future<int> addFeedbackQuestions({
//   String name = '',
// }) async {
//   log(AppConstant.jwtToken ?? 'error', name: 'addFeedbackQuestions');

//   var url = Uri.parse('http://faraz369.pythonanywhere.com/api/questioning/');
//   var headers = {
//     'Content-Type': 'application/json',
//     'Accept': '*/*',
//     'Authorization': 'Bearer ${AppConstant.jwtToken}',
//     'Cookie': 'jwt=${AppConstant.jwtToken}',
//   };
//   http.Response? response = await http.post(url,
//       headers: headers,
//       body: json.encode({
//         "questions_query": "Are You Boy",
//         "company_name": "SUBWAY",
//         "company_url": "www.url.com",
//         "answer_choices": "YES,NO",
//         "question_type": "multiple choice",
//         "restaurant_id": 1
//       }));
//   if (response.statusCode != 200) {
//     var body = response.body;
//     log(body, name: 'addFeedbackQuestions');
//   } else {
//     var res = Res.fromJson(jsonDecode(response.body));
//     log(res.toString(), name: 'addFeedbackQuestions');
//   }

//   // var headers = {
//   //   'Content-Type': 'application/json',
//   //   'Authorization': 'Bearer ${AppConstant.jwtToken}',
//   //   'Cookie': 'jwt=${AppConstant.jwtToken}',
//   //   'X-API-Key': '${AppConstant.jwtToken}',
//   // };
//   // var request = http.Request(
//   //     'POST', Uri.parse('http://faraz369.pythonanywhere.com/api/questioning/'));
//   // request.body = json.encode({
//   //   "questions_query": "Are You Boy",
//   //   "company_name": "SUBWAY",
//   //   "company_url": "www.url.com",
//   //   "answer_choices": "YES,NO",
//   //   "question_type": "multiple choice",
//   //   "restaurant_id": 1
//   // });
//   // request.headers.addAll(headers);

//   // http.StreamedResponse response = await request.send();

//   // if (response.statusCode == 200) {
//   //   log(response.stream.bytesToString() as String,
//   //       name: 'addFeedbackQuestions');
//   // } else {
//   //   log(response.reasonPhrase.toString(), name: 'addFeedbackQuestions');
//   // }

// /*   var headers = {
//     'Content-Type': 'application/json',
//     'Authorization': 'Bearer ${AppConstant.jwtToken}',
//     'Cookie': 'jwt=${AppConstant.jwtToken}',
//     'X-API-Key': '${AppConstant.jwtToken}',
//   };
//   var data = json.encode({
//     "questions_query": "Are You Boy",
//     "company_name": "SUBWAY",
//     "company_url": "www.url.com",
//     "answer_choices": "YES,NO",
//     "question_type": "multiple choice",
//     "restaurant_id": 1
//   });
//   var dio = Dio();
//   var response = await dio.request(
//     'http://faraz369.pythonanywhere.com/api/questioning/',
//     options: Options(
//       method: 'POST',
//       headers: headers,
//     ),
//     data: data,
//   );

//   if (response.statusCode == 200) {
//     print(json.encode(response.data));
//     log(json.encode(response.data), name: 'addFeedbackQuestions');
//   } else {
//     print(response.statusMessage);
//     log(response.statusMessage.toString(), name: 'addFeedbackQuestions');
//   } */
//   return response.statusCode;
// }
