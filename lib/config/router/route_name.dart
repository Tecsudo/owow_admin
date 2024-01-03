class RouteDetails {
  final String name;
  final String path;

  const RouteDetails(this.name, this.path);
}

class RouteNames {
  static const login = RouteDetails('login', '/login');
  static const home = RouteDetails('home', '/');
  static const insight = RouteDetails('insight', '/insight');
  static const review = RouteDetails('review', '/review');
  static const feedback = RouteDetails('feedback', '/feedback');
  static const addQuestion = RouteDetails('addQuestion', 'add-question');
  static const campaign = RouteDetails('campaign', '/campaign');
  static const addCampaign = RouteDetails('addCampaign', 'add-campaign');
  static const discounts = RouteDetails('discounts', 'discounts');
  static const addDiscounts = RouteDetails('addDiscounts', 'add-discounts');
}
