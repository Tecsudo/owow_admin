import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/core/constants/gap_constant.dart';

import '../../../config/router/route_name.dart';
import '../common/background.dart';
import '../common/custom_button.dart';

class AddCampaignPage extends StatefulWidget {
  const AddCampaignPage({super.key});

  @override
  State<AddCampaignPage> createState() => _AddCampaignPageState();
}

class _AddCampaignPageState extends State<AddCampaignPage> {
  final _campaignFormFormKey = GlobalKey<FormState>();

  final _questionController = TextEditingController();
  final _optionsController = TextEditingController();

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
    return Form(
      key: _campaignFormFormKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 450,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7CAA9),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      controller: _questionController,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Question',
                        helperText: 'Question',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Question ';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFB7CAA9),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: TextFormField(
                      controller: _optionsController,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Option',
                        helperText: 'Option',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Question';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          CustomGradientElevatedButton(
            minimumSize: const Size(313, 60),
            buttonText: Text(
              'Add Option',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontWeight: FontWeight.w600),
            ),
            onPressed: () => context.pop(),
          ),
          GapConstant.h12,
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
    );
  }
  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _rightLayout(context),
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
            'Add Option',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => context.pop(),
        ),
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
    );
  } */
}
