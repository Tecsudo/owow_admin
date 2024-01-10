import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/provider/temp.dart';
import 'package:owow_admin/src/view/common/background.dart';
import 'package:provider/provider.dart';

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
        SizedBox(
          height: 60,
          width: 700,
          child: Row(
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
              GapConstant.w20,
              CustomGradientElevatedButton(
                minimumSize: const Size(313, 60),
                buttonText: Text(
                  'Add Discount',
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontWeight: FontWeight.w600),
                ),
                onPressed: () => context.goNamed(RouteNames.discounts.name),
              ),
            ],
          ),
        ),
        GapConstant.h56,
        SizedBox(
          height: 700,
          width: 800,
          child: Consumer<CampaignProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.campaignList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _filledTile(
                    context,
                    title: value.campaignList[index],
                    onDelete: () {
                      value.removeCampaign(index);
                      setState(() {});
                      log('delete $index');
                    },
                  ),
                );
              },
            );
          }),
        ),
        // _filledTile(context, title: 'Does the food tastes good?'),
        // GapConstant.h12,
        // _filledTile(context, title: 'Is the ambiance good?'),
        // GapConstant.h12,
        // _filledTile(context, title: 'Does the food tastes good?'),
        // GapConstant.h12,
        // _filledTile(context, title: 'Is the ambiance good?'),
      ],
    );
  }

  Widget _filledTile(
    BuildContext context, {
    required String title,
    required Function onDelete,
  }) {
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
          IconButton(
            onPressed: () => onDelete(),
            icon: const Icon(
              Icons.delete,
              color: Color(0xFF132513),
              size: 24,
            ),
          ),
          GapConstant.w12,
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: Color(0xFF132513),
              size: 24,
            ),
          ),
          GapConstant.w12,
        ],
      ),
    );
  }
}
