import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:owow_admin/src/core/constants/size_constant.dart';
import 'package:owow_admin/src/provider/temp.dart';
import 'package:provider/provider.dart';

import '../../../config/router/route_name.dart';
import '../../core/constants/gap_constant.dart';
import '../common/background.dart';
import '../common/custom_button.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBackground(
        child: Center(child: _rightLayout(context)),
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
            'Add Question',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.onPrimary,
                fontWeight: FontWeight.w600),
          ),
          onPressed: () => context.goNamed(RouteNames.addQuestion.name),
        ),
        GapConstant.h56,
        SizedBox(
          height: 700,
          width: 800,
          child: Consumer<FeedbackProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.feedbackList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _filledTile(
                    context,
                    title: value.feedbackList[index],
                    onDelete: () {
                      value.removeFeedback(index);
                      setState(() {});
                      log('delete $index');
                    },
                  ),
                );
              },
            );
          }),
        ),
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
