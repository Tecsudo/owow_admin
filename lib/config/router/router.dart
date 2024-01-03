import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/view/campaign/add_discoutns.dart';
import 'package:owow_admin/src/view/campaign/add_question.dart';
import 'package:owow_admin/src/view/campaign/discounts_page.dart';
import 'package:owow_admin/src/view/feedback/add_question.dart';

import '../../src/view/auth/login_page.dart';
import '../../src/view/campaign/campaign_page.dart';
import '../../src/view/feedback/feedback_page.dart';
import '../../src/view/home/home_page.dart';
import '../../src/view/insight/insight_page.dart';
import '../../src/view/review/review_page.dart';
import 'route_name.dart';

final GoRouter routerConfig = GoRouter(
  initialLocation: RouteNames.login.path,
  routes: <RouteBase>[
    GoRoute(
      path: RouteNames.login.path,
      name: RouteNames.login.name,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: RouteNames.home.path,
      name: RouteNames.home.name,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: RouteNames.insight.path,
      name: RouteNames.insight.name,
      builder: (context, state) => const InsightPage(),
    ),
    GoRoute(
      path: RouteNames.review.path,
      name: RouteNames.review.name,
      builder: (context, state) => const ReviewPage(),
    ),
    GoRoute(
      path: RouteNames.feedback.path,
      name: RouteNames.feedback.name,
      builder: (context, state) => const FeedbackPage(),
      routes: <RouteBase>[
        GoRoute(
          path: RouteNames.addQuestion.path,
          name: RouteNames.addQuestion.name,
          builder: (context, state) => const AddQuestionPage(),
        ),
      ],
    ),
    GoRoute(
      path: RouteNames.campaign.path,
      name: RouteNames.campaign.name,
      builder: (context, state) => const CampaignPage(),
      routes: <RouteBase>[
        GoRoute(
          path: RouteNames.addCampaign.path,
          name: RouteNames.addCampaign.name,
          builder: (context, state) => const AddCampaignPage(),
          routes: <RouteBase>[
            GoRoute(
              path: RouteNames.discounts.path,
              name: RouteNames.discounts.name,
              builder: (context, state) => const DiscountsPage(),
              routes: <RouteBase>[
                GoRoute(
                  path: RouteNames.addDiscounts.path,
                  name: RouteNames.addDiscounts.name,
                  builder: (context, state) => const AddDiscountsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
