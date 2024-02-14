import 'dart:convert';

class CampaignModel {
  final int status;
  final String message;
  final Data data;

  CampaignModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CampaignModel.fromJson(str) => CampaignModel.fromMap(str);

  String toJson() => json.encode(toMap());

  factory CampaignModel.fromMap(Map<String, dynamic> json) => CampaignModel(
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
  final List<CampaignDataModel> data;

  Data({
    required this.count,
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<CampaignDataModel>.from(
            json["data"].map((x) => CampaignDataModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "count": count,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class CampaignDataModel {
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
  final String image;
  final int user;

  CampaignDataModel({
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
    required this.image,
    required this.user,
  });

  factory CampaignDataModel.fromJson(String str) =>
      CampaignDataModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CampaignDataModel.fromMap(Map<String, dynamic> json) =>
      CampaignDataModel(
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
        image: json["image"],
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
        "item": item,
        "discount": discount,
        "expiry_date": expiryDate.toIso8601String(),
        "total_coupons": totalCoupons,
        "remaining": remaining,
        "image": image,
        "user": user,
      };
}





/* import 'dart:convert';

class CampaignModel {
  final int status;
  final String message;
  final Data data;

  CampaignModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CampaignModel.fromJson(str) => CampaignModel.fromMap(str);

  factory CampaignModel.fromMap(Map<String, dynamic> json) => CampaignModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromMap(json["data"]),
      );
}

class Data {
  final int count;
  final List<CampaignDataModel> data;

  Data({
    required this.count,
    required this.data,
  });

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  factory Data.fromMap(Map<String, dynamic> json) => Data(
        count: json["count"],
        data: List<CampaignDataModel>.from(
            json["data"].map((x) => CampaignDataModel.fromMap(x))),
      );
}

class CampaignDataModel {
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
  final String image;
  final int discount;
  final DateTime expiryDate;
  final int totalCoupons;
  final int remaining;
  final int user;

  CampaignDataModel({
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
    required this.image,
    required this.discount,
    required this.expiryDate,
    required this.totalCoupons,
    required this.remaining,
    required this.user,
  });

  factory CampaignDataModel.fromJson(String str) =>
      CampaignDataModel.fromMap(json.decode(str));

  factory CampaignDataModel.fromMap(Map<String, dynamic> json) =>
      CampaignDataModel(
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
        image: json["image"],
        discount: json["discount"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        totalCoupons: json["total_coupons"],
        remaining: json["remaining"],
        user: json["user"],
      );
}
 */