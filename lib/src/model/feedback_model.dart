import 'dart:convert';

class ResModel {
  final int status;
  final String message;
  final Data data;

  ResModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ResModel.fromJson(str) => ResModel.fromMap(str);

  factory ResModel.fromMap(Map<String, dynamic> json) => ResModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  final int count;
  final List<DataModel> data;

  Data({
    required this.count,
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        count: json["count"],
        data:
            List<DataModel>.from(json["data"].map((x) => DataModel.fromMap(x))),
      );
}

class DataModel {
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
  final String item;
  final int discount;
  final DateTime expiryDate;
  final int totalCoupons;
  final int remaining;
  final int user;

  DataModel({
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
    required this.item,
    required this.discount,
    required this.expiryDate,
    required this.totalCoupons,
    required this.remaining,
    required this.user,
  });

  factory DataModel.fromJson(String str) => DataModel.fromMap(json.decode(str));

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
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
        item: json["item"],
        discount: json["discount"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        totalCoupons: json["total_coupons"],
        remaining: json["remaining"],
        user: json["user"],
      );
}
