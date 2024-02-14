import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../core/constants/app_constant.dart';
import '../../core/constants/gap_constant.dart';
import '../../provider/feedback.dart';
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
  final _itemController = TextEditingController();
  final _discountController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _couponCount = TextEditingController();
  final _image = TextEditingController();
  String _selectedDate = '';
  String dropdownValue = 'Multi-Option';
  bool isPictureUploaded = true;

  // void _addToCampaignList(String text) =>
  // Provider.of<CampaignProvider>(context, listen: false).addCampaign(text);

  void _addToCampaignList(String question, questionType, option, item, discount,
          expiryDate, totalCoupons) =>
      Provider.of<DataProvider>(context, listen: false).addCampaignQuestions(
          question: question,
          answerChoice: option,
          questionType: questionType,
          item: item,
          discount: discount,
          expiryDate: expiryDate,
          totalCoupons: totalCoupons);

  Future _imagePicker() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);

      if (image == null) return;
      Uint8List byteImage = await image.readAsBytes();
      String base64String = base64.encode(byteImage);
      log(byteImage.length.toString());
      log(base64String);
      setState(() => _image.text = 'data:image/png;base64,$base64String');
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }

  Widget _imageDecode(picture) {
    final splitString = picture.split(',')[1];
    final byteImage = const Base64Decoder().convert(splitString);
    return Image.memory(
      byteImage,
      width: 200,
      fit: BoxFit.fitWidth,
    );
  }

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
                  width: 313,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment(1.00, 0.00),
                        end: Alignment(-1, 0),
                        colors: [Color(0xFF4E8649), Color(0xFF76A968)],
                      ),
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ]),
                  child: DropdownButton<String>(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    alignment: Alignment.center,
                    isExpanded: true,
                    value: dropdownValue,
                    elevation: 18,
                    underline:
                        Container(height: 2, color: const Color(0xFFB7CAA9)),
                    style: const TextStyle(color: Colors.white),
                    dropdownColor: const Color(0xFF4E8649),
                    icon: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                    },
                    items: AppConstant.list
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                GapConstant.h20,
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
                        hintText: 'How was the food?',
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
                Visibility(
                    visible: dropdownValue == 'Open-Field' ? false : true,
                    child: GapConstant.h20),
                Visibility(
                  visible: dropdownValue == 'Open-Field' ? false : true,
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFB7CAA9),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 15, right: 15, top: 5),
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
                          hintText: 'Good, Bad, Average',
                          helperText: 'Add Options (,) separated',
                          hintStyle:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: const Color(0xFF5E6E59),
                                  ),
                        ),
                        validator: (value) {
                          if ((value == null || value.isEmpty) &&
                              dropdownValue != 'Open-Field') {
                            return 'Please enter an option';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                GapConstant.h20,
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
                        hintText: 'Pizza, Burger, etc.',
                        helperText: 'Discounted Item',
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
                        hintText: '49.99',
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
                        hintText: '10',
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
                InkWell(
                  onTap: (() {
                    _imagePicker();
                  }),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20.0),
                        height: 150.0,
                        width: 150.0,
                        child: _image.text != ''
                            ? _imageDecode(_image.text)
                            : Image.asset(
                                'assets/images/add_image.png',
                                fit: BoxFit.contain,
                              ),
                      ),
                      Text('Upload Picture',
                          style: TextStyle(
                            color: (isPictureUploaded && _image.text == '')
                                ? Colors.red
                                : Colors.black,
                          )),
                    ],
                  ),
                ),
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
                      _addToCampaignList(
                        _questionController.text,
                        dropdownValue,
                        _optionsController.text,
                        _itemController.text,
                        _discountController.text,
                        _selectedDate,
                        _couponCount.text,
                      );
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
          GapConstant.h12,
        ],
      ),
    );
  }

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
                    _selectedDate = value.toUtc().toIso8601String();
                    log('value: $_selectedDate');
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
