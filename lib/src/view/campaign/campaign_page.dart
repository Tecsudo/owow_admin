import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/view/common/background.dart';

import '../../../config/router/route_name.dart';
import '../../core/constants/gap_constant.dart';
import '../../core/constants/size_constant.dart';
import '../common/custom_button.dart';

class CampaignPage extends StatefulWidget {
  const CampaignPage({super.key});

  @override
  State<CampaignPage> createState() => _CampaignPageState();
}

class _CampaignPageState extends State<CampaignPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
        child: Center(
          child: _rightLayout(context),
        ),
      ),
    );
  }

  Widget _rightLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomGradientElevatedButton(
          minimumSize: const Size(313, 60),
          buttonText: Text(
            'Add Campaign',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => context.goNamed(RouteNames.addCampaign.name),
        ),
        GapConstant.h56,
        _filledTile(context, title: 'Does the food tastes good?'),
        GapConstant.h12,
        _filledTile(context, title: 'Is the ambiance good?'),
        GapConstant.h12,
        _filledTile(context, title: 'Does the food tastes good?'),
        GapConstant.h12,
        _filledTile(context, title: 'Is the ambiance good?'),
      ],
    );
  }

  Widget _filledTile(BuildContext context, {required String title}) {
    return Container(
      width: 700,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: SizeConstant.p12),
      decoration: ShapeDecoration(
        color: const Color(0xFFB7CAA9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF132513),
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.delete,
            color: Color(0xFF132513),
            size: 24,
          ),
          GapConstant.w12,
          const Icon(
            Icons.edit,
            color: Color(0xFF132513),
            size: 24,
          ),
          GapConstant.w12,
        ],
      ),
    );
  }
}
