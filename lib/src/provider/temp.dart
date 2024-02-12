import 'package:flutter/material.dart';

class CampaignProvider extends ChangeNotifier {
  List<String> _campaignList = <String>[
    'Does the food tastes good?',
    'Is the ambiance good?',
    'Does the food tastes good?',
    'Is the ambiance good?'
  ];
  List<String> get campaignList => _campaignList;

  set campaignList(List<String> value) {
    _campaignList = value;
    notifyListeners();
  }

  void addCampaign(String campaign) {
    _campaignList.add(campaign);
    notifyListeners();
  }

  void removeCampaign(int index) {
    _campaignList.removeAt(index);
    notifyListeners();
  }
}

class DiscountProvider extends ChangeNotifier {
  List<String> _discountList = <String>[
    'Pizza 50% discount',
    'Burger 50% discount',
    'Deal no 1 50% discount',
    'Deal no 2 50% discount'
  ];
  List<String> get discountList => _discountList;

  set discountList(List<String> value) {
    _discountList = value;
    notifyListeners();
  }

  void addDiscount(String campaign) {
    _discountList.add(campaign);
    notifyListeners();
  }

  void removeDiscount(int index) {
    _discountList.removeAt(index);
    notifyListeners();
  }
}
