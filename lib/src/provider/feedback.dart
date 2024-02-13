import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/constants/app_constant.dart';
import '../core/services/net_services.dart';
import '../model/feedback_model.dart';
import 'user_feedback.dart';

class DataProvider extends ChangeNotifier {
  final networkService = GenericApi();
  bool isLoading = false;
  bool isBack = false;
  FeedbackModel? _feedbackModel;

  FeedbackModel? get feedbackModel => _feedbackModel;

  Future<int> addFeedbackQuestions({
    required String question,
    required String answerChoice,
    required String questionType,
  }) async {
    var url = 'https://faraz369.pythonanywhere.com/api/questioning/';

    var response = await networkService.postApi(url, body: {
      "questions_query": question,
      "company_name": "OWOW",
      "company_url": "www.OWOW.com",
      "answer_choices": answerChoice,
      "question_type": questionType,
      "restaurant_id": AppConstant.restaurantId,
    }, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppConstant.jwtToken}',
    });
    log(response.toString(), name: 'addFeedbackQuestions1');

    var res = Res.fromJson(response);
    log(res.toString(), name: 'addFeedbackQuestions');
    return 200;
  }

  Future<int> addCampaignQuestions({
    required String question,
    required String answerChoice,
    required String questionType,
    required String item,
    required String discount,
    required String expiryDate,
    required String totalCoupons,
  }) async {
    var url = 'https://faraz369.pythonanywhere.com/api/questioning/';

    var response = await networkService.postApi(url, body: {
      "questions_query": question,
      "company_name": "OWOW",
      "company_url": "www.OWOW.com",
      "answer_choices": answerChoice,
      "question_type": questionType,
      "item": item,
      "discount": discount,
      "expiry_date": expiryDate,
      "total_coupons": totalCoupons,
      "remaining": totalCoupons,
      "restaurant_id": AppConstant.restaurantId,
    }, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppConstant.jwtToken}',
    });

    getCampaignQuestions();
    log(response.toString(), name: 'addFeedbackQuestions1');

    var res = Res.fromJson(response);
    log(res.toString(), name: 'addFeedbackQuestions');
    return 200;
  }

  Future<void> getCampaignQuestions() async {
    isLoading = true;
    notifyListeners();
    var url =
        'https://faraz369.pythonanywhere.com/api/questioning/?restaurant_id=${AppConstant.restaurantId ?? 0}';

    var response = await networkService.getApi(url, headers: {
      'Authorization': 'Bearer ${AppConstant.jwtToken}',
    });
    _feedbackModel = FeedbackModel.fromJson(response);
    isLoading = false;
    notifyListeners();
  }

  Future<void> getFeedbackQuestions() async {
    isLoading = true;
    notifyListeners();
    var url =
        'https://faraz369.pythonanywhere.com/api/questioning/?restaurant_id=${AppConstant.restaurantId ?? 0}';

    var response = await networkService.getApi(url, headers: {
      'Authorization': 'Bearer ${AppConstant.jwtToken}',
    });
    _feedbackModel = FeedbackModel.fromJson(response);
    isLoading = false;
    notifyListeners();
  }
}


/* 

{
    "questions_query":"Are You Boy",
    "company_name":"SUBWAY",
    "company_url":"www.url.com",
    "answer_choices":"YES,NO",
    "question_type":"multiple choice",
    "item" : "cake",
    "discount": 2,
    "expiry_date": "2024-01-13T15:58:31",
    "total_coupons": 12,
    "remaining" : 2,
    "restaurant_id": 3
}

 */