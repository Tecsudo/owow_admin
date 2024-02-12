import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:owow_admin/src/provider/temp.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/constants/gap_constant.dart';
import '../common/background.dart';
import '../common/custom_button.dart';

class AddDiscountsPage extends StatefulWidget {
  const AddDiscountsPage({super.key});

  @override
  State<AddDiscountsPage> createState() => _AddDiscountsPageState();
}

class _AddDiscountsPageState extends State<AddDiscountsPage> {
  final _campaignFormFormKey = GlobalKey<FormState>();

  final _itemController = TextEditingController();
  final _discountController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _couponCount = TextEditingController();

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
                      controller: _itemController,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Item',
                        helperText: 'Item',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Item ';
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
                      controller: _discountController,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Discount',
                        helperText: 'Discount',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Discount';
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
                      onTap: () => _onTapDateTimePicker(),
                      controller: _expiryDateController,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Expiry Date',
                        helperText: 'Expiry Date',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Expiry Date';
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
                      controller: _couponCount,
                      enableSuggestions: false,
                      style: const TextStyle(
                        color: Color(0xFF132513),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'No of Coupons',
                        helperText: 'No of Coupons',
                        hintStyle:
                            Theme.of(context).textTheme.bodyLarge?.copyWith(
                                  color: const Color(0xFF5E6E59),
                                ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter No of Coupons';
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
          SizedBox(
            height: 60,
            width: 700,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomGradientElevatedButton(
                  minimumSize: const Size(200, 60),
                  buttonText: Text(
                    'Save',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () {
                    if (_campaignFormFormKey.currentState!.validate()) {
                      _campaignFormFormKey.currentState!.save();
                      _addToDiscountList('${_itemController.text} '
                          ' ${_discountController.text} discount');
                      context.pop();
                    }
                  },
                ),
                GapConstant.w20,
                CustomGradientElevatedButton(
                  minimumSize: const Size(200, 60),
                  buttonText: Text(
                    'Cancel',
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary,
                        fontWeight: FontWeight.w600),
                  ),
                  onPressed: () => context.pop(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _addToDiscountList(String text) =>
      Provider.of<DiscountProvider>(context, listen: false).addDiscount(text);

  void _onTapDateTimePicker() {
    showDialog<Widget>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              width: 400,
              height: 500,
              child: SfDateRangePicker(
                showTodayButton: true,
                showActionButtons: true,
                onSubmit: (Object? value) {
                  log('value: $value');
                  if (value != null) {
                    log('value: $value');
                    _expiryDateController.text =
                        DateFormat.yMMMd().format(value as DateTime);
                  }
                  Navigator.pop(context);
                },
                onCancel: () {
                  Navigator.pop(context);
                },
              ),
            ),
          );
        });
  }
}
