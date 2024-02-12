import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/constants/app_constant.dart';
import '../core/services/net_services.dart';
import '../model/feedback_model.dart';
import 'user_feadback.dart';

class FeedbackProvider extends ChangeNotifier {
  final networkService = GenericApi();
  bool isLoading = false;
  bool isBack = false;
  FeedbackModel? _feedbackModel;

  FeedbackModel? get feedbackModel => _feedbackModel;

  Future<int> addFeedbackQuestions({
    String name = '',
  }) async {
    var url = 'https://faraz369.pythonanywhere.com/api/questioning/';

    var response = await networkService.postApi(url, body: {
      "questions_query": "Are You Boy",
      "company_name": "SUBWAY",
      "company_url": "www.url.com",
      "answer_choices": "YES,NO",
      "question_type": "multiple choice",
      "restaurant_id": 1
    }, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${AppConstant.jwtToken}',
    });
    log(response.toString(), name: 'addFeedbackQuestions1');

    var res = Res.fromJson(response);
    log(res.toString(), name: 'addFeedbackQuestions');

    return 200;
  }

  // 03001234568
  Future<void> getFeedbackQuestions() async {
    isLoading = true;
    notifyListeners();
    var url =
        'https://faraz369.pythonanywhere.com/api/questioning/?restaurant_id=1';

    var response = await networkService.getApi(url, headers: {
      'Authorization': 'Bearer ${AppConstant.jwtToken}',
    });
    _feedbackModel = FeedbackModel.fromJson(response);
    isLoading = false;
    notifyListeners();
  }

  //temporary list of feedback
  List<String> _feedbackList = <String>[
    'Does the food tastes good?',
    'Is the ambiance good?',
    'Does the food tastes good?',
    'Is the ambiance good?'
  ];
  List<String> get feedbackList => _feedbackList;

  set feedbackList(List<String> value) {
    _feedbackList = value;
    notifyListeners();
  }

  void addFeedback(String campaign) {
    _feedbackList.add(campaign);
    notifyListeners();
  }

  void removeFeedback(int index) {
    _feedbackList.removeAt(index);
    notifyListeners();
  }
}
