import 'dart:convert';

class FeedbackModel {
  final int status;
  final String message;
  final Data data;

  FeedbackModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FeedbackModel.fromJson(str) => FeedbackModel.fromMap(str);

  String toJson() => json.encode(toMap());

  factory FeedbackModel.fromMap(Map<String, dynamic> json) => FeedbackModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": data.toMap(),
      };
}

class Data {
  final int count;
  final List<FeedbackData> data;

  Data({
    required this.count,
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<FeedbackData>.from(
            json["data"].map((x) => FeedbackData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class FeedbackData {
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

  FeedbackData({
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

  factory FeedbackData.fromJson(String str) =>
      FeedbackData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeedbackData.fromMap(Map<String, dynamic> json) => FeedbackData(
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

  Map<String, dynamic> toMap() => {
        "id": id,
        "answer_choices_list":
            List<dynamic>.from(answerChoicesList.map((x) => x)),
        "questions_query": questionsQuery,
        "created_on": createdOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
        "company_name": companyName,
        "company_url": companyUrl,
        "answer_choices": answerChoices,
        "question_type": questionType,
        "restaurant_id": restaurantId,
        "user": user,
      };
}