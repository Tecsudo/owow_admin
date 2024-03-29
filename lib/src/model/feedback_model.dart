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
  final List<FeedbackDataModel> data;

  Data({
    required this.count,
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<FeedbackDataModel>.from(
            json["data"].map((x) => FeedbackDataModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class FeedbackDataModel {
  final int id;
  final String questionsQuery;
  final DateTime createdOn;
  final DateTime updatedOn;
  final String questionType;
  final String answerChoices;
  final int restaurantId;
  final String image;
  final String questionCategory;
  final int user;

  FeedbackDataModel({
    required this.id,
    required this.questionsQuery,
    required this.createdOn,
    required this.updatedOn,
    required this.questionType,
    required this.answerChoices,
    required this.restaurantId,
    required this.image,
    required this.questionCategory,
    required this.user,
  });

  factory FeedbackDataModel.fromJson(String str) =>
      FeedbackDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory FeedbackDataModel.fromMap(Map<String, dynamic> json) =>
      FeedbackDataModel(
        id: json["id"],
        questionsQuery: json["questions_query"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        questionType: json["question_type"],
        answerChoices: json["answer_choices"],
        restaurantId: json["restaurant_id"],
        image: json["image"],
        questionCategory: json["question_category"],
        user: json["user"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "questions_query": questionsQuery,
        "created_on": createdOn.toIso8601String(),
        "updated_on": updatedOn.toIso8601String(),
        "question_type": questionType,
        "answer_choices": answerChoices,
        "restaurant_id": restaurantId,
        "image": image,
        "question_category": questionCategory,
        "user": user,
      };
}




/* import 'dart:convert';

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

  factory FeedbackModel.fromMap(Map<String, dynamic> json) => FeedbackModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  final int count;
  final List<FeedbackDataModel> data;

  Data({
    required this.count,
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<FeedbackDataModel>.from(
            json["data"].map((x) => FeedbackDataModel.fromMap(x))),
      );
}

class FeedbackDataModel {
  final int id;
  final String questionsQuery;
  final DateTime createdOn;
  final DateTime updatedOn;
  final String answerChoices;
  final String questionType;
  final int restaurantId;
  final String questionCategory;
  final String image;
  final int user;

  FeedbackDataModel({
    required this.id,
    required this.questionsQuery,
    required this.createdOn,
    required this.updatedOn,
    required this.answerChoices,
    required this.questionCategory,
    required this.questionType,
    required this.restaurantId,
    required this.image,
    required this.user,
  });

  factory FeedbackDataModel.fromJson(String str) =>
      FeedbackDataModel.fromMap(json.decode(str));

  factory FeedbackDataModel.fromMap(Map<String, dynamic> json) =>
      FeedbackDataModel(
        id: json["id"],
        questionsQuery: json["questions_query"],
        createdOn: DateTime.parse(json["created_on"]),
        updatedOn: DateTime.parse(json["updated_on"]),
        questionCategory: json["questionCategory"],
        answerChoices: json["answer_choices"],
        questionType: json["question_type"],
        restaurantId: json["restaurant_id"],
        image: json["image"],
        user: json["user"],
      );
}
 */