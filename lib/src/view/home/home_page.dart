import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/core/extensions/responsive_framwork.dart';

import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../config/router/route_name.dart';
import '../../core/constants/gap_constant.dart';
import '../../provider/data.dart';
import '../common/background.dart';
import '../common/custom_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() {
    Future.delayed(Duration.zero, () async {
      var provider = Provider.of<DataProvider>(context, listen: false);
      await provider.getFeedbackQuestions();
      await provider.getCampaignQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
        child: ResponsiveRowColumn(
          columnMainAxisAlignment: MainAxisAlignment.center,
          columnSpacing: 32,
          rowMainAxisAlignment: MainAxisAlignment.spaceEvenly,
          layout: context.isDisplayLargeThanDesktop
              ? ResponsiveRowColumnType.ROW
              : ResponsiveRowColumnType.ROW,
          children: [
            ResponsiveRowColumnItem(
              rowFlex: 5,
              columnOrder: 1,
              child: _leftLayout(context),
            ),
            ResponsiveRowColumnItem(
              rowFlex: 4,
              columnOrder: 2,
              child: _rightLayout(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rightLayout(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 500,
        maxWidth: 500,
        minHeight: 400,
        minWidth: 400,
      ),
      child: Image.asset(
        'assets/images/auth.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _leftLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomGradientElevatedButton(
            minimumSize: const Size(313, 60),
            buttonText: Text(
              'Feedback',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600),
            ),
            onPressed: () {
              context.goNamed(RouteNames.feedback.name);
            }),
        GapConstant.h12,
        CustomGradientElevatedButton(
          minimumSize: const Size(313, 60),
          buttonText: Text(
            'Reviews',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => context.goNamed(RouteNames.review.name),
        ),
        GapConstant.h12,
        CustomGradientElevatedButton(
          minimumSize: const Size(313, 60),
          buttonText: Text(
            'Insight',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => context.goNamed(RouteNames.insight.name),
        ),
        GapConstant.h12,
        CustomGradientElevatedButton(
          colors: const [Color(0xFFE5E7E5), Color(0xFFB9BBB9)],
          minimumSize: const Size(313, 60),
          buttonText: Text(
            'Campaigns (get premium)',
            style: Theme.of(context)
                .textTheme
                .labelLarge
                ?.copyWith(color: Colors.black, fontWeight: FontWeight.w600),
          ),
          onPressed: () => context.goNamed(RouteNames.campaign.name),
        ),
      ],
    );
  }
}
