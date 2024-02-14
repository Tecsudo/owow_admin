import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:owow_admin/src/model/campaign_model.dart';
import 'package:owow_admin/src/view/common/background.dart';
import 'package:provider/provider.dart';

import '../../../config/router/route_name.dart';
import '../../core/constants/gap_constant.dart';
import '../../core/constants/size_constant.dart';
import '../../provider/data.dart';
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
        SizedBox(
          height: 700,
          width: 800,
          child: Consumer<DataProvider>(builder: (context, value, child) {
            if (value.isLoading && value.campaignModel == null) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView.builder(
              itemCount: value.campaignModel?.data.count,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _filledTile(
                    context,
                    campaignDataModel: value.campaignModel!.data.data[index],
                  ),
                );
              },
            );
          }),
        ),
      ],
    );
  }

  void _dialog(
    BuildContext context, {
    required CampaignDataModel campaignModel,
  }) {
    showDialog<Widget>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Campaign Details'),
            content: SizedBox(
              width: 350,
              height: 200,
              child: RichText(
                text: TextSpan(
                  text: 'Question: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: campaignModel.questionsQuery,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(
                      text: '\nQuestion type: ',
                    ),
                    TextSpan(
                      text: campaignModel.questionType,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(
                      text: '\nChoice: ',
                    ),
                    TextSpan(
                      text: campaignModel.answerChoices,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(
                      text: '\nDiscounted item: ',
                    ),
                    TextSpan(
                      text: campaignModel.item,
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(
                      text: '\nDiscount: ',
                    ),
                    TextSpan(
                      text: campaignModel.discount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(
                      text: '\nCoupon remaining: ',
                    ),
                    TextSpan(
                      text: campaignModel.remaining.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    const TextSpan(
                      text: '\nExpiry date: ',
                    ),
                    TextSpan(
                      text: DateFormat.yMMMd().format(campaignModel.expiryDate),
                      style: const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('close'),
              ),
            ],
          );
        });
  }

  Widget _filledTile(
    BuildContext context, {
    required CampaignDataModel campaignDataModel,
  }) {
    return GestureDetector(
      onTap: () => _dialog(context, campaignModel: campaignDataModel),
      child: Container(
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
              campaignDataModel.questionsQuery,
              style: const TextStyle(
                color: Color(0xFF132513),
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }

/*   Widget _filledTile(
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
  } */
}
