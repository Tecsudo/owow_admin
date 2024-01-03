import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/view/common/background.dart';

import '../../../config/router/route_name.dart';
import '../../core/constants/gap_constant.dart';
import '../../core/constants/size_constant.dart';
import '../common/custom_button.dart';

class DiscountsPage extends StatefulWidget {
  const DiscountsPage({super.key});

  @override
  State<DiscountsPage> createState() => _DiscountsPageState();
}

class _DiscountsPageState extends State<DiscountsPage> {
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
            'Add Discount',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => context.goNamed(RouteNames.addDiscounts.name),
        ),
        GapConstant.h56,
        _filledTile(context, title: '15% off on crown crust Pizza'),
        GapConstant.h12,
        _filledTile(context, title: '15% off on crown crust Pizza'),
        GapConstant.h12,
        _filledTile(context, title: '15% off on crown crust Pizza'),
        GapConstant.h12,
        _filledTile(context, title: '15% off on crown crust Pizza'),
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
